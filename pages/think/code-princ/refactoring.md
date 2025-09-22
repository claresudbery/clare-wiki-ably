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
- @emilybache's excellent [Gilded Rose code base](https://github.com/emilybache/GildedRose-Refactoring-Kata) - great refactoring exercise and contains code in a LOT of different languages.
    - My [C# branch of gilded rose](https://github.com/claresudbery/gilded-rose-kata/tree/csharp-test-start) with unit tests for use in exercises
    - ...but note that these days I'm mostly using my [forked repo](https://github.com/claresudbery/GildedRose-Refactoring-Kata) instead
        - See the [`clare-fork-readme`](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/clare-fork-readme/README.md) for notes on how I'm using the repo.


## Docs and Blog Posts

- My [refactoring article on Martin Fowler's site](https://martinfowler.com/articles/class-too-large.html)
    - [Live coding video](https://www.youtube.com/watch?v=72BbIsmKrLI&t=1s) of myself doing a walkthrough on Twitch of some of the refactoring mentioned in the article.
- [My notes from Martin Fowler's Refactoring Seminar](http://insimpleterms.blog/martin-fowler-webinar-new-refactoring-book)
- [MF's Refactoring book - web copy (InformIT)](https://memberservices.informit.com/my_account/index.aspx?partner=53&_ga=2.102882948.507915267.1547471980-1562501179.1547471980)
- [Martin Fowler refactorings catalog](https://refactoring.com/catalog/)
- [Geepaw Hill on refactoring](https://www.geepawhill.org/category/refactoring/)
- [Learn Tech refactoring guide](https://learn.madetech.com/guides/05-Refactoring/)
- [Dave Farley's youtube series on refactoring](https://www.youtube.com/watch?v=p-oWHEfXEVs)
- My interview with Robby Russell - ["Refactoring Should Be Part of Your Daily Work"](https://maintainable.fm/episodes/clare-sudbery-refactoring-should-be-part-of-your-daily-work) - on the Maintainable podcast
- I have refactoring videos in my SSE GDrive

## Misc

- [Refactoring tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=dbccb66e-f286-40ac-a13e-93848ca66909&query=tag%1Frefactoring%1FtagGuid%3A2a3fac9f-ae6f-43b6-b619-f20d2eca33be%1Eview%3AVIEW%2FALL_NOTES&)
- @KevinRutherford and @JJeffries1 have a [good refactoring video](https://www.youtube.com/watch?v=fSr8LDcb0Y0) from XP Manchester which focuses on connascence. 
- [De Morgan's Laws](/pages/think/code-princ/De-Morgans)

## Coverage

- Note you can use DotCover (in both Visual Studio and Rider) to check coverage
    - Rider details [here](https://www.jetbrains.com/help/rider/Cover_Unit_Tests_(Basic_Scenario).html)
    - V similar for Visual Studio
- NCrunch also gives you coverage indications

## Actual sample code you can use for refactoring exercises

- Also see individual dedicated sections below for each code base listed here (I'm still building that list, so it may not be complete).
- Mark Kirschtein's [ferry booking example](github.com/Kirschstein/legacy-ferry-booking-system)
- Gilded Rose - see [below](<#gilded rose>) and [separate dedicated page](/pages/think/code-princ/Gilded-Rose)
- [JBrains' Trivia](https://github.com/jbrains/trivia) - Mark Kirschtein uses this at legacy coding retreats. It's also been translated into many different languages.
- Mark Kirschtein says: "Another approach is to take a well known problem, checkout, potterkata etc and do it badly, that way you don't need to explain the domain."
- Emily Bache has several refactoring katas, recommended by many people:
    - [Parrot Refactoring Kata](https://github.com/emilybache/Parrot-Refactoring-Kata) 
        - described by Jeremy Cook (@JCook21) as "The very simplest example that I know"
        - more notes [here](<#parrot>)
    - [Tennis Refactoring Kata](https://github.com/emilybache/Tennis-Refactoring-Kata)  
        - My fork is [here](https://github.com/claresudbery/Tennis-Refactoring-Kata/branches) - used to demo various bits of refactoring 
            - Branches are listed [here](https://github.com/claresudbery/Tennis-Refactoring-Kata/blob/clare-fork-readme/README.md)
            - I have some videos to go with them - at the time of writing (May '22) in the coding videos folder in SSE GDrive
        - Jeremy Cook (@JCook21) says if [Parrot example](<#parrot>) too simplistic then Tennis kata might work well.
        - Here's a video of @Arkency tackling the [tennis refactoring kata in Ruby](https://www.youtube.com/watch?v=swokhWHKDmc)
        - Note I had some difficulty getting this running in Visual Studio. 
            - First I had to install [Visual Studio 2022](https://visualstudio.microsoft.com/vs/) (free Community version)
            - Then I was getting errors about Xunit in the test file, but I think they were misleading - what I really needed was .Net 6:
            - I had to [install .Net 6](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.202-windows-x64-installer) separately
            - Detailed Visual Studio notes [here].
    - [Theatrical Players Refactoring Kata](https://github.com/emilybache/Theatrical-Players-Refactoring-Kata)
    - [Supermarket Receipt Refactoring Kata](https://github.com/emilybache/SupermarketReceipt-Refactoring-Kata)
    - Gilded Rose - see above
- Jim Jeffries (@JJeffries1): "I sometimes use the [trip service kata from @sandromancuso](https://github.com/sandromancuso/trip-service-kata)
 for this. It's partly about getting tests round some code, but if you do that bit beforehand you can get straight into refactoring."
 - @LisaCrispin says "@janetgregoryca has a great non-code exercise for that."

### Parrot

- [Here](github.com/emilybache/Parrot-Refactoring-Kata)
- NB I've started writing these notes by just glancing at the code and haven't necessarily even found time to do the exercise yet, so this is just first impressions and may be misleading.
- Described by Jeremy Cook as "the most simple".
- I thought it was pretty odd until I finally spotted the Monty Python reference.
    - Here are my notes from that realisation:
    - Frustrating in that it doesn't explain what it's about. Maybe that's the point?
    - But anyway as far as I can work out, the code is trying to return the speed of different types of parrot
        - But what does "nailed" mean and why is `voltage` a parameter??
        - Ohhhh, it's a reference to the Monty Python dead parrot sketch!
        - In a workshop should probably start by showing this sketch??
        - In the sketch, the cutsomer brings in the "Norwegian blue" parrot they've brought from the shops and complains that it's dead - and is only upright because it's been nailed to its perch
        - I couldn't find any references to voltage on a quick google
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

### Theatrical players

- Used by Martin Fowler in his book
- Used by Emily to help identify code smells
- Code is [here](https://github.com/emilybache/Theatrical-Players-Refactoring-Kata)

### Tennis

- Used by Emily and me for lots of learning hours, and by me for one-day workshop (see my notes in clare-tech, and resources in SSE GDrive/SSE-Events, and Events drive for SDD conf)
- Code is [here](https://github.com/emilybache/Tennis-Refactoring-Kata)

### Product Export

- Used to demonstrate using coverage to design approval tests
    - See [coverage](<#coverage>) section
- Code is [here](https://github.com/emilybache/Product-Export-Refactoring-Kata)
- Possible workshop exercise is [here](https://sammancoaching.org/learning_hours/approval_testing_legacy/verify_xml_reports.html)
- Notes to get started
    - The refactoring aim is to remove duplication
    - The main code that you want to refactor is in `XmlExporter.cs`
    - Check out Emily's `with_tests` branch and look at the approved text files to get a feel for the output and see where the duplication is
        - Each report lists products and orders but in different formats and iwth different details included - handed individually in each function instead of using common code.


### Gilded Rose

- I now also have a [[gilded-rose|separate dedicated page]] devoted to getting started with Gilded Rose.
- Described by Mark Kirschtein as "the canonical example" and [documented at some length by Emily Bache](https://github.com/emilybache/GildedRose-Refactoring-Kata) - as well as translated into several different languages.
- My C# attempt is [here](https://github.com/claresudbery/gilded-rose-kata).
    - My notes on the approach I used are [here](https://github.com/claresudbery/clare-tech/blob/ea4cce0c797d2055e19577f546aad5118238eab9/made-tech/mt-org/demand-events/refactoring-workshop.md#gilded-rose) (currently available only to me).
    - ...but note that these days I'm mostly using my [forked repo](https://github.com/claresudbery/GildedRose-Refactoring-Kata) instead
        - See the [`clare-fork-readme`](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/clare-fork-readme/README.md) for notes on how I'm using the repo.
- NB I've started writing these notes by just glancing at the code and haven't necessarily even found time to do the exercise yet, so this is just first impressions and may be misleading.
- It's all about stock having a sell by date and quality degrading with age.
- It has been translated into many different languages by Emily.
- Emily has also added one failing test and some test fixtures for text-based approval testing.
    - See section below on [approval testing](<#approval testing>)
- There are various different types of thing that age in different ways:
    - Some things increase in quality over time rather than decrease.
    - Some things don't decrease at a constant rate.
    - Some things (concert tickets) lose all value after a certain date.
- Your challenge is to add a new type of thing with its own rules.
- There are links in the repo readme about ways of approaching it, and [here](https://www.eficode.com/blog/advanced-testing-refactoring-techniques) are some discussions of different approaches. 
- Is Sandi Metz's book All the Little Things based around the gilded rose kata?
    - She uses a technique in it a bit like lift up conditional?

#### Emily's Gilded Rose Demo Videos

- There are three videos made by Emily detailing some really interesting Gilded Rose refactoring:
    - Part 1: [Using CombinationApproval, code coverage and mutation testing to create test coverage](https://www.youtube.com/watch?v=zyM2Ep28ED8)
        - See [coverage](<#coverage>) section
        - See [below](<#combination approvals>) for description of combination approvals
        - See [mutation testing page](/pages/think/code-princ/testing/mutation-testing.md) for more on that
        - She looks at the values in the if statements, for instance `if (value < CONSTANT)` and guesses that therefore if you make your inputs be close to the guard value (`CONSTANT`), you are likely to find edge cases
        - Then she adds approval tests using those values
        - Then she looks at test coverage metrics to see whether there are any areas of code not covered by the tests
        - !It's important to notice that using coverage alone, she could NOT create a fully comprehensive suite of tests
            - This is because you might hit a particular line of code with your tests, but just because you hit that line of code doesn't mean you hit it with every possible relevant set of data combinations
            - This is where the mutation testing comes in, and I explain that bit on my [mutation testing page](/pages/think/code-princ/testing/mutation-testing.md#emily-bache---gilded-rose).
        - It's also important to note that what's described above (tweaking inputs and checking the results using code coverage) is NOT mutation testing, because you're altering test test inputs, but you're not altering the actual code too.
        - See the following timestamps for interesting demo points:
            - 0:55
            - 3:40
            - 4:45
            - 6:10
    - Part 2: [Using "lift up conditional" to untangle the code](https://www.youtube.com/watch?v=OJmg9aMxPDI)
        - I have detailed notes on this (Clare only) in clare-tech - LHs - lift-up-conditional.md
    - Part 3: [Replacing conditional with polymorphism](https://www.youtube.com/watch?v=NADVhSjeyJA)

#### Approval testing

- Text-based approval testing is based on the golden master approach (also called characterisation testing / characterization testing):
- Before you change the code, you run it, and gather the output of the code as a plain text file.
- You review the text, and if it correctly describes the behaviour as you understand it, you can "approve" it, and save it as a "Golden Master".
- Then after you change the code, you run it again, and compare the new output against the Golden Master. Any differences, and the test fails.
- For Gilded Rose, to run approval tests in Java, you need to update the `pom` file
    - See demo in Emily's video, starts timestamp 2:07 [here](https://www.youtube.com/watch?v=zyM2Ep28ED8&t=127s)
- For gilded rose and C#, there are at least two ways of running approval tests:
    - [`ApprovalTests` nuget package](<#gilded rose c approval testing with nuget approvaltests package>)
    - [`texttest` tool](<#gilded rose c approval testing with texttest tool>)
- For notes on running approval tests in Python, see Python.md
- For more examples of approval tests, see my various learning hour notes

#### Gilded Rose C# Approval testing with nuget ApprovalTests package

- NB: You probably don't need to do anything complicated with approval tests if you just want to get stuck straight in with refactoring. See [[gilded-rose#Gilded Rose Getting started with all tests in `C `|Getting started with all tests in `C#`]]
- Note that another C# approvals tool is also available - see [below](<#verify approval testing tool>). But otherwise...
- If you're running the gilded rose code in C#, there's an approval testing tool which is being used
- It's [this tool](https://github.com/approvals/ApprovalTests.Net)
    - That page linked to above gives an example of verifying an array
    - If you're starting from scratch, you first need to find a way of gathering enough possible outputs to cover your code
    - Then run an `Approvals` test
        - as in the above example, where an array of strings is used as the golden master
        - or as in `ApprovalTest.cs` in Gilded Rose, where Console output is redirected from Program.Main
        - or as in `XmlExporterTest.cs` in the `with_tests` branch of the [Product Export kata](https://github.com/emilybache/Product-Export-Refactoring-Kata), where xml is verified
        - also see my demo code in the `approval-tests` branch of [my fork of the Export Product kata](https://github.com/claresudbery/Product-Export-Refactoring-Kata/tree/approval-tests), where I create a dictionary of objects, call `VerifyAll`, and I implement `ToString` for the relevant class, so that each object can be printed out into the approval file.
        - Then copy the `received` file into a long-lived `approved` file as in the example below
- Find `ApprovalTest.cs` and run the test in this file
- You'll probably find the first time you run it, it fails
    - When it fails, it shows you the correct output and the actual output in a merge tool (my system uses KDiff3), so you can see why it's failing
- The reason for this is that it needs a template to compare output against
- When the tests are run, it creates two files: `ApprovalTest.ThirtyDays.approved.txt` and `ApprovalTest.ThirtyDays.received.txt`
- It then compares the two files, and if they match, the test passes
- What you need to do is copy the `received` file into the `approved` file.
    - This command will do that for you on the command line: `cp csharp/ApprovalTest.ThirtyDays.received.txt csharp/ApprovalTest.ThirtyDays.approved.txt`
- After this when you run the test, it will pass and the `received` file will be deleted as soon as the test is run.

#### Gilded Rose C# Approval testing with texttest tool
    
- NB: You probably don't need to do anything complicated with approval tests if you just want to get stuck straight in with refactoring. See [[gilded-rose#Gilded Rose Getting started with all tests in `C `|Getting started with all tests in `C#`]]
- Emily uses an approval testing tool from texttest.org which has been implemented in many different languages:
- Full details are [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/main/texttests), but here is a summary:
- `TextTest` is a Python-based tool, 
    - It has to be installed separately (see below).            
    - Once you've installed `TextTest` you need to go to the `texttests` sub-folder in the Gilded Rose repo and find the file `texttests\config.gr` and uncomment the lines that relate to the language you're using.
        - You also need to build the code in whatever language you're using
        - For instance if you're using `C#`, you need to build the executable that's referred to in `config.gr`
        - Note that the default value for `C#` in `config.gr` is incorrect - it should be `/csharp/bin/Debug/csharp.exe` rather than `/GildedRose.exe`
        - Now you can run the approval tests, by running `testtext &` on the command line 
    - You can install the [GUI tool for Windows here](https://sourceforge.net/projects/texttest/)
        - I had to click the Download button a few times before it actually downloaded - I don't know why
        - Then I had to run the tool manually, close it, and restart my bash prompt before I could run the Gilded Rose approval tests
            - Do this by running `texttest &` on the command line in the root Gilded Rose folder - this will bring up the UI
            - (First edit `config.gr`, and build an updated executable - see above)
            - now you have to select ThirtyDays on the left, and press the run button at the top of the screen.
            - This will open a new window with the results of the tests. If they fail, you can click Approve to make the new results be the new master, or you can just close down the window if you don't want to do that.
        - There are also tools for Linux and Mac in the "Installing TextTest Development Tools" section [on this page](https://texttest.org/)
    - ...or you can install the Python command line tool:
    - First install [Python3](https://www.python.org/)
    - For Windows, you can download one of the installers at the [bottom of this page](https://www.python.org/downloads/release/python-3104/) (for most people, it's 64-bit), then just follow instructions. It's recommended to click the final button to allow longer file paths.
        - ! I found I got `command pip not found` after this, so I had to run the installer again, select "modify installation" and make sure that pip was installed
        - Still no joy after that, so I had to modify my path - follow instructions [here](https://medium.com/swlh/solved-windows-pip-command-not-found-or-pip-is-not-recognized-as-an-internal-or-external-command-dd34f8b2938f)
    - After that, you can run `pip install texttest` in Bash prompt or Windows Terminal or Windows Powershell.
    - Full `TextTest` installation instructions are [here](https://texttest.org/) 
    
#### Verify Approval Testing Tool

- NB: You probably don't need to do anything complicated with approval tests if you just want to get stuck straight in with refactoring. See [[gilded-rose#Gilded Rose Getting started with all tests in `C `|Getting started with all tests in `C#`]]
- Emily showed us a new tool for Approval Testing. We'd previously been using `Approvals`, but this one is called `Verify`.
- Details [here](https://github.com/VerifyTests/Verify).
- Demo video from Emily [here](https://www.dropbox.com/s/arpaxxqbrcyn0x3/SupermarketReceipt_csharp_verify.mp4?dl=0).
- Annotation is different - looks like this - `[UsesVerify]`
- You can use the `NUnit.Verify` package - others exist for other test frameworks.
- Each test case has to return `Task` (from `System Threading`) instead of `void`
- At the end of the test: `return Verifier.Verify(myStringResult);`
- What's produced is a "verified" file rather than an "approved" file - that you work with at the end
- There's a Resharper plugin that will give you new resharper context menu items for Accept and Compare - makes it easier to work with output files.

#### Combination Approvals

- NB: I now have a whole learning hour for combination approvals. See my "Approvals Testing and Code Coverage" Learning Hour, which is the first part of my coverage and mutation testing LH (Clare only: see `code-coverage-add-tests.md` in `clare-tech`).
- Demoed by Emily [here](https://www.youtube.com/watch?v=zyM2Ep28ED8&t=400s) (timestamp 6:40)
    - You can test different combinations of values
    - Instead of just calling one function with one set of inputs / outputs, you can pass in arrays of values and ask it to test all combinations