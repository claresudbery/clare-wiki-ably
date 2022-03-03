---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Useful-Terms
---

(...and terminology). See also [Coding Principles](/pages/think/Coding-Principles).


## Misc

- [Notes on coding principles for interview prep](https://docs.google.com/document/d/1eIWoB0SP1fD08U-tOAc-SLbmF_59K4cC/edit)

## Symbolic links

- They can be checked into source control
- They allow you to replace a file with a link to another file
- Same thing as an alias / shortcut in Windows?
  - More command-liney, I think
- If you want to find the path of the original file that a symbolic link is pointing to: Whilst in the home directory of the user in terminal If you do `ls -lart | grep .zshrc` where `.zshrc` is the name of the symbolic link (or maybe the name of the file which is the target of the symbolic link?) that should show you the path of the symbolic link.

## Gameday

  - Often a whole team… take a day out to explore how the team / the
    system will respond to a particular circumstance.

## Idempotence

- [Idempotence: What it is and what it isn’t (What is an idempotent function?)](https://insimpleterms.blog/idempotence-what-it-is-and-what-it-isnt) (My InSimpleTerms blog post)
- [Idempotence - Wikipedia](https://en.wikipedia.org/wiki/Idempotence)
- [What is Idempotency?](https://www.restapitutorial.com/lessons/idempotency.html)
- [Benefits of Pure Functions: Idempotent and Nullipotent | agiledeveloper](http://blog.agiledeveloper.com/2015/12/benefits-of-pure-functions-idempotent.html)

## Leading Indicators and Lagging Indicators

- Leading indicators are better than lagging indicators, for instance in recruitment, number going through the pipeline is more useful than number recruited, because you won't know the second one until the end of the quarter 

## Primitive Obsession

"Primitive Obsession is when the code relies too much on primitive data types (like integers and strings). It means that a primitive value controls the logic in a class and this value is not type safe. Therefore, primitive obsession is when you have a bad practice of using primitive types to represent an object in a domain."
(from [here](https://medium.com/the-sixt-india-blog/primitive-obsession-code-smell-that-hurt-people-the-most-5cbdd70496e9#:~:text=Primitive%20Obsession%20is%20when%20the,an%20object%20in%20a%20domain.)).

## Race Condition

"A race condition is an undesirable situation that occurs when a device or system attempts to perform two or more operations at the same time, but because of the nature of the device or system, the operations must be done in the proper sequence to be done correctly." (from [here](https://searchstorage.techtarget.com/definition/race-condition))

Both operations are "racing" to access/change shared resources.

Race conditions can be handled by Mutex or Semaphores. They act as a lock to allow a process to acquire a resource based on certain requirements to prevent the race condition.

### Example 1:

Two or more threads can access shared data and they try to change it at the same time. Because the thread scheduling algorithm can swap between threads at any time, you don't know the order in which the threads will attempt to access the shared data. Therefore, the result of the change in data is dependent on the thread scheduling algorithm, i.e. both threads are "racing" to access/change the data.

Problems often occur when one thread does a "check-then-act" (e.g. "check" if the value is X, then "act" to do something that depends on the value being X) and another thread does something to the value in between the "check" and the "act".

(from [here](https://stackoverflow.com/questions/34510/what-is-a-race-condition))

### Example 2: 

"A light switch. In some homes there are multiple light switches connected to a common ceiling light. When these types of circuits are used, the switch position becomes irrelevant. If the light is on, moving either switch from its current position turns the light off. Similarly, if the light is off, then moving either switch from its current position turns the light on. With that in mind, imagine what might happen if two people tried to turn on the light using two different switches at exactly the same time. One instruction might cancel the other or the two actions might trip the circuit breaker."
(from [here](https://searchstorage.techtarget.com/definition/race-condition))

## State Machine

A state machine (aka Finite State Machine, or FSM) is any object that behaves differently based on its history and current inputs. It can be in exactly one of a finite number of states at any given time. The FSM can change from one state to another in response to some inputs; the change from one state to another is called a transition.

## Command Query Separation (CQS)

Every method should either be a command that performs an action, or a query that returns data to the caller, but not both.

In other words, *asking a question should not change the answer*. More formally, methods should return a value only if they are referentially transparent and hence possess no side effects.

Command–query separation (CQS) is a principle of imperative computer programming. It was devised by Bertrand Meyer as part of his pioneering work on the Eiffel programming language.

## Pure and Impure Functions

An impure function is a function that mutates variables/state/data outside of its lexical scope, thus deeming it “impure”.

Pure functions don’t modify external variables/state/data outside of the scope, and return the same output given the same input. They are deterministic.

## Cohesion

"Things that change together live together, and things that don't change together are apart." - [Ian Cooper, The Clean Architecture, DevTernity](https://www.youtube.com/watch?v=SxJPQ5qXisw).

## XP

- XP = Extreme Programming
- The 5 values of XP are: 
    - simplicity 
    - communication
    - feedback
    - respect
    - courage
- The practices of XP are:
    - Sit Together
    - Whole Team
    - Informative Workspace
    - Energized Work
    - Pair Programming
    - Stories
    - Iterative development
    - Slack (not the communication software!)
    - Ten-Minute Build
    - Continuous Integration
    - TDD (Test Driven Development)
    - Incremental Design
- [More info here at agilealliance.org](https://www.agilealliance.org/glossary/xp)
    - [and here (extremeprogramming.org, Don Wells' site)](http://www.extremeprogramming.org/rules.html)

## Service Design

- [The marbles post](https://thinkpurpose.com/that-marbles-post/)
- Book: [Good Services by Lou Downe](https://good.services/)

## YAGNI

- You Ain't Gonna Need It.
- Be wary of over-designing and over-optimising.

## DRY

- Don't Repeat Yourself.
- Part of the Single Responsibility Principle (SRP) which is the S of [SOLID](/pages/think/code-princ/SOLID).
- But be aware that too much obsession with DRY can lead to tightly coupled code which is hard to read. Balance is important, as in all things.
	- More on that [here](https://overreacted.io/the-wet-codebase/).
	- There's an interesting twitter convo about it [here](https://twitter.com/dixie3flatline/status/1416199317258334219?s=21) (although ironically it repeats itself quite a lot).