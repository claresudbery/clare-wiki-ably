---
layout: page
location: pages/think/code-princ/testing/leaf
permalink: /pages/think/code-princ/testing/TDD
---

## Docs And Blog Posts

- [Different styles of TDD and when we should use them - talk by Sandro Mancuso](https://youtu.be/KyFVA4Spcgg)
- [The concept of self-testing code](https://martinfowler.com/bliki/SelfTestingCode.html)
- [My refactoring article(s) on Martin Fowler's site](https://martinfowler.com/articles/class-too-large.html)
- [My InSimpleTerms blog - TDD category](https://insimpleterms.blog/category/tdd) (TDD category)

### Recommended reads on the topic ["Why hasn't TDD taken over the world yet?"](https://cucumber.io/resources/webinars/tdd-roundtable-series/)

- [research paper on TDD from Petr Jasek of Aalborg University, Denmark](https://t.co/lQoS3ilFA8?amp=1)
- TDD techniques: http://codemanship.co.uk/parlezuml/blog/?postid=987
- [Summary of the "Is TDD dead?" controversy started at RailsConf by David Heinemeier Hansson](https://pythontesting.net/agile/is-tdd-dead/)
- [Martin Fowler's write-up of the debate about Is TDD Dead between himself, Kent Beck and David Heinemeier Hansson](https://martinfowler.com/articles/is-tdd-dead/)
- [Kent Beck's sarcastic (but instructive) "TDD is dead" Facebook post](https://www.facebook.com/notes/kent-beck/rip-tdd/750840194948847)
- [Twitter thread started by Matt Wynne as input into our webinar, encouraging people to ask questions about TDD](https://twitter.com/mattwynne/status/1285239134232158215?s=21)
- Twitter thread by Mike Hadlow: ["I was a hard-core TDD evangelist. Now I realise it was all a mistake..."](https://twitter.com/mikehadlow/status/1263819765900095491?s=21)
    - Response to that thread (not sure who from, sadly I lost the original tweet): "[Comparing Peter Norvig and Ron Jeffries trying to write a sudoku solver is my favourite illustration of this](https://news.ycombinator.com/item?id=3033446)"
- [Miro created at XP Manchester](https://miro.com/app/board/o9J_lVcMmxU=/) in an attempt to use the Five Whys technique to determine why XP isn't more widely adopted.

## What if unit tests are not tests?

Frustratingly I've lost the original conversation because it happened on Google hangouts on an account I no longer have access to (my TW account).

But Dan North's view is that writing unit tests is not really "testing".

There are some hints at the detail of this on [this Twitter conversation](https://twitter.com/bendre/status/1047585835514773505?s=21). That conversation brings up the idea of talking about "examples" instead of tests. You can read more about that [here](https://cucumber.io/blog/bdd/example-mapping-introduction/).

Dan North also did a lightning talk on this topic at NDC London 2019, and here are my notes from that:

- Kent Beck and Ward Cunningham wanted Incremental 
- Soul of testing stolen by TDD
- Not really test driven 
- Is really automated checking
- Increasing confidence for stakeholders through evidence 
- Need to be ingenious 
- Need to be pragmatic 
- Make some serious trade offs
- How confident is confident enough 
- Customers don't even know the systems they're running 
- Want everything delivered all at once 
- TDD allows us to move at a measured pace, quickly and easily do stuff 
- TDD had the wrong name 
- Testing is another set of skills 
- Naming things is really hard 

## Mocks and Mocking 

### Mocking Terminology (Doubles, Mocks, Stubs, Fakes, Dummies and Spies)

My notes here were originally taken from [this article](http://blog.8thlight.com/uncle-bob/2014/05/14/TheLittleMocker.html).

#### Test Doubles

- Overall term for different kinds of mocking objects, eg
    - Dummy
    - Stub
    - Spy
    - Mock
    - Fake

#### Dummy / Dummies

- You pass this into something when you don’t care how it’s used
- Like *when you must pass an argument, but you know the argument will
never be used.*
- The difference between a dummy and a stub is that the stub will actually get used by the code you pass it to, whereas the dummy won't.

#### Stubs

- A replacement for functionality you don’t want to call and you don’t
want to test
- Eg an authoriser that just returns true

#### Spy / Spies

- An object that records when it is called and what arguments are
passed to it
- \! Be careful. It can make your tests fragile / brittle.
    - *The more you spy, the tighter you couple your tests to the
    implementation of your system.*
    - *This is because your test is expecting certain functions to be
    called with certain arguments, so your tests will be broken by a
    refactor*

#### Mocks

- Mocks are always spies
- Mocks know what they are testing
- You move the assertion from the test, into the verify method of the
mock
- *What the mock is testing is* **behaviour**
- *The mock is not so interested in the return values of functions.
It's more interested in what function were called, with what
arguments, when, and how often.*
- *Moving the assertion in this way does create more coupling, but it
makes it a lot easier to write a mocking tool*
- [Famous paper by Martin Fowler that explains it well](http://martinfowler.com/articles/mocksArentStubs.html)

#### Fakes, aka simulators

- Like a stub, but contains behaviour
- For instance, a user called Bob who is always authorised
    - He doesn’t exist really
    - But he will get us past code we are not interested in
- “A Fake has business behavior. You can drive a fake to behave in
different ways by giving it different data
- A fake is the only kind of test double that has real business
behaviour
- But it can get very complicated – you can end up writing tests to
test the fakes
- They’re best avoided if possible”

#### Auto-mocking

- Available from RhinoMocks, StructureMap, Moq, and many others.
- Will build instances for you, injecting mock dependencies, so when
your class has a lot of dependencies you don’t have to manually
construct a mock for each dependency passed in
- [Nice description here](https://lostechies.com/joshuaflanagan/2009/02/04/auto-mocking-explained/)

### Mocks and TDD

- Andy Longshaw: [Reflections on brittle tests and mocking](https://blogs.blueskyline.com/2020/07/30/this-cant-possibly-be-right/)
- "When we came up with mocks, they weren't a TDD technique. They were a way to use TDD when designing the protocols between state machines. ... We designed mock frameworks to be a brutal early warning sign that our design was going off the rails." @natpryce
- @DeeJayGraham: "mocks should only be used in early development of code to help sketch out an interface quickly. Then code should be testable not to need them - contrary to previous popular advice to use mocks where things are “a bit hard” to test"
    - @theMrTortoise: "When things are hard to test ... Refactor."
- @tooky "All this talk of TDD, how it makes you face your design, how test doubles make things brittle, when to use mocks, when not to use mocks. Reminds me to share @sandimetz' Magic Tricks of Testing: [youtube](https://www.youtube.com/watch?v=URSWYvyc42M) / [slide deck](https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf) 
- [**Unit Testing Principles, Practices, and Patterns**](https://www.manning.com/books/unit-testing) by @vkhorikov
- @AndreasM_DK: "It might be tempting to mock away flakiness but... [**Simulate only things you completely understand**](https://vimeo.com/146987369) - from @gojkoadzic - old but good"
- Mocks should be used to highlight how your object affects and is affected by other objects and to see how the state of other components is being affected.
- Mocks should not be exposing the innards of other objects.
- You should be putting most of your thought into the protocols between objects rather than the objects themselves.
- [My original question on Twitter that led to some of the answers above](https://twitter.com/ClareSudbery/status/1289475539191963648?s=20)

## Ideas / Approaches

- Steve Freeman: "Early XP trainings used to include a week-long “pure” project to really get the flow."
- TDD techniques (ie Classic vs London): http://codemanship.co.uk/parlezuml/blog/?postid=987
    - [More on that, re double-loop and outside-in](http://coding-is-like-cooking.info/2013/04/outside-in-development-with-double-loop-tdd/) from Emily Bache
- "The problem is that the gap between katas and production code is still to big. Lately I've found mob programming in production code to be really effective. My current formula is katas + mob programming with someone who knows what they are doing." @emilybache
- "Moving from katas to real world problems, its important to know that you don't have to write the tests in programming languages. It could be in the domain language - or @emilybache's TDD with diagrams." @thebddadvocate
    - "Approval testing is the term to google to learn more about how you could use sketches to do TDD" @emilybache
- "You can try ignoring the refactor step for a while and measure the difference. Using code complexity metrics etc." @thejonanshow
- On the idea that it's hard to convince stakeholders of the benefits of TDD because they think it will slow us down: "So, we are asking permission from management to think carefully? It makes my heart sink." @keithb_b [Go slow to go fast](https://www.agilemastery.online/2020-08-01/go-slow-to-go-fast.php).

## Misc

- [TDD tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=65ff390c-ddb3-45f6-9de5-762606dfc826&query=tag%1FTDD%1FtagGuid%3Ad39ee366-abf9-4984-9ac7-f41d93f6460a%1Eview%3AVIEW%2FALL_NOTES&)
- [Cyber-dojo](https://cyber-dojo.org/) is a fantastic tool for getting straight into a kata in any language without setting up an IDE or dev environment. Really useful for workshopping in groups. Note that if you are not using it in a not-for-profit context, you should buy a (very cheap) licence. Details [here](https://blog.cyber-dojo.org/2015/08/cyber-dojo-foundation.html).

## Tips and Terms and Tools

### Sliming

- [Sliming](https://www.destroyallsoftware.com/screencasts/catalog/when-to-generalize-in-tdd#:~:text=When%20a%20TDDed%20test%20fails,in%20the%20%22right%22%20way.) is the technique where you make your code do something trivial and hard-coded just to make your test pass - it's unlikely this will end up being production code. [Nice description here from Denise Yu](http://deniseyu.github.io/leveling-up-tdd/) (scroll down a bit) 
- "[http://cyber-dojo.org](http://cyber-dojo.org) is a great place to practice TDD." - @sebrose
- "Code retreat started by @coreyhaines is another fun way to learn." @thejonanshow

### NCrunch

- If all tests are running after every change:
    - Change the NCrunch config so InstrumentationMode is set to Optimised
    - This is possible via Extensions | NCrunch | Configuration within Viksual Studio, but it didn't seem to take effect until I manually edited `[solution name].v3.ncrunchsolution` to include the line `<InstrumentationMode>Optimised</InstrumentationMode>` in the settings section.
    - I confess I'm quite confused about this though - it definitely seemed to have an impact when I did this on the `live-demo-2020-11-27` branch of the `Reconciliate` code base (see [this commit](https://github.com/claresudbery/Reconciliate/commit/bfaf525)), but the most up to date version of the `master` branch does not have this line in the config file... and it definitely doesn't run all the tests on every change. [shrug]
- File not found:
    - If a test fails because a file was not found, it may be that you need to include a test file in your NCrunch settings:
    - In Visual Studio: 
        - Extensions | NCrunch | Configuration
        - In the top pane, double-click the shared settings for your project
        - In the bottom pane, set "Additional files to include" in the General section.
    - If you're using approval tests (as used by [Gilded Rose](/pages/think/code-princ/Refactoring#gilded-rose)), the first time you run the test it will create a "received" file (eg `ApprovalTest.ThirtyDays.received.txt`). Create a copy of this with the suffix `.approved.txt` instead of `.received.txt`, and the file not found error should go away.

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [SimpleCardGameKata](https://github.com/claresudbery/SimpleCardGameKata)
- [Reconciliate](https://github.com/claresudbery/Reconciliate)
- [getting-started-with-tdd-in-react](https://github.com/claresudbery/getting-started-with-tdd-in-react)
- [BowlingGameKata-TDD-as-if-you-meant-it-](https://github.com/claresudbery/BowlingGameKata-TDD-as-if-you-meant-it-)
- [Jon Acker's TDD katas](https://github.com/jon-acker/coding-katas)