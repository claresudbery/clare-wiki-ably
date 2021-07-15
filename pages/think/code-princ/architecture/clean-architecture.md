---
layout: page
location: pages/think/code-princ/architecture/leaf
permalink: /pages/think/code-princ/architecture/Clean-Architecture
---

![Clean Architecture](/resources/images/clean-architecture.png)

## Links

- There are several clean architecture links [here on my hexagonal architecture page](/pages/think/code-princ/architecture/Hexagonal-Architecture#docs-and-blog-posts)
- I also have a page [comparing clean architecture with hexagonal architecture](/pages/think/code-princ/architecture/Clean-vs-Hexagonal-Architecture)
- I've made notes on [Ian Cooper's clean architecture talk here](/pages/think/code-princ/architecture/Clean-vs-Hexagonal-Architecture)
- See notes from Craig Bass [here](https://trello.com/c/lOxBnGxF/315-plan-the-session-on-clean-architecture-for-fri-6th-nov) (accessible to Clare only)

## Terminology

## Principles

### The Dependency Rule

- Dependencies can only point inwards. Nothing in an inner circle can know about, or mention the name of, something in an outer circle.
- As you move inwards, the software becomes more abstract.

### Entities

- Entities encapsulate enterprise-wide business rules. 
- They are the least likely to change when something external changes.

### Use Cases

- Represent application-specific business rules.
- Orchestrate the flow of data and direct the entities to use enterprise-wide business rules to achieve the goals of the use case.

### Interface Adapters

- Convert data from external formats to internal formats used by use cases and entities
- MVC, etc: Controllers, presenters and views are in this layer. Controllers convert data to models for use cases, and presenters and views receive models from use cases to then be presented in whatever way they see fit.

### Frameworks and Drivers

- database
- web framework (html)
- not much code here, other than glue