---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Gilded-Rose
---

## Gilded Rose: Getting Started With Approval Tests in C#

- There are two ways to run approval tests. The simplest is to use the nuget [ApprovalTests package](https://github.com/approvals/ApprovalTests.Net), as in [ApprovalTest.cs](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/csharp-liftup-start/csharp/ApprovalTest.cs). 
    - You need an approved file - `ApprovalTest.UpdateQuality.approved.txt` - this file has been added to the [`csharp-liftup-start` branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/tree/csharp-liftup-start) of Gilded Rose.  
    - You might need to install the [ApprovalTests](https://github.com/approvals/ApprovalTests.Net) nuget package: Tools => NuGet Package Manager => Manage Nuget packages for solution
    - You can use the Resharper test runner or the built-in Visual Studio test runner to run tests: 
        - Resharper test runner:
            - Click the blobs in the gutter on line 13 of [ApprovalTest.cs](https://github.com/claresudbery/GildedRose-Refactoring-Kata/blob/csharp-liftup-start/csharp/ApprovalTest.cs), where the `ApprovalTest` class is defined
            - …or Extensions => Resharper => Unit tests => unit test sessions
        - Built in VS test runner: 
            - Test => Test explorer
- The alternative way to run tests is to use the texttest utility 
    - [Instructions here](https://clare-wiki.herokuapp.com/pages/think/code-princ/Refactoring#gilded-rose-c-approval-testing-with-texttest-tool)
    - You need to edit `config.gr` - see commits in this [dedicated branch](https://github.com/claresudbery/GildedRose-Refactoring-Kata/commits/csharp-approval-fixes)

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