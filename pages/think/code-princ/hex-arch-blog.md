---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Hexagonal-Architecture-Blog-Post
---

Even though I helped create a piece of software which supposedly implemented hexagonal architecture, it wasn't until I'd written this blog post that I really felt I *got* it. Indeed, as a way of really cementing and confirming your knowledge on a subject, I’d highly recommend presenting what you think you know for the benefit of an audience that’s new to the topic.

What you'll get here is a description of a Currency service which I helped to write at LateRooms.Com (RIP), along with a discussion of how it exemplifies hexagonal architecture. But I'll also explain where it falls short. And, just for fun, you'll get some pancakes: Dan Portella (@dmportella) and I created a ClaresPancakes solution, which was designed as a purer example of hexagonal architecture.

So, what is hexagonal architecture? Here is a diagram:

![Diagram of ports and adapters](resources/images/HexagonalArchitecture-ports-and-adapters.png)

* **yellow**:	core logic
* **light red**:	primary ports
* **light blue**:	primary adapters
* **dark red**:	secondary ports
* **dark blue**:	secondary adapters

It's all about ports and adapters. These are split into primary and secondary. 

* The **primary** ports and adapters represent the way you interact with your users
* The **secondary** ports and adapters represent the way you interact with any services you need. 

The ports are the interfaces, and the adapters represent the code which allows those interfaces to be utilised.

Examples will make this a bit more concrete:

* A **primary port** is a contract (aka interface) you share with the world. This is the behaviour you agree to provide, independent of implementation.
* A **primary adapter** will use the behaviour available on a primary port (again, regardless of implementation detail), and serve it up to the world. For instance, this could be a controller which takes in user input from a UI and passes it onto your application.
* A **secondary port** will also be an interface or contract. But this time, it is the contract which you are expecting to be fulfilled by a third party, for instance a database.
* A **secondary adapter** will be an implementation of a secondary port. For instance, this may be a data access implementation which uses SQL. 
* The **domain** is the actual logic of your application. You want to be able to implement this independently of either UI or third party services.
* !! Note that whereas **secondary adapters** are implementations of interfaces, **primary adapters** are *clients* of interfaces. The implementation of the primary ports will happen within the domain.

There's a good reason the same terms, "ports" and "adapters", are used for both clients and services - in fact, this is really the point of the model: The idea is that your core business logic should remain the same no matter what your front end looks like, *and* no matter how any third-party services are implemented. Clients and services are both "outside" as far as your domain is concerned, and therefore they can be modelled using the same concepts.

The aim is to "allow an application to equally be driven by users, programs, automated test or batch scripts, and to be developed and tested in isolation from its eventual run-time devices and databases" (from [Alistair Cockburn's article about hexagonal architecture](http://alistair.cockburn.us/Hexagonal+architecture)). I can also recommend this [Garfixia Software article](http://www.dossier-andreas.net/software_architecture/ports_and_adapters.html).

#### Hotel Distribution's Currency Service

Our Currency service effectively has a hexagonal architecture. We currently have two related solutions in our code base (available internally to LateRooms as git repos in the Hotel Distributions project):

* **Currency.SDK**
* **Currency.API**

The SDK is published internally as a NuGet package, and contains all the logic. The API is currently a Nancy app, which has its own instance of the Currency.SDK NuGet package. It is available (internally) on our network as a RESTful endpoint.

Here is an overview of the shape of the Currency.SDK solution:

![Currency.SDK](/resources/images/HexagonalArchitecture-solution-overview.jpg)

#### Currency.SDK - Primary Ports

There are two primary ports: 

* **ICurrencyConverter** - allows clients to convert monetary values from one currency to another
* **ISymbolFetcher** - clients use this to fetch currency symbols (eg "£")

Both of these ports are implemented in the domain (Currency.Engine).

#### Currency.SDK - Secondary Ports

There are several secondary ports:

* ICurrencyRepo 
* IDataCache
* IUdpErrorLogger
* ILogStashConfig

Note that at the moment, most of our ports live in the Currency.Contracts project (see "Refactoring" below for more discussion on this).

#### Currency.SDK - Secondary Adapters

Each secondary port has its own secondary adapter - these are all implementations of the relevant interfaces. For instance, **ICurrencyRepo** is implemented by **SqlCurrencyRepo**, in the **Currency.DataAccess.SQL** project.

#### Currency.SDK - Primary Adapters

We effectively have two primary adapters:

* A Nancy module - **ConverterModule** - in Currency.API. This takes UI from the REST endpoint, and passes it through to the Currency.SDK instance.
* Another Nancy module - **SymbolModule** - in Currency.API (works in the same way).

Note that if the SDK were accessible directly as a REST endpoint, then we could also have another primary adapter via SOAP UI, which would take the form of acceptance tests.

#### Currency.SDK - Dependency Injection

Our architecture was not originally properly hexagonal. Originally the Nancy API and the SDK lived in the same solution, and all the dependency injection was handled using the TinyIoC which comes for free with Nancy. This meant that we got away with giving the API project sight of all the interfaces *and* their implementations. It also meant that we didn't notice that our interfaces lived in the same project as our domain logic. 

As soon as we tried to split the API and the SDK into different solutions, this stopped working because cyclic dependencies were created when we tried to inject the SQL Data Access implementation.

What we have now is a separate project for interfaces, and we also supply our NuGet clients with a factory (**CurrencyObjectFactory**, in **Currency.Services**). They can use this to instantiate whatever they need, and it handles all the dependency injection for them (for instance it decides which data-access implementation to use, which isn't something they should care about). 

#### Currency.SDK - Refactoring

It's interesting that in the process of writing this post, I've realised there is some muddiness in the Currency.SDK solution which means that its hexagonal architecture isn't immediately apparent:

* The **Currency.Contracts** project should be the resting place for secondary ports. But there is at least one interface in here (**IErrorObserver**) which is arguably not a secondary port at all, and should be internal to the domain (the **Currency.Engine** project).
* There are several secondary adapters (eg caching and logging) which live in **Currency.Engine** (the domain), rather than their own separate projects.
* There is currently a primary port (**ISymbolFetcher**) which is in **Currency.Engine**, rather than **Currency.Contracts**.
* The other primary port (**ICurrencyConverter**) is in **Currency.Contracts** with all the secondary ports. It's therefore not clear that **ICurrencyConverter** is any different from all the other interfaces. I'd like to move it - and **ISymbolFetcher** - into a separate project which contains only primary ports. Or maybe they should live with the object factory, in **Currency.Service**?

On the back of this blog post, I now have a list of things I'd like to refactor. **But** it's worth noting that the Currency service is a small and simple piece of code. We already had a conversation, for instance, about the fact that many of the secondary ports (for instance, caching and error logging) are implemented by secondary adapters which live within the domain (the **Currency.Engine** project. This is not technically correct, but we decided that it would be over-engineering if we were to create a separate project for each secondary adapter. Feel free to disagree. :) 

Aside: The great thing about writing blog posts, or writing documentation, or even just writing notes about what you're doing: It forces you to think about what you're doing, and often allows you to spot weaknesses in your code. The same applies to explaining what you're doing out loud to another person - one of the many benefits of pair coding.

#### Clare's Pancakes 

There is a purer hexagonal example in the [Clare's Pancakes git repo](https://github.com/claresudbery/ClaresPancakes) (publicly available).

Hopefully the project structure, once you have some understanding of how hexagonal architecture is supposed to work, is reasonably self-evident. It looks like this:

![Clare's Pancakes](/resources/images/HexagonalArchitecture-Primary-and-Secondary-Adapters-in-VS.jpg)

#### Clare's Pancakes - Primary Ports

There is just one primary port, which represents the contract provided by a pancake maker (**IPancakeMaker**). It currently has just one method: **GiveMePancakes**.

Note that the **Pancake** model is also defined here, as it is needs to be surfaced to primary users.

#### Clare's Pancakes - Primary Adapters

There are two primary adapters, both handily located in a primary adapters folder:

* **Pancakes.REST.API** - an API with a module which allows you to "get" pancakes. It uses a pancake maker provided by **PancakeMakerFactory.CreatePancakeMaker**
* **Pancakes.Domain.Acceptance.Tests** - this, like the API, takes a pancake maker provided by the factory. It checks that it gives us pancakes when we ask for them. :)

#### Clare's Pancakes - Secondary Ports

* **IPancakeMixDispenser** - The pancake maker needs a dispenser to give it some pancake mix.
* **IPancakeOven** - We want to cook those pancakes.
* **PancakeMix** - this model is defined here, as it is not surfaced to primary users.

#### Clare's Pancakes - Secondary Adapters

* **Pancakes.MixDispenser.Breville** There is currently only one implementation of IPancakeMixDispenser.
* **Pancakes.Oven.Bosch** This is one implementation of IPancakeOven.
* **Pancakes.Oven.Hotpoint** This is another implementation of IPancakeOven.

#### Clare's Pancakes - Dependency Injection

If you want a pancake maker, you don't have to care what mix dispenser or what oven it uses. Just new yourself up a **PancakeMakerFactory** and call its **CreatePancakeMaker** method. It will make all the decisions about oven, etc.

#### Clare's Pancakes - Domain

**Pancakes.Domain** uses **PancakeMaker2000** to implement a pancake maker for you.

Of course, in reality you wouldn't name your projects and folders things like "primary adapters" and the like - you'd give them names that were more meaningful to your domain. But I've used these names here to make everything explicit.

I get it now. Hopefully you do too. :)

@ClareSudbery

(Clare also blogs here: [A Woman in Technology](https://medium.com/@claresudbery/blog-posts-d14731e4803d)).
