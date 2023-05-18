---
layout: page
location: pages/think/events/other-talks/leaf
permalink: /pages/think/events/other-talks/SDD-Conf-2023
---

# Intro

- Note to self: I only attended two talks!
    - The rest of the time I was either sleeping, chilling or prepping / delivering my own two talks
    - I only attended two days, there are only 4 talks per day
    - The other talk I attended (Jules May), I missed the first half hour and anyway I was hungover, so didn't take live notes

# Jules May - Tech Debt

- Note: These notes were written the following day 
- Tech debt obeys the same rules as financial debt
- It has interest applied
- It compounds over time
- This means that if you allow it to accrue over time before you address it, the interest will accrue and cripple you
- There is a point, recognised in economics, where the interest is so high that the debt is unrecoverable
- This applies to tech debt too
- Therefore you must refactor and early and often, to keep the interest under control
- He told a story about how he had a convo with two fellow speakers at the speaker dinner the prev night (that was me and Kevlin!)
    - We talked about gilded rose and about tiny changes like removing curly braces
    - Jules said something like, he was mystified by this focus on tiny details
    - He suggested this is not proper effective refactoring, this is just "bug splatting"

# Allen Holub - using TDD to design architecture ("Design by Coding")

- TDD has nothing to do with testing
  - Dan North, example guided design
- You won't test exceptions or corner conditions (??)
- if you use tests to guide design, then "microtests" (Geepaw's term) are a nice side effect
- tests are really specifications - examples of how you expect to use the code
- then you write enough code so the example works
- then create the simoplest possible system to get the test to pass
- anything not covered by the example gets pulled out
- start on the outside, thinkking how you'll use it, then build the simplest thing possible
- the phrase "TDD" gives you the wrong idea - "example guided design" is better
- automated examples are documentatioon and specification (and yes, regulators / auditors will accept that as specification, particularly as you can run the test to verify the specification)
- don't use debuggers - they're too slow
  - effectively what you're doing in a debugger is writing an ad hoc test
  - but when you find the bug, you're effectively throwing that test away and losing it
- 100% coverage is a useful side effect of TDD
- run tests once per minute
- integration tests are not typically part of the TDD process
  - TDD will only give you microtests / unit tests
  - won't give you full end to end tests
  - that's Allen's interpretation of Dan North's assertion, I think?
- coverage is the world's worst metric
- instead of arguing about what kind of test double you're looking at (mock, fake etc) just call them all proxies - this thing is a proxy for the database
- you can't refactor without tests
- inductive testing - from particular to general
  - write a tiny test, get it to pass, write another tiny test
  - but this doesn't guarantee the full system will be tested
- Kent Beck
  - Make it run. Make it right. Make it fast.
  - Refactoring isn't necessarily part of the TDD process
  - runs = can ship
  - runs + right = ship + maintain? (or was this bit runs + fast?)
  - runs + right + fast = ship + maintain + keep going?
- trunk-based development = detect collisions quickly
- Get to green quickly
  - Make it run
  - Make it right
  - Make it fast
- "We were working in pairs, this was back in the days of pair programming"
- automated tests are essential for being able to push to prod
- use feature toggles to hide it from user
    - it needs to be in finished system
    - "you're doing integratioon unless you're doing integration"
    - Amazon are an example of a comapny routinely using 
    - Spotify release train releases every five minutes
    - so code has to be releasable at all times, because tyou don't know when the train's going to come by
- test pyramid: 
    - tiny: manual / exploratory: happens in parallel, is not a bottleneck
    - bigger: End to end tests: slow. every few days
    - bigger: integration tests: 
    - majority: microtests: every few minutes
        - if they aren't fast, you won't run them
        - never talk to external subsystems in a test - including your own subsystems that you created
- Proxies: 
    - Mocking frameworks: Slow. quicker to build your own
    - Mocks pretend
    - Spies obersve
    - You need dependency injection
        - either injected via constructor or via method argument
        - or use a factory - the core code has Factory.GetWidget
        - he never uses dependency injection frameworks (eg Spring) - he dislikes magic
- Use to do lists
- Tests should clean up after themselves and be runnable in any order
- extract code you want to change into separate method, so you only have to test the extracted stuff
- "Ron Jeffries sent me a pic of his desk the other day, it was covered in postits"
- Chicago (Detroit) TDD style: inside-out testing
    - I missed this
- London style: outside-in
    - When I send this call to my object, I expect this downstream call
- Behaviour driven development
    - testing behaviour: given/when/then
- APIS based on guesses are always wrong
    - Core of agility: Build the smallest possible thing
    - YAGNI
    - Invent the interface you wish exitesd
    - Code the story! Don't implement the intreface
    - Discover and fix flaws
- Authenticating a customer
    - The guard asks customer to sign in
    - The guard (hall monitor) finds the customer (student)'s signature card in the card file
    - If the signatures match, the customer is allowed in
    - step 1: identify actors / roles
        - the nouns are candidates: guard, signature card, card file, signature, customer
    - my attention drifted here, but next time I focused in, he was writing actual code (not tests)
    - he suggested 
    - he started with a Guard class, with a signInACustomer method
        - the signInACustomer method then called a method called askForTheCustomersCredentials which returned a SignatureCard object
        - this method did not yet exist, so he added it to the Guard class
    - then he added a CardFile class and gave it a method findMatchingCredentailFor(SignatureCard presentedCredential)
        - this allowed him to instantiate a new CardFile object within Guard.signInACustomer, and call file.doYouHaveAMatchFor(presentedCredential)
        - new method, needed adding to the CardFile class
    - he described himself as working outside in, with self commenting code
        - write the class that uses something first, then write the class that is used by the starting class
    - he crowdsourced the spotting of syntax errors, getting the audience to shout out and then comparing it to ensemble work
        - says he always works in an ensemble these days, so is used to having people spot these errors for him
        - but did also point out that he was demonstrating an ensemble anti-pattern of everybody spectating the driver do their thing, without having any significant input
    - if you have a complex workflow, every unique path is a different story
    - if there are branches in your logic, you can definitely make it smaller - each branch is a separate story
    - start at the outside edge - the_guard.signInACustomer() then get finer and finer grained as you move down into the structure

# ideas for me

- from allen's talk
    - gif of your own cat sleeping, on a loop, to represent calm, lack of stress
    - pretty much everyting he's saying is stuff I also say about TDD - I could do a talk like this!




