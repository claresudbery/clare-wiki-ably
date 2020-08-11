---
layout: page
location: pages/think/code-princ/architecture/leaf
permalink: /pages/think/code-princ/architecture/Hexagonal-Architecture-Blog-Post
---

## Overview

When designing and delivering software, we are often thinking about how to keep individual components well isolated, and reduce dependencies across our code bases. This increases the likelihood that any required changes can be confined to one small area of the code base, without having unexpected or undesired impacts elsewhere. One way of achieving this separation is to use the "hexagonal architecture" approach.

The concept of hexagonal architecture is not one that I instantly understood. Even though I helped create a piece of software which supposedly implemented it, it wasn't until I'd written this blog post that I really felt I got it. (Indeed, as a way of really cementing and confirming your knowledge on a subject, I’d highly recommend presenting what you think you know for the benefit of an audience that’s new to the topic.)

What you'll get here is a description of a Currency service, along with a discussion of how it exemplifies hexagonal architecture. But I'll also explain where it falls short. So, in an attempt to present a purer example (and because they're yummy), I'll also give you  some pancakes: Dan Portella (@dmportella) and I created a ClaresPancakes solution, which was designed to demonstrate hexagonal architecture.

So, what is hexagonal architecture? Here is a diagram:

![Diagram of ports and adapters](/resources/images/HexagonalArchitecture-ports-and-adapters.png)

* **yellow**:	domain (core logic)
* **light red**:	primary ports
* **light blue**:	primary adapters
* **dark red**:	secondary ports
* **dark blue**:	secondary adapters

It's all about ports and adapters. These are split into primary and secondary. 

* The **primary** ports and adapters represent the way you interact with your users
* The **secondary** ports and adapters represent the way you interact with any services you need. 

The ports are the interfaces, and the adapters represent the code which allows those interfaces to be utilised.

Examples will make this a bit more concrete:
 
* The **domain** is the actual logic of your application. You want to be able to implement this independently of either UI or third party services.
* A **primary port** is a contract (aka interface) you share with the world. This is the behaviour you agree to provide, independent of implementation.
* A **primary adapter** will use the behaviour available on a primary port (again, regardless of implementation detail), and serve it up to the world. For instance, this could be a controller which takes in user input from a UI and serves it up to your user interface.
* A **secondary port** will also be an interface or contract. But this time, it is the contract you're expecting to be fulfilled by a third party, for instance a database.
* A **secondary adapter** will be an implementation of a secondary port. For instance, this may be a data access implementation which uses SQL.
* !! Note that whereas **secondary adapters** are implementations of interfaces, **primary adapters** are *clients* of interfaces. The implementation of the primary ports will happen within the domain.

There's a good reason the same terms, "ports" and "adapters", are used for both clients and services - in fact, this is really the point of the model: The idea is that your core business logic should remain the same no matter what your front end looks like, *and* no matter how any third-party services are implemented. Clients and services are both "outside" as far as your domain is concerned, and therefore they can be modelled using the same concepts.

The aim is to "allow an application to equally be driven by users, programs, automated test or batch scripts, and to be developed and tested in isolation from its eventual run-time devices and databases" (from [Alistair Cockburn's article about hexagonal architecture](http://alistair.cockburn.us/Hexagonal+architecture)). I can also recommend this [Garfixia Software article](http://www.dossier-andreas.net/software_architecture/ports_and_adapters.html).

## A Currency Service

Our Currency service effectively had a hexagonal architecture. We had two related solutions in our code base:

* **Currency.SDK**
* **Currency.API**

The SDK was published internally as a NuGet package, and contained all the logic. The API was a Nancy app, which had its own instance of the Currency.SDK NuGet package. It was available (internally) on our network as a RESTful endpoint.

Here is an overview of the shape of the Currency.SDK solution:

![Currency.SDK](/resources/images/HexagonalArchitecture-solution-overview.jpg)

### Currency.SDK - Primary Ports

There were two primary ports: 

* **ICurrencyConverter** - allowed clients to convert monetary values from one currency to another
* **ISymbolFetcher** - clients used this to fetch currency symbols (eg "£")

Both of these ports were implemented in the domain (Currency.Engine).

### Currency.SDK - Secondary Ports

There were several secondary ports:

* ICurrencyRepo 
* IDataCache
* IUdpErrorLogger
* ILogStashConfig

Note that most of our ports lived in the Currency.Contracts project (see "Refactoring" below for more discussion on this).

### Currency.SDK - Secondary Adapters

Each secondary port had its own secondary adapter - these were all implementations of the relevant interfaces. For instance, **ICurrencyRepo** was implemented by **SqlCurrencyRepo**, in the **Currency.DataAccess.SQL** project.

### Currency.SDK - Primary Adapters

We effectively had two primary adapters:

* A Nancy module - **ConverterModule** - in Currency.API. This took data from the Currency.SDK instance, and passed it through to the UI via the REST endpoint.
* Another Nancy module - **SymbolModule** - in Currency.API (worked in the same way).

Note that if the SDK were accessible directly as a REST endpoint, then we could also have another primary adapter via SOAP UI, which would take the form of acceptance tests.

### Currency.SDK - Dependency Injection

Our architecture was not originally properly hexagonal. Originally the Nancy API and the SDK lived in the same solution, and all the dependency injection was handled using the TinyIoC which comes for free with Nancy. This meant that we got away with giving the API project sight of all the interfaces and their implementations. It also meant that we didn't notice that our interfaces lived in the same project as our domain logic.

As soon as we tried to split the API and the SDK into different solutions, this stopped working: Cyclic dependencies were created when we tried to inject the SQL Data Access implementation.

What we ended up with was a separate project for interfaces (**Currency.Contracts**), and we also supplied our NuGet clients with a factory (**CurrencyObjectFactory**, in **Currency.Service**). They could use this to instantiate whatever they needed, and it handled all the dependency injection for them (for instance it decided which data-access implementation to use, which wasn't something they should care about). 

## Clare's Pancakes 

There is a purer hexagonal example in the [Clare's Pancakes git repo](https://github.com/claresudbery/ClaresPancakes) (publicly available).

Hopefully the project structure, once you have some understanding of how hexagonal architecture is supposed to work, is reasonably self-evident. It looks like this:

![Clare's Pancakes](/resources/images/HexagonalArchitecture-Primary-and-Secondary-Adapters-in-VS.jpg)

### Clare's Pancakes - Primary Ports

There is just one primary port, which represents the contract provided by a pancake maker (**IPancakeMaker**). It currently has just one method: **GiveMePancakes**.

Note that the **Pancake** model is also defined here, as it is needs to be surfaced to primary users.

### Clare's Pancakes - Primary Adapters

There are two primary adapters, both handily located in a primary adapters folder:

* **Pancakes.REST.API** - an API with a module which allows you to "get" pancakes. It uses a pancake maker provided by **PancakeMakerFactory.CreatePancakeMaker**
* **Pancakes.Domain.Acceptance.Tests** - this, like the API, takes a pancake maker provided by the factory. It checks that it gives us pancakes when we ask for them. :)

### Clare's Pancakes - Secondary Ports

* **IPancakeMixDispenser** - The pancake maker needs a dispenser to give it some pancake mix.
* **IPancakeOven** - We want to cook those pancakes.
* **PancakeMix** - this model is defined here, as it is not surfaced to primary users.

### Clare's Pancakes - Secondary Adapters

* **Pancakes.MixDispenser.Breville** There is currently only one implementation of IPancakeMixDispenser.
* **Pancakes.Oven.Bosch** This is one implementation of IPancakeOven.
* **Pancakes.Oven.Hotpoint** This is another implementation of IPancakeOven.

### Clare's Pancakes - Dependency Injection

If you want a pancake maker, you don't have to care what mix dispenser or what oven it uses. Just new yourself up a **PancakeMakerFactory** and call its **CreatePancakeMaker** method. It will make all the decisions about oven, etc.

### Clare's Pancakes - Domain

**Pancakes.Domain** uses **PancakeMaker2000** to implement a pancake maker for you.

Of course, in reality you wouldn't name your projects and folders things like "primary adapters" and the like - you'd give them names that were more meaningful to your domain. But I've used these names here to make everything explicit.

### Currency.SDK - Refactoring

It's interesting that in the process of writing this post, I realised there was some muddiness in the Currency.SDK solution which meant that its hexagonal architecture wasn't immediately apparent:

* The **Currency.Contracts** project should be the resting place for secondary ports. But there was at least one interface in there (**IErrorObserver**) which was arguably not a secondary port at all, and should have been internal to the domain (the **Currency.Engine** project).
* There are several secondary adapters (eg caching and logging) which lived in **Currency.Engine** (the domain), rather than their own separate projects.
* There was a primary port (**ISymbolFetcher**) which was in **Currency.Engine**, rather than **Currency.Contracts**.
* The other primary port (**ICurrencyConverter**) was in **Currency.Contracts** with all the secondary ports. It was therefore not clear that **ICurrencyConverter** was any different from all the other interfaces. I wanted to move it - and **ISymbolFetcher** - into a separate project which contained only primary ports. Or maybe they should have lived with the object factory, in **Currency.Service**?

On the back of this blog post, I had a list of things I wanted to refactor. **But** it's worth noting that the Currency service was a small and simple piece of code. We already had a conversation, for instance, about the fact that many of the secondary ports (for instance, caching and error logging) were implemented by secondary adapters which lived within the domain (the **Currency.Engine** project). This was not technically correct, but we decided that it would be over-engineering if we were to create a separate project for each secondary adapter. Feel free to disagree. :) 

Aside: The great thing about writing blog posts, or writing documentation, or even just writing notes about what you're doing: It forces you to think about it in detail, and often allows you to spot weaknesses in your code. The same applies to explaining what you're doing out loud to another person - one of the many benefits of pair coding.

I get it now. Hopefully you do too. :)

@ClareSudbery

(I also blog here: [A Woman in Technology](https://medium.com/@claresudbery/blog-posts-d14731e4803d) ... and here: [In Simple Terms](https://insimpleterms.blog/)).
