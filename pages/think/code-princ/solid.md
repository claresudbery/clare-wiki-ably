---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/SOLID
---
## In detail

  - Lots of detail: <http://www.codemag.com/article/1001061>
  - A little detail: <http://www.blackwasp.co.uk/SOLIDPrinciples.aspx>

Below are the five principles that the five letters S, O, L, I and D
stand for:

  - **S** – [SRP - Single responsibility principle](#s-srp-single-responsibility-principle)
  - **O** – [OCP - Open/closed principle](#o-ocp-open-closed-principle)
  - **L** – [LSP - Liskov substitution principle](#l-lsp-liskov-substitution-principle)
  - **I** - [ISP - Interface Segregation Principle](#i-isp-interface-segregation-principle)
  - **D** – [DIP - Dependency Inversion Principle](#d-dip-dependency-inversion-principle)

## S – SRP - Single responsibility principle

  - a class should have only a single responsibility (i.e. only one
    potential change in the software's specification should be able to
    affect the specification of the class)
  - this keeps classes small and reduces coupling

## O – OCP - Open/closed principle

  - “software entities … should be open for extension, but closed for
    modification.”
  - The “class” here is really defined as its *interface.*
  - The interface does not change – it is closed for modification
  - But you can add as many implementations of that interface as you
    like – and each one can have a different behaviour
  - For instance, ILogger can be implemented by PrintLogger and
    ConsoleLogger and FileLogger – and you can add as many more as you
    like.
  - This also means that you never modify the original code, ie the code
    in PrinterLogger and ConsoleLogger (apart from if you’re fixing
    bugs) – you just add new implementations instead.

## L – LSP - Liskov substitution principle

  - “objects in a program should be replaceable with instances of
    their subtypes without altering the correctness of that program.”
    See also design by contract.
  - Code that uses a base class must be able to substitute a subclass
    without knowing it
  - The specific functionality of the subclass may be different but
    must conform to the expected behaviour of the base class.
  - **EXAMPLE**:
      - So, I can call FemaleMammal.GiveBirth and I can substitute a
        cow into that - Cow.GiveBirth without breaking anything
      - No matter which version I choose, I should be confident that I
        will end up with a baby animal. Even though the specifics
        might be slightly different.
  - These are the principles which must be adhered to:
      - *Contravariance with parameters*
          - There should
            be *contravariance* between [parameters](http://www.blackwasp.co.uk/CSharpMethodParameters.aspx) of
            the base class's methods and the matching parameters in
            subclasses. This means that the parameters in subclasses
            must either be the same types as those in the base class
            or must be less restrictive.
          - Parameters in subclasses are either the same or have more
            / add extra functionality
          - **EXAMPLE**:
              - FemaleMammal.GiveBirth(Mammal mothersBestFriend)
              - Cow.GiveBirth(Animal mothersBestFriend)
          - See [Covariance and Contravariance](/pages/think/code-princ/Covariance-And-Contravariance)
      - *Covariance with return values*
          - There must
            be [*covariance*](http://www.blackwasp.co.uk/GenericVariance.aspx) between
            method return values in the base class and its subclasses.
            This specifies that the subclass' return types must be the
            same as, or more restrictive than, the base class' return
            types.
          - Return values in subclasses are either the same or have
            less functionality
          - **EXAMPLE**:
              - Mammal baby = FemaleMammal.GiveBirth();
              - Bovine baby = Cow.GiveBirth();
          - See [Covariance and Contravariance](/pages/think/code-princ/Covariance-And-Contravariance)
      - *Preconditions*
          - The preconditions of a base class must not be strengthened
            by a subclass
          - A precondition of a class is a rule that must be in place
            before an action can be taken.
          - **EXAMPLE**:
              - FemaleMammal must not be a virgin and must never have
                had a Caesarian before giving birth
              - Cow must not be a virgin before giving birth
      - *Postconditions*
          - Postconditions cannot be weakened in subclasses.
          - Postconditions describe the state of objects after a
            process is completed.
          - **EXAMPLE**:
              - After female mammal gives birth, it must have an
                associated baby that is a mammal
              - After cow gives birth, it must have an associated baby
                that is a bovine (this is fine)
              - After cow gives birth, it must have an associated baby
                that is any kind of animal (this would not be fine)
      - *Invariants*
          - The invariants of a base class must not be changed by a
            subclass.
          - An invariant describes a condition of a process that is
            true before the process begins and remains true
            afterwards.
          - **EXAMPLE**:
              - FemaleMammal is female both before and after birth
              - Cow is female both before and after birth
      - *History*
          - New or modified members should not modify the state of an
            object in a manner that would not be permitted by the base
            class
          - **EXAMPLE**:
              - FemaleMammal gains a newly populated Baby property and
                the baby has a head
              - Cow gains a newly populated Baby property (this is
                fine)
              - Cow gains a newly populated CowUdders property (this
                is not fine)
      - *Exceptions*
          - A subclass should not throw exceptions that are not thrown
            by the base class unless they are subtypes of exceptions
            that may be thrown by the base class
          - **EXAMPLE**:
              - FemaleMammal.GiveBirth throws a BreachedBaby exception
              - Cow.GiveBirth throws a BreachedBabyCow exception (this
                is fine)
              - Cow.GiveBirth throws a NotEnoughGrass exception (this
                is not fine)
  - For instance, if you want a read-only file type, it should not
    inherit from File – and File should not have a Save method.
    Rather, the base File type has a Load method, and it has a
    subclass – WriteableFile – which has a Save method. Thus the base
    class cannot be saved. (otherwise you would have ReadOnlyFile
    which was not able to implement the Save method on its parent, and
    also left the object in a different state after calling Save than
    what you would expect – particularly if its Save method threw an
    exception which was not thrown by the base class)

## I - ISP - Interface Segregation Principle

  - “many client-specific interfaces are better than one general-purpose
    interface.”
  - So, if you have an interface that contains lots of methods which are
    not used by all clients… replace it with several smaller
    client-focused interfaces. You can still have one class which
    implements several of these interfaces.

## D – DIP - Dependency Inversion Principle

  - One should “Depend upon Abstractions. Do not depend upon
    concretions.”
  - Dependency injection is one method of following this principle.
  - Loose coupling
  - See [Inversion of Control in this wiki](/pages/think/code-princ/Inversion-Of-Control)
