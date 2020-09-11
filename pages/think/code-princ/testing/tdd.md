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

### Recommended reads before Webinar panel on ["Why hasn't TDD taken over the world yet?"](https://cucumber.io/resources/webinars/tdd-roundtable-series/)

- [research paper on TDD from Petr Jasek of Aalborg University, Denmark](https://t.co/lQoS3ilFA8?amp=1)
- TDD techniques: http://codemanship.co.uk/parlezuml/blog/?postid=987
- [Summary of the "Is TDD dead?" controversy started at RailsConf by David Heinemeier Hansson](https://pythontesting.net/agile/is-tdd-dead/)
- [Martin Fowler's write-up of the debate about Is TDD Dead between himself, Kent Beck and David Heinemeier Hansson](https://martinfowler.com/articles/is-tdd-dead/)
- [Kent Beck's sarcastic (but instructive) "TDD is dead" Facebook post](https://www.facebook.com/notes/kent-beck/rip-tdd/750840194948847)
- [Twitter thread started by Matt Wynne as input into our webinar, encouraging people to ask questions about TDD](https://twitter.com/mattwynne/status/1285239134232158215?s=21)
- Twitter thread by Mike Hadlow: ["I was a hard-core TDD evangelist. Now I realise it was all a mistake..."](https://twitter.com/mikehadlow/status/1263819765900095491?s=21)
    - Response to that thread (not sure who from, sadly I lost the original tweet): "[Comparing Peter Norvig and Ron Jeffries trying to write a sudoku solver is my favourite illustration of this](https://news.ycombinator.com/item?id=3033446)"

## Mocks and TDD

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
- TDD techniques: http://codemanship.co.uk/parlezuml/blog/?postid=987
- "The problem is that the gap between katas and production code is still to big. Lately I've found mob programming in production code to be really effective. My current formula is katas + mob programming with someone who knows what they are doing." @emilybache
- "Moving from katas to real world problems, its important to know that you don't have to write the tests in programming languages. It could be in the domain language - or @emilybache's TDD with diagrams." @thebddadvocate
    - "Approval testing is the term to google to learn more about how you could use sketches to do TDD" @emilybache
- "You can try ignoring the refactor step for a while and measure the difference. Using code complexity metrics etc." @thejonanshow
- On the idea that it's hard to convince stakeholders of the benefits of TDD because they think it will slow us down: "So, we are asking permission from management to think carefully? It makes my heart sink." @keithb_b [Go slow to go fast](https://www.agilemastery.online/2020-08-01/go-slow-to-go-fast.php).

## Misc

- [TDD tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=65ff390c-ddb3-45f6-9de5-762606dfc826&query=tag%1FTDD%1FtagGuid%3Ad39ee366-abf9-4984-9ac7-f41d93f6460a%1Eview%3AVIEW%2FALL_NOTES&)

## Tips and Terms and Tools

### Sliming

- [Sliming](https://www.destroyallsoftware.com/screencasts/catalog/when-to-generalize-in-tdd#:~:text=When%20a%20TDDed%20test%20fails,in%20the%20%22right%22%20way.) is the technique where you make your code do something trivial and hard-coded just to make your test pass - it's unlikely this will end up being production code. [Nice description here from Denise Yu](http://deniseyu.github.io/leveling-up-tdd/) (scroll down a bit) 
- "[http://cyber-dojo.org](http://cyber-dojo.org) is a great place to practice TDD." - @sebrose
- "Code retreat started by @coreyhaines is another fun way to learn." @thejonanshow

### NCrunch

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

