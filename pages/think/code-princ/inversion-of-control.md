---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Inversion-Of-Control
---

#### Inversion Of Control

  - In traditional procedural programming, the custom-built code calls
    into the library code.
  - With IoC, it’s the other way round: the library code calls the
    custom code
  - So for instance, you might have a UI framework that listens for user
    events such as mouseclicks, and then custom event handlers, or
    callbacks, which define what should happen when a particular menu
    item is clicked (for instance)
  - Or, with dependency injection, the parent object just holds an
    interface to the child object, which creates itself and is then
    given to the parent, rather than the parent asking for it.
      - Or, think about the interface to a repository which has two
        implementations: one is NHibernate, one is stored procs. The
        implementation has CONTROL over how it does things – it is not
        up to the caller to decide.
  - Dependency injection is a way of using IoC. There is an example of dependency injection in my [solution to the Train routes kata](https://github.com/claresudbery/TrainRoutes).
