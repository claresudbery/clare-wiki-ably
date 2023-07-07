---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Gilded-Rose
---

## Intro

This page was created specifically for workshops using Gilded Rose. I have more notes on Gilded Rose [over here](/pages/think/code-princ/Refactoring#gilded-rose)

## Gilded Rose: My forked repo

- I've forked the main repo and added a lot of branches for various different purposes
    - My branches are listed and documented in the `clare-fork-readme` branch [here](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/clare-fork-readme/README.md)

## Google doc / GitHub page for when clare-wiki is down

- [This Google doc](https://docs.google.com/document/d/18XsMcFpEaMVboDV34adPQAfoJumMS94Ya3nMOeOpjkc/edit?usp=sharing) has everything on this page
- [This GitHub-hosted page](https://github.com/claresudbery/OReilly-Bootcamp-Resources/blob/main/gilded-rose-approvals.md) also has same.

## Gilded Rose: Getting Started With Approval Tests in C#

- There are two ways to run approval tests. The simplest is to use the nuget [ApprovalTests package](https://github.com/approvals/ApprovalTests.Net), as in [ApprovalTest.cs](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/csharp-liftup-start/csharp/ApprovalTest.cs). 
    - See below for getting approvals working in .Net Core in Rider on MacOS
    - You might need to install the [ApprovalTests](https://github.com/approvals/ApprovalTests.Net) nuget package: Tools => NuGet Package Manager => Manage Nuget packages for solution
    - You need an approved file - `ApprovalTest.ThirtyDays.approved.txt` - this file has been added to the [`csharp-approval-fixes` branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/tree/csharp-approval-fixes) of Gilded Rose.  
    - You can use the Resharper test runner or the built-in Visual Studio test runner to run tests: 
        - Resharper test runner:
            - Click the blobs in the gutter on line 13 of [ApprovalTest.cs](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/csharp-liftup-start/csharp/ApprovalTest.cs), where the `ApprovalTest` class is defined
            - …or Extensions => Resharper => Unit tests => unit test sessions
        - Built in VS test runner: 
            - Test => Test explorer
- The alternative way to run tests is to use the texttest utility 
    - [Instructions here](https://clare-wiki.herokuapp.com/pages/think/code-princ/Refactoring#gilded-rose-c-approval-testing-with-texttest-tool)
    - You need to edit `config.gr` - see commits in this [dedicated branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/commits/csharp-approval-fixes)
        - I didn't manage to get this working in `csharpcore` in Rider on a Mac - gave up quite quickly though

### Gilded Rose and Approval Tests for .Net Core in Rider on a Mac

- use the `csharpcore` folder
- `Testtextfixture.cs` contains a `Main` function which is the equivalent of `Program.Main` in .Net framework
    - It currently only tests 2 days, so set the `days` var to 31 instead of 2 
- You need to add an `ApprovalTest.cs`
    - I copied the one from the `csharp` folder - I've also added it to the [`csharp-approval-fixes` branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/tree/csharp-approval-fixes) of Gilded Rose. 
- You need to install the `NUnit` and [ApprovalTests](https://github.com/approvals/ApprovalTests.Net) nuget packages: 
    - Until you have, the text will be red in the `using` clause at the top of `ApprovalTest.cs`
    - I've added them both to the `csproj` file in the [`csharp-approval-fixes` branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/tree/csharp-approval-fixes) of Gilded Rose. 
    - If you need to add them yourself...
        - click the icon that appears on the left of this line and it will give you an option to add the nuget package
        - or go to Tools => NuGet => Manage Nuget packages for GildedRoseTests
            - It will search for the package for you
            - Select it on the left, then click the green plus button on the right to add the package
- You need an approved file 
    - `ApprovalTest.ThirtyDays.approved.txt` - this file has been added to the [`csharp-approval-fixes` branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/tree/csharp-approval-fixes) of Gilded Rose. 
    - To generate your own, do the following:
        - (first add `ApprovalTest.cs` and install `NUnit` and `ApprovalTests` packages - see above)
        - Run the test in `ApprovalTest.cs` - click the green play button at the top of the file (by the class declaration)
        - This will create both an `approved.txt` file and a `received.txt` file
        - The first time I did this, it also opened up a diff tool with the two files side by side
            - but I couldn't work out how to copy the contents from the received file to the approved file
            - and then I lost that window and never saw it again!
        - The `received.txt` file will not be visible in the file explorer by default
            - You have to click the "Show all files" button, which is at top left of the explorer and looks like an eye with a file icon on its bottom right corner
        - Delete the `approved.txt` file, copy the `received.txt` file and rename the copy to `ApprovalTest.ThirtyDays.approved.txt`
        - Now the test in `ApprovalTest.cs` should pass
- Running tests
    - By default, when tests fail you'll just get an error saying the files don't match
    - To see where the mismatches are between expected and actual output:
        - make sure you can see both `approved.txt` and `received.txt` in the file explorer
            - You have to click the "Show all files" button, which is at top left of the explorer and looks like an eye with a file icon on its bottom right corner
        - select both files
        - Right click => Tools = Compare
            - or just Splat + D
    - Note that the `received.txt` file only persists when tests fail
        - The next time the tests pass, it will disappear (I think?)
        - You don't want to check it into source control
        - I've added it to `gitignore` in the [`csharp-approval-fixes` branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/tree/csharp-approval-fixes) of Gilded Rose. 

## Gilded Rose C# Approval testing with nuget ApprovalTests package

- See [here](/pages/think/code-princ/Refactoring#gilded-rose-c-approval-testing-with-nuget-approvaltests-package)

## Verify Approval Testing Tool

- See [here](/pages/think/code-princ/Refactoring#verify-approval-testing-tool)

## Gilded Rose: Working in Visual Studio

- Enterprise version of VS has Live Unit Testing - green button on right in test explorer (see image below) - equivalent to NCrunch

![gilded-rose-visual-studio-live-unit-testing](/resources/images/gilded-rose-visual-studio-live-unit-testing.png)

- You can do a lot of what Resharper provides just using VS default functionality
    - People without Resharper might need to change target version of project from AnyCPu to x86 (see image below)
    - You can't inline when using VS functionality
        - you only can if it's a one-liner
        - there's a big debate about this online apparently!
    - another one missing from VS is "remove braces"

![gilded-rose-visual-studio-no-resharper-change-target-version](/resources/images/gilded-rose-visual-studio-no-resharper-change-target-version.png)

## Gilded Rose C# Approval testing with texttest tool

- See [here](/pages/think/code-princ/Refactoring#gilded-rose-c-approval-testing-with-texttest-tool)