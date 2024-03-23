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

## Many More Much Smaller Steps (MMMSS)

- This idea comes from Geepaw Hill. It pretty much does what it says on the tin!
- More from Geepaw [here](https://www.geepawhill.org/2021/09/29/many-more-much-smaller-steps-first-sketch/).
- Even more in this piece where he describes the benefits in detail (see below for Rework Avoidance Theory)
  - https://www.geepawhill.org/2021/11/16/mmmss-the-intrinsic-benefit-of-steps/
  - Summary:
    - Three choices:
        - In path A, we have one ready-to-ready step of size 10 stride-lengths. 
        - Path B has five steps of size 2. 
        - The third path, C, has 15 steps of size 1. THIS IS BEST
    - READY TO READY
    - responsiveness benefits are 
        - interruptability, 
        - steerability, 
            - The cheapest point at which we can steer our system? Clearly, it’s when the system is ready
        - reversability, and 
        - target parallelism
            - you can move towards parallel targets by switching between them
    - human benefits are 
        - scope, 
            - reducing scope
            - Adding entities to a step seems linear, but it’s combinatoric
            - it isn’t the entities, per se, that make things harder, it’s the relationships and interactions
        - rhythm, 
            - Alternating periods of tension and release produce endorphins
        - autonomy,     
            - smaller steps allow both individuals and teams a much greater degree of autonomy.
        - safety
            - people are more creative, thoughtful, and thorough when they feel less at risk

## Rework Avoidance Theory (RAT)

- Rework avoidance theory: https://www.geepawhill.org/2020/07/17/the-rat-rework-avoidance-theory/
- seeing a change as having a clear start-point & end-point and a straight & stable path between them.
- our chosen method will be inefficient if it ever does the "same thing" twice. 
- The proviso "no same thing twice" has lots of variants. The three I want to talk about today are 
    - "don’t learn about this twice", 
    - "don’t code this twice", and 
    - "don’t talk about this twice".
- we assume taking one larger step would be better than taking three smaller ones.
- we assume that the landscape between here and some change-endpoint is stable, well-marked
    - But Not only does the target shift, routinely, in response to the vagaries of the market, but the shortest path to that target also shifts, routinely, by way of new technology, new technique, and new insight.
- It consistently adds costs to software development in the name of "efficiency", and it does it at every level: in coding, in planning, in meeting, every level.

## Service Design

- [The marbles post](https://thinkpurpose.com/that-marbles-post/)
- Book: [Good Services by Lou Downe](https://good.services/)

## YAGNI

- You Ain't Gonna Need It.
- Be wary of over-designing and over-optimising.
- See [Ron Jeffries](https://ronjeffries.com/xprog/articles/practices/pracnotneed/)

## DRY

- Don't Repeat Yourself.
- Part of the Single Responsibility Principle (SRP) which is the S of [SOLID](/pages/think/code-princ/SOLID).
- But be aware that too much obsession with DRY can lead to tightly coupled code which is hard to read. Balance is important, as in all things.
	- More on that [here](https://overreacted.io/the-wet-codebase/).
	- There's an interesting twitter convo about it [here](https://twitter.com/dixie3flatline/status/1416199317258334219?s=21) (although ironically it repeats itself quite a lot).

## Continuous things

- Continuous integration, continuous delivery, continuous deployment
- The notes below are copied from [here](https://blog.assembla.com/AssemblaBlog/tabid/12618/bid/92411/Continuous-Delivery-vs-Continuous-Deployment-vs-Continuous-Integration-Wait-huh.aspx)
- [This is also a good source](https://martinfowler.com/bliki/ContinuousDelivery.html) on the topic, from Martin Fowler.
- Quick summary:
  - **Continuous integration** is what happens on a development server - at-least-daily merges of all code into the mainline, integrated with everything else and automatically tested
  - **Continuous delivery** means that the continuously integrated code is then made continuously *available* for deployment and manual testing
  - **Continuous deployment** means that the continuously delivered code is *automatically* pushed all the way to production and external users (see below)
  - See [below](#continuous-delivery-vs-continuous-deployment) for confusions between continuous delivery and continuous deployment

### Continuous integration

"Continuous Integration is the practice of merging development work with a Master/Trunk/Mainline branch constantly so that you can test changes, and test that changes work with other changes.  The idea here is to test your code as often as possible to catch issues early.  Most of the work is done by automated tests, and this technique requires a unit test framework.  Typically there is a build server performing these tests, so developers can continue working while tests are being performed."

See [dedicated page](/pages/think/code-princ/coding-theory/Continuous-Integration)

### Continuous delivery

"Continuous Delivery is the continual delivery of code to an environment once the developer feels the code is ready to ship.  This could be UAT or Staging or could be Production.  But the idea is you are delivering code to a user base, whether it be QA or customers for continual review and inspection.  This is similar to Continuous Integration, but it can feed business logic tests.  Unit tests cannot catch all business logic, particularly design issues, so this stage or process can be used for these needs.   You may also be delivering code for Code Review.   Code may be batched for release or not after the UAT or QA is done.  The basis of Continuous Delivery is small batches of work continually fed to the next step will be consumed more easily and find more issues early on.  This system is easier for the developer because issues are presented to the developer before the task has left their memory."

### Continuous deployment

"Continuous Deployment is the deployment or release of code to Production as soon as it is ready.  There is no large batching in Staging nor long UAT process that is directly before Production.  Any testing is done prior to merging to the Mainline branch and is performed on Production-like environments, see Integration blog article for more information.  The Production branch is always stable and ready to be deployed by an automated process.  The automated process is key because it should be able to be performed by anyone in a matter of minutes (preferably by the press of a button).  After a deploy, logs must be inspected to determine if your key metrics are affected, positively or negatively.  Some of these metrics may include revenue, user sign-up, response time or traffic, preferably these metrics are graphed for easy consumption.  Continuous Deployment requires Continuous Integration and Continuous Delivery - otherwise, you are just cowboy coding and you will get errors in the release."

Nice description from Martin Fowler: "Continuous Integration ensures everyone integrates their code at least daily to the mainline in version control. Continuous Delivery then carries out any steps required to ensure that the product is releasable to product whenever anyone wishes. Continuous Deployment means the product is automatically released to production whenever it passes all the automated tests in the deployment pipeline.
With Continuous Deployment every commit pushed to mainline as part of Continuous Integration will be automatically deployed to production providing all of the verifications in the deployment pipeline are green. Continuous Delivery just assures that this is possible (and is thus a pre-requisite for Continuous Deployment)."

### Continuous delivery vs continuous deployment 

- Pull vs push:
  - Delivery: pull – this is because some stages will be manual, eg exploratory testing – so the QA won’t pull a new version until they’re happy the previous one was tested
  - Deployment: push – every stage in the pipeline automatically triggers the next stage
- [Martin Fowler](https://martinfowler.com/bliki/ContinuousDelivery.html):
  - "Continuous Delivery is sometimes confused with Continuous Deployment. Continuous Deployment means that every change goes through the pipeline and automatically gets put into production, resulting in many production deployments every day. Continuous Delivery just means that you are able to do frequent deployments but may choose not to do it, usually due to businesses preferring a slower rate of deployment. In order to do Continuous Deployment you must be doing Continuous Delivery."

## Incremental and iterative development

- An increment is an addition, whereas an iteration is a change. The idea is that you make small additions (increments) to your product, but for each new increment you iterate, gradually refining the increment with each new iteration - ie changing it in response to feedback.
	- So for instance an increment would be a vertical slice, which will change iteratively as you refine it in response to feedback.
	- But even within your slice, you will ideally make small incremental changes as you build your implementation.
	- Geepaw says: "I don't use the phrase much anymore, at least not formally, because my own behavior doesn't seem to vary based on whether I'm adding or changing. I do increments and iterations and iterations and increments and I do them at various scales."
- [Reference on diff between incremental and iterative](https://itsadeliverything.com/revisiting-the-iterative-incremental-mona-lisa)

## Roll forward

- You roll back when you take your code back to a previous version.
- In pipeline terms, this often means returning to a previous deployment, possibly by deploying previously stored artefacts.
- The most common reason this happens is when your current deployment is problematic - eg contains a bug or has brought your system down.
- Rolling *forward* happens when you deploy a quick fix, rather than returning to a previous version.
- Note that many people (eg Geepaw Hill) advocate for having a default habit of rolling forward rather than back. Geepaw says "If our steps are actually small enough, it's usually quicker to roll forward than to roll back."

## Technical Debt, aka Tech Debt

- [Martin Fowler's definition of technical debt](https://martinfowler.com/bliki/TechnicalDebt.html)
- [Martin Fowler's quadrant idea for tech debt](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html)
- Some people don't like the term - see my notes from SoCraTes UK 2023 (in phone Notes)
- I've transcribed a conversation about the value (or otherwise) of the term in clare-tech (private-tech-conversations.md) - was a private convo so accessible to Clare only I'm afraid, sorry about that.

## Turing Complete

- Turing described a theoretical Turing machine that could process any set of instructions
- Nice little [video here](https://www.youtube.com/watch?v=dNRDvLACg5Q) describing the Turing machine
- A language or system is described as Turing complete if it can handle any instruction / can process any algorithm
- A calculator is non Turing complete because it can only handle mathematical calculations
- From [wikipedia](https://esolangs.org/wiki/Turing_machine):
    - A Turing machine "consists of a finite-state automaton (often called its "control mechanism") hooked up to an unbounded tape which can be moved to the left and right, from which symbols can be read, and onto which symbols can be written."
    - "A universal Turing machine is a Turing machine with a control mechanism constructed in such a way that it can simulate any other Turing machine's control mechanism, if that mechanism is encoded on the tape before execution begins."
    - "while many systems of computation have been shown to be able to solve only a subset of computation problems that a given Turing machine can solve, no system of computation has ever been shown to be able to solve a computation problem that a Turing machine cannot."
    - the "the Church-Turing thesis ... states (roughly) that ... a Turing machine can make any sort of calculation that it is possible to precisely define an algorithm for."
    - "It is often an interesting and/or valuable task to show that an esoteric programming language is (or is not) equivalent to a Turing machine."
        - An example: The esoteric Korean [Aheui programming language](https://esolangs.org/wiki/Aheui), designed to play a similar role to [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck), is probably Turing-complete, because "Since a pair of unbounded stacks can be used to simulate the unbounded tape of a Turing machine, it is likely that Aheui is Turing-complete.

# The Pareto principle (80/20 rule)

- For many outcomes, roughly 80% of consequences come from 20% of causes (the "vital few").
- Other names for this principle are 
    - the 80/20 rule
    - the law of the vital few  
    - the principle of factor sparsity
- One place this gets used is in respect to to-do list prioritisation: Try to identify the 20% of actions that will have 80% impact

# #NoEstimates

- Interesting convo about it stored in clare-tech (accessible to Clare only)

# BDUF

Big Design Up Front

# Law of Demeter

Copied from wikipedia:

The Law of Demeter (LoD) or principle of least knowledge is a design guideline for developing software, particularly object-oriented programs. In its general form, the LoD is a specific case of loose coupling. The guideline was proposed by Ian Holland at Northeastern University towards the end of 1987,[1] and the following three recommendations serve as a succinct summary:[2]

- Each unit should have only limited knowledge about other units: only units "closely" related to the current unit.
- Each unit should only talk to its friends; don't talk to strangers.
- Only talk to your immediate friends.

# Cynefin Framework

- [The Cynefin Framework](https://en.wikipedia.org/wiki/Cynefin_framework)
- Pronounced "Cunneffin"
- Mark Kirschstein, Barcamp '16:
    - Four quadrants (see pic):
    - Top left: complex - emergent 
    - Top right: complicated - good practice
    - Bottom left: chaotic - novel
    - Bottom right: simple - best practice 
![Cynefin](/resources/images/cynefin02.jpg)
- Liz Keogh, YOW London '22:
    - Cynefin diagram also talks about constraints 
        - Clear: fixed constraints 
        - Complicated : governing constraints : context free rules, eg red traffic lights 
        - Complex: enabling constraints 
        - Chaotic: no enabling constraints 
    - For liz, Cynefin just feels a certain way in her head 
        - She can visualise:
        - Clear = building bricks 
        - Complicated = Lego
        - Complex = organic stuff like elephants 
        - Chaotic = on fire 
- Eduardo da Silva, Agile Meets Architecture, 5-6 Oct '23:
    - many companies are operating as though they are in Complicated and Clear, but actually they are in Complex
![Cynefin](/resources/images/cynefin01.jpeg)
