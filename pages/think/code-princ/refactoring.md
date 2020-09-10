---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Refactoring
---

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [CodeRetreatLegacy2](https://github.com/claresudbery/CodeRetreatLegacy2)
    - From workshop done with Mark Kirschstein at LateRooms.
- [RefactoringExamples (PRIVATE)](https://github.com/claresudbery/RefactoringExamples)
    - The original markdown for my [refactoring article on Martin Fowler's site](https://martinfowler.com/articles/class-too-large.html). 

## Docs and Blog Posts

- My [refactoring article on Martin Fowler's site](https://martinfowler.com/articles/class-too-large.html)
- [My notes from Martin Fowler's Refactoring Seminar](http://insimpleterms.blog/martin-fowler-webinar-new-refactoring-book)
- [MF's Refactoring book - web copy (InformIT)](https://memberservices.informit.com/my_account/index.aspx?partner=53&_ga=2.102882948.507915267.1547471980-1562501179.1547471980)
- [Dave Farley's youtube series on refactoring](https://www.youtube.com/watch?v=p-oWHEfXEVs)

## Misc

- [Refactoring tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=dbccb66e-f286-40ac-a13e-93848ca66909&query=tag%1Frefactoring%1FtagGuid%3A2a3fac9f-ae6f-43b6-b619-f20d2eca33be%1Eview%3AVIEW%2FALL_NOTES&)
- @KevinRutherford and @JJeffries1 have a [good refactoring video](https://www.youtube.com/watch?v=fSr8LDcb0Y0) from XP Manchester which focuses on connascence. 

## Actual sample code you can use for refactoring exercises

- Also see individual dedicated sections below for each code base listed here (I'm still building that list, so it may not be complete).
- Mark Kirschtein's [ferry booking example](github.com/Kirschstein/legacy-ferry-booking-system)
- Gilded Rose - see [below](#gilded-rose)
- [JBrains' Trivia](https://github.com/jbrains/trivia) - Mark Kirschtein uses this at legacy coding retreats. It's also been translated into many different languages.
- Mark Kirschtein says: "Another approach is to take a well known problem, checkout, potterkata etc and do it badly, that way you don't need to explain the domain."
- Emily Bache has several refactoring katas, recommended by many people:
    - [Tennis Refactoring Kata](https://github.com/emilybache/Tennis-Refactoring-Kata) - Jeremy Cook (@JCook21) says if Parrot example too simplistic then Tennis kata might work well.
    - [Parrot Refactoring Kata](https://github.com/emilybache/Parrot-Refactoring-Kata) - described by Jeremy Cook (@JCook21) as "The very simplest example that I know"
    - [Theatrical Players Refactoring Kata](https://github.com/emilybache/Theatrical-Players-Refactoring-Kata)
    - [Supermarket Receipt Refactoring Kata](https://github.com/emilybache/SupermarketReceipt-Refactoring-Kata)
    - Gilded Rose - see above
- Jim Jeffries (@JJeffires1): "I sometimes use the [trip service kata from @sandromancuso](https://github.com/sandromancuso/trip-service-kata)
 for this. It's partly about getting tests round some code, but if you do that bit beforehand you can get straight into refactoring."
 - @LisaCrispin says "@janetgregoryca has a great non-code exercise for that."

### Gilded Rose

- Described by Mark Kirschtein as "the canonical example" and [documented at some length by Emily Bache](https://github.com/emilybache/GildedRose-Refactoring-Kata) - as well as translated into several different languages.
- My C# attempt is [here](https://github.com/claresudbery/gilded-rose-kata).
- NB I've started writing these notes by just glancing at the code and haven't necessarily even found time to do the exercise yet, so this is just first impressions and may be misleading.
- It's all about stock having a sell by date and quality degrading with age.
- It has been translated into many different languages by Emily.
- Emily has also added one failing test and some test fixtures for text-based approval testing.
    - She uses a tool from texttest.org which has been implemented in many different languages.
    - Text-based approval testing is based on the golden master approach:
    - Before you change the code, you run it, and gather the output of the code as a plain text file.
    - You review the text, and if it correctly describes the behaviour as you understand it, you can "approve" it, and save it as a "Golden Master".
    - Then after you change the code, you run it again, and compare the new output against the Golden Master. Any differences, and the test fails.
- There are various different types of thing that age in different ways:
    - Some things increase in quality over time rather than decrease.
    - Some things don't decrease at a constant rate.
    - Some things (concert tickets) lose all value after a certain date.
- Your challenge is to add a new type of thing with its own rules.
- There are links in the repo readme about ways of approaching it, and [here](praqma.com/stories/advanced-testing-refactoring-techniques/) are some discussions of different approaches. 

### Parrot

- [Here](github.com/emilybache/Parrot-Refactoring-Kata)
- NB I've started writing these notes by just glancing at the code and haven't necessarily even found time to do the exercise yet, so this is just first impressions and may be misleading.
- Described by Jeremy Cook as "the most simple".
- It's pretty odd (IMHO).
- Each Parrot is initialised with a type (eg "African"), a voltage, a number of coconuts and a boolean for "Nailed".
- You can then call GetSpeed to find the speed of the parrot.
- The tests have cases which describe the expected speed for only a small subset of combinations of the four factors. What happens in other circs is not specified.
- It looks like maybe the tests will initially fail? Not sure about that.
- The readme hints that you will want to use polymorphism to improve the code.
- The code as you initially receive it is basically just one switch statement.
- Inspired by Martin Fowler - [replace conditional with polymorphism](refactoring.com/catalog/replaceConditionalWithPolymorphism.html)

### Buzzer Dependency

- [Here](github.com/MrTortoise/refactor_buzzer_dependancy)
- NB I've started writing these notes by just glancing at the code and haven't necessarily even found time to do the exercise yet, so this is just first impressions and may be misleading.
- There are three APIs that cannot be altered - basically just three classes with one public method each
- The buzzer must go off when the temp goes over one threshold and below another. The buzzer must keep going off until the temp goes back within a certain range.
- The three APIs:
    - BuzzerUtilManager.PerformTemperatureChecks
    - Buzzer.Buzz
    - HeatSensor.GetTemperature
- "The point: Code with no tests is still testable."
- My questions:
    - John's version is not fully functional. Is the point to write the tests or to refactor the code? Or both?
