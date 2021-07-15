---
layout: page
location: pages/think/code-princ/architecture/leaf
permalink: /pages/think/code-princ/architecture/Clean-vs-Hexagonal-Architecture
---

## Intro

These notes are based on [Ian Cooper's Clean Architecture Video](https://www.youtube.com/watch?v=SxJPQ5qXisw).

I have more notes on clean architecture [here](/pages/think/code-princ/architecture/Clean-Architecture) and [here](/pages/think/code-princ/architecture/Hexagonal-Architecture#docs-and-blog-posts).

Ian looks at the following precursors to clean architecture, all of which are described below:
- Layered Architectures
- Ports and Adapters / Hexagonal architecture (Alistair Cockburn)
- Onion architecture (Jeffrey Palermo)
    - I didn't make any notes on onion architecture - not sure Ian Cooper covered this in any detail?
- Boundaries, Controllers and Entities (Ivar Jacobson)

Clean architecture is a synthesis of all the above - described first by Bob Martin but with acknowledgement to all the above precursors.


## Layered Architectures

- Typically described as 3 layers but can actually be as many as you want. 
- The typical three layers:
    - UI at the top
    - Domain / logic in the middle
    - Infrastructure (data, file system, 3rd party integrations) at the bottom
- Dependencies flow downwards
    - Nothing at a lower layer may depend on a higher layer
    - Avoid circular dependencies
- Why layers? 
    - So that I can abstract away complexity. Having a data layer / repository pattern is not just about being able to swap in a new database implementation - it's also so that I don't have to reason about how data access works when I'm thinking about domain logic. I want to be able to FIT IT IN MY HEAD. So I only have to think about one layer at a time.
    - But also if I want, I can substitute a different implementation. This doesn't have to mean swapping SQL for Mongo - it could just be moving from NHibernate to Dapper, or changing some UI branding. Or switch payment providers.
    - You can defer decisions about implementation until the last responsible moment (eg using stubs and mocks)
    - You can minimise dependencies between layers
        - Low coupling and high cohesion: "Things that change together live together, and things that don't change together are apart." - [Ian Cooper, The Clean Architecture, DevTernity](https://www.youtube.com/watch?v=SxJPQ5qXisw).

### Domain layer split into service layer / entity layer

- This is a way of splitting the domain layer. 
- Often the domain layer / business layer is split into two layers:
    - A service layer and an entity layer
    - Distinguish between two types of business logic
        - domain logic (entity layer)
        - application / workflow logic (service layer)
- Two ways of doing this, domain facade and operation script. You might mix and match them in different areas of your solution:

#### Domain facade

- **Service layer** 
    - is a thin layer - or set of thin facades - containing application logic. No domain logic.
    - These facades are implemented by classes which are purely implementing application logic.
    - The service layer sits over the Domain Model
    - Coordinates access to the domain objects
- **Domain model** 
    - The Domain Model is where all the domain logic is implemented.
    - Contains domain entities, each of which has both state and behaviour (rules) dependent on that state
    - (This came from Ian Cooper, and when he says state I think he effectively means data about the system? (see below))

#### Operation Script

This happens in some kind of crud-based service where we don't have much of a domain, and all we're really doing is storing, retrieving, updating data.

- **Service layer**
    - a set of thicker classes
    - directly implement application logic
    - the operations available to clients of the service layer are implemented as transaction scripts, several to a class according to subject area
- **Domain objects**
    - domain objects mainly dumb objects holding state

## Ports and adaptors (hexagonal architecture) (Alistair Cockburn)

![Diagram of ports and adapters](/resources/images/HexagonalArchitecture-ports-and-adapters.png)

It's basically layered architecture with a slightly different set of rules.

Three layers:

- Application / Domain (the yellow bit in the middle)
    - contains the rules of the application. aka domain layer / domain model.
    - this is where the business entities live.
    - these objects are completely divorced from IO concerns
    - when doing TDD, you don't even have to mock out your IO objects because they are not referred to in this core.
- Adapters (the blue bits on the outside)
    - deal with the outside world
    - input and output
    - store data from the system
    - get data into the system
    - can represent either incoming (primary) or outgoing (secondary) messages / data
- Ports (the red bits - interfaces between the outside and the inside (domain) of your system)
    - How the adapter layer uses / communicates with domain
    - The ports are where you plug in the adapters
    - One port might be used by a number of adapters
    - Different types of UI could plug into the same port
    - Test can replace UI - just plug into the port and drive the application
    - The ports layer is handling both incoming (primary) and outgoing (secondary) conversations
    - This is where you represent the use case - it's a use case boundary
        - By use case, we mean example of how the domain models might be used

### Comparing hexagonal with the original layers

- Before, UI was at the top and infrastructure (data etc) was at the bottom
- But now, UI and infrastructure have equal status - they are both adapters, both at the top
- The domain layer now consists of both the port and the application
- As before, dependency flows downwards - so adapters dependent on ports, dependent on application.
    - So ports can't be dependent on adapters
    - So how does a lower layer call a higher layer? eg application logic wants to save data to a database?
    - The port layer creates an interface to represent a thing from the layer it can't reach, ie the adapter layer
    - Then at runtime, dependency injection substitutes in an instance of the thing you want to access

## Boundaries, Controllers and Entities 

- aka BCE, by Ivar Jacobson from his book [Object Oriented Software Engineering: A Use-Case Driven Approach](https://www.ivarjacobson.com/publications/books/object-oriented-software-engineering-1992)
- Boundary object - a lot like an adapter (hexag architecture)
    - is on the outside
    - interfaces with an external actor
    - can't talk to an entity - must do it through the notion of a controller
- Entity - like what you'd find in the application layer (hexag architecture)
    - business logic
    - has state and operations upon that state (as before)
- Controller / interactor - a lot like a port (hexag architecture)
    - Sometimes called interactor so as not to be confused with MVC controller
    - Mediates between boundaries and entities
    - An object that implements a use case

## Use cases

- eg General Ledger, all amounts must sum to zero
- Being able to see balance for every account code
- See and display journals
- A proto user story idea
- What are the set of interactions that make up this software requirement?
- Both hexag arch and boundary/controller/entity allow me to ignore UI and infrastructure and focus pruely on use cases, which then become easy to test

### Tests

#### Unit tests

- Our unit tests in hexagonal architecture are just another adapter
- Our tests drive our ports / use cases
- Tests should focus on the behaviour expressed by a use case, not a unit of code

#### Integration tests

- Not testing the adapter directly, just testing what the controller is calling (?)

## Clean Architecture

![Clean Architecture](/resources/images/clean-architecture.png)

I want to separate my concerns, stop having to think about my framework or my infrastructure, nd get to the nub of what matters - which is "I am an app that handles these use cases and has this business logic".

- **Outer ring**
    - The blue ring on the outside is the adapters
    - Frameworks and drivers
- **Controllers, Gateways and Presenters**
    - This is the stuff you're forced to write by your framework so that your framework can interact with you
- **Use cases**
    - The red ring
    - The application business rules
    - These are the ports, aka interactor (formerly controller) layer
    - These drive the flow of operations for using those entities
    - Use cases can have input ports, output ports and interactors
    - **Commands**
        - If you use a Command pattern, this is a natural fit for an interactor. The Command object calls something in your domain, ie has an entity (as its receiver) and calls its methods.
        - eg your framework might require a command to be passed to a button object
        - the button doesn't know what the command does, it just knows that when the button is clicked it will call command.Execute - this is basically your old-fashioned callback
        - when the command is executed, it will call a method on its receiver, which will be a domain entity - eg a Document entity, and it calls document.Print.
- **Entities**
    - The yellow circle in the middle is the application
    - Classes encapsulate state and the logic / rules operating on that state
    - The enterprise business rules

## Examples

- See Ian Cooper's [ca-tutorial repo](https://github.com/iancooper/CA-Tutorial) ("the world's most over-engineered hello world applicaiton", LOL)
- Start with the `clean_architecture_start` branch
    - In this version, you see in `GreetingsApp\Adapters\Controllers\GreetingsController.cs` he has everything implemented in the controller.
    - It's basically a crud app that allows you to add greetings to a database.
    - All the business logic (what there is of it) and all the database access is all happening in that one `GreetingsController` class. 
- Then what he does is add layers, one at a time.
- First add a facade:
    - The first version is in the `clean_architecture_facade` branch.
    - This creates a facade that hides away the implementation detail of contacting the database, and also providing feedback in the console.
    - It lives in `GreetingsCore/Ports/Facades/GreetingFacade.cs`.
    - It still has a lot of concerns all happening in one class though.
- So now, add an ISP (?)
    - This version is in the `clean_architecture_with_isp` branch.
    - Now there are several classes in the `GreetingsCore/Ports/Facades` folder
    - There is a separate service class for each possible desired action - eg `AddGreetingService.cs`.
    - But given that each facade is just a single operation, can't we just abstract that out?
- So now, add the concept of commands and queries
    - This version is in the `clean_architecture_with_commands` branch.
    - In the `GreetingsCore/Ports` folder now, instead of having facades, we have `Commands` and `Queries`. 
    - This is the use case layer.
    - Obviously not much logic, but there could be.
    - This would be where the application logic is, and then in the `Greeting` itself would be the entity logic.
- Finally, we separate the commands from the handlers
    - This version is in the `clean_architecture_with_handlers` branch.
    - The handlers are basically hooked up to the commands via some kind of pub-sub model (see the IoC stuff in `Startup.cs`)
    - I think the handlers subscribe to the commands, and then the commands are published via calls like `_commandProcessor.SendAsync(deleteGreetingCommand)` in `GreetingsController.cs`?
    - Each handler implements a `HandleAsync` method, which is effectively an `Execute` method
    - (He's using the `Brighter` command dispatcher / processor - this is an [open source project he contributes to](https://github.com/BrighterCommand/Brighter), I think)
    - You'll see that attributes are added to the `HandleAsync` method that allow you to parcel out orthogonal concerns like logging and circuit breaker operations (see `AddGreetingCommandHandlerAsync.cs`)

## Questions and Answers

- Question: If use cases are the same as ports, what about secondary ports? These are the interfaces to things like database implementations, and they are implemented externally, NOT internally. So how are they use cases?
    - Answer: Aha. These are the use case *output ports*, and this is where dependency inversion comes in. Because the flow of dependency must flow inwards, the use case knows only about an interface (*use case output port*), and knows nothing about how it is implemented. The entities implement the interfaces in the use case (port) layer, and then just return outputs which are handled by the output ports
        - But surely the entities do actually call methods on those output ports... which means the inner circle (entities) is dependent on an outer circle (ports)?
