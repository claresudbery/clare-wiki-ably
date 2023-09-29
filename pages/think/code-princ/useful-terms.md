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
  - **Continuous deployment** means that the continuously delivered code is *automatically* pushed all the way to production and external users
  - See [below](#continuous-delivery-vs-continuous-deployment) for confusions between continuous delivery and continuous deployment

### Continuous integration

"Continuous Integration is the practice of merging development work with a Master/Trunk/Mainline branch constantly so that you can test changes, and test that changes work with other changes.  The idea here is to test your code as often as possible to catch issues early.  Most of the work is done by automated tests, and this technique requires a unit test framework.  Typically there is a build server performing these tests, so developers can continue working while tests are being performed."

See [dedicated page](/pages/think/code-princ/coding-theory/Continuous-Integration)

### Continuous delivery

"Continuous Delivery is the continual delivery of code to an environment once the developer feels the code is ready to ship.  This could be UAT or Staging or could be Production.  But the idea is you are delivering code to a user base, whether it be QA or customers for continual review and inspection.  This is similar to Continuous Integration, but it can feed business logic tests.  Unit tests cannot catch all business logic, particularly design issues, so this stage or process can be used for these needs.   You may also be delivering code for Code Review.   Code may be batched for release or not after the UAT or QA is done.  The basis of Continuous Delivery is small batches of work continually fed to the next step will be consumed more easily and find more issues early on.  This system is easier for the developer because issues are presented to the developer before the task has left their memory."

### Continuous deployment

"Continuous Deployment is the deployment or release of code to Production as soon as it is ready.  There is no large batching in Staging nor long UAT process that is directly before Production.  Any testing is done prior to merging to the Mainline branch and is performed on Production-like environments, see Integration blog article for more information.  The Production branch is always stable and ready to be deployed by an automated process.  The automated process is key because it should be able to be performed by anyone in a matter of minutes (preferably by the press of a button).  After a deploy, logs must be inspected to determine if your key metrics are affected, positively or negatively.  Some of these metrics may include revenue, user sign-up, response time or traffic, preferably these metrics are graphed for easy consumption.  Continuous Deployment requires Continuous Integration and Continuous Delivery - otherwise, you are just cowboy coding and you will get errors in the release."

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
- A conversation about the value (or otherwise) of the term (see clare-tech for attributions - accessible to Clare only):
    - Probably the main issue is that the use of the term isn't really what Ward Cunningham had in mind when he coined it. However, that ship has sailed.
        - Dave Rooney wrote an article for the Cutter Consortium ages ago about the difference between incurring debt on appreciating assets like property and debt on depreciating assets like cars. Debt with code is decidedly more like the latter than the former! Then, he compared the idea of debt on a car to that of debt on a general aviation aircraft. The car, even if well maintained, is eventually worth only the value to a scrap metal dealer. A general aviation aircraft, like a Cessna 172, depreciates at a much lower rate than a car. 
        - In the article he made the distinction between "car code" and "aircraft code". We see plenty of the former, and precious little of the latter. They both require maintenance over time, but striving for "aircraft code" helps the system in which the code lives to retain value much longer.
    - "I think that Ward's original intent isn't actually useful, because the whole point of debt being a valuable financial instrument is that you can *account for it*. That means at any time, folks can see the *exact amount* of debt one has incurred, *how* it was incurred, and the implications of that debt (balloon payments coming up, interest rates rising, etc.). None of that visibility is available for codebases (despite various code metrics that can be useful in and of themselves).
        - So, I don't use the term much at all, using "technical risk" and "technical friction" instead."
    - "The problem with this metaphor goes much deeper (aside: Ward's usage is fine as I'll explain): not just because it lacks sufficient coherence, but also because it subverts the analogical process from a pedagogical standpoint.
        - As Lakoff points out (and Ward had just read Lakoff as I understand) metaphors map source (familiar) domains to target (new) domains. When we say X is like Y, Y is something we (and crucially, our audience) are familiar with, and so we describe X by analogy to Y to aid new understanding.
        - The effectiveness of this is a function of the coherence between the two domains AND our familiarity with the source domain. Deeper coherence means that more elements of Y (source) map to X (target) allowing us to reason in the source domain and infer into the target. Better coherence means better reasoning.
        - So while it is true that there is limited coherence between the Debt (source) domain and the Software (target) domain, the much bigger problem is that the source domain ISN'T NECESSARILY FAMILIAR TO TECH FOLKS. We're actually using a metaphor from outside our own domain to explain it! 
        - Now, I can defend Ward. As he points out in that video on tech debt, he was working with financial traders at the time he coined the metaphor, and so he used something familiar (to them) to explain why the team would revisit code as they learned. In exchange for faster delivery they were borrowing time from the future to incorporate what they had learned.
        - This IMO is precisely good metaphor usage because it maps a familiar domain to a unfamiliar one, for the target audience only as much as was needed to get the point across.
        - But as the coinage spread, it increasingly became used by (supposedly) tech folks to talk to other (supposedly) tech folks about anything that wasn't good about the current solution. We stretched it beyond both its audience and coherence until it became synonymous with everything anyone wanted to disparage about code to anyone. The madness of our industry's knowledge sharing summed up in two words.
        - In short: I hate this metaphor because it is the most glaring reminder that our industry lacks any kind of common reference for discussing ideas, and so we're stuck leaning on shitty metaphors borrowed from literally any other domain to talk amongst ourselves."
    - "I don't think it's even a good metaphor, because the mapping doesn't work, without the accounting part.
        - (Agree that few developers understand debt at that level anyway)"
    - "It does in context to the limits of what Ward intended it's usage and audience to be. I agree it doesn't go much further.
        - The accounting was in the 'more time needed later'."
    - "I disagree: execs who understand debt and the appropriate usage, believe it's useful because there can be measurement and accounting in finance. It's unstated, but there.
        - It may have worked in that very specific scenario with the people and history involved.
        - Sure at a very high level, we're 'borrowing from the future', but then it's a very shallow metaphor."
            - (THREAD)
            - "With respect, you're generalizing beyond it's scope. It was (apparently) appropriate and useful to the actual people he was talking to): cf https://youtu.be/pqeJFYwnkjE"
            - "Yeah, I was generalizing to those who try and use the term "correctly" (we're going to know more later), but I'm guessing there was some assumed shared implicit knowledge that perhaps Ward wasn't aware of? (I'll have to rewatch the video, it's been a while since I saw it.)"
            - "It's been a while for me too, but what struck me when I watched this (as I was working with traders at the time and had coincidentally just read Lakoff) was how effective this would be to sharing a difficult topic with them (i.e. why we're not going to do months of planning up front). i.e. at that place and time, that was the key insight he wanted to convey, not the design/borrowing bit (the emphasis got reversed and then completely obliterated after that).
                - Traders instinctively understand the ida of "no free lunch" and I think he was trying to convey that this would be the tradeoff. Which btw, is very attractive to someone for whom time to market is all important.
                - The rest of us started using it to talk about the target domain. That's the fundamental error because (as you correctly point out) it doesn't work well in reverse AND almost noone who isn't a financier understands debt as anything other than == 'bad'"
            - "I think options makes for a better metaphor (and Beck has expanded on it lately), though doesn't have the benefit of casual use (nobody casually buys/sells options, vs. casually having a credit card/debt—which, yeah, people having that casual relationship does often mean that having it is 'bad')."
            - "Better, but still backwards. I love Kent and his ideas, but it's making the problem worse not better, we need to stop using metaphors to other domains to communicate amongst ourselves. Raisinbread and solar system metaphors worked in the early days of physics to convey the new idea of atomic structure, but can you imagine them talking about raisins or planets instead of fundamental particles now?
                - So long as we stay "mired in the entangling brambles of metaphysics" the problem will persist. What we need is our own domain concepts, but (as I've ranted elsewhere) the foundations of our knowledge (software engineering, not computer science) are themselves shallow, so it's a very heavy lift.
                - Ever notice that everyone argues about the meaning of words like: test, design, quality, productivity & architecture? that's because there is no common ground for them, and all attempts to do so devolve into pedantry, because at the heart of SE is a bunch of (themselves) broken metaphors to the manufacturing industy. The problem goes all the way back to the fifties. In some important sense, those words mean NOTHING because they mean anything.
                - i.e. the only people who will understand you when you use one of those words are those who already do. You can't reach new people because there's no common reference."
    - "Right, and he wasn't aiming for anything more general. The mistake was taking it from it's context and resuing it not the metaphor itself."
    - "(Honestly, this is why I've always disliked the idea of metaphor in XP)"
    - "I do not use the phrase at all, and don't like its promulgation. At the heart of the matter: Managing debt is like driving, everybody thinks they're significantly better than average at it. Metaphors used as instruments are only valuable to me when they help me get to the goal. This one doesn't."
    - "I gave up, words what people think they are irregardless of what they were originally or what we want them to be."
    - "I feel like giving up so many words that used to have a specific meaning, but no longer do. It's so exhausting."
    - "That's only true when there's no common reference (as I just said in that thread earlier). i.e. it's true for the general case, but not for a well-defined knowledge domain. What has to come first is a solid foundation for knowledge sharing, which sadly the SE (not CS) domain skipped and continues to ignore. 
        - (my favorite paper on this topic: https://groups.psych.northwestern.edu/gentner/papers/GentnerJeziorski93.pdf)
        - i.e. giving up isn't a bad option... I tried exploring the topic and lost a decade (and counting) on saying anything at all."
    

