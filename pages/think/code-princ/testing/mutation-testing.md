---
layout: page
location: pages/think/code-princ/testing/leaf
permalink: /pages/think/code-princ/testing/Mutation-Testing
---

## Overview of mutation testing

- The basic principle:
  - make a small change to the code and see whether your tests fail
  - if they don't, you draw the conclusion that your tests are not adequate
      - (although it could be that the code you changed was redundant - but you should have a pretty good idea in advance - that's why you made the change)
- More detail:
  - Find the inflexion points - decision points - mostly if statements
  - For instance function with inputs and if statement
  - Write a test that asserts something is true in this case
  - A mutation framework will start changing values (inputs?) in the function to make the test fail (so basically it's finding the edge cases), then put boundaries on your test input values in response
  - Therefore it's a good starting point for golden master / approval testing, because it suggests your inputs for you.
  - You end up with a set of tests that tells you everything about how your code behaves. Then you can go away and decide if that's what the code SHOULD be... because otherwise you're maintaining your code's bugs.

## Useful resources

- [Chris Shepherd's XConf talk on mutation testing](https://www.youtube.com/watch?v=h_DBFHWn3YE&list=PL8f-F_Zx8XA8ygwmHhY9KIhazYM7oh7Wk&index=8&t=0s)
- [Mutation testing](https://www.guru99.com/mutation-testing.html)

## Demos

### Emily Bache - gilded rose

- Details [here](/pages/think/code-princ/refactoring.md#emilys-gilded-rose-demo-videos) of Emily Bache's refactoring demo on Gilded Rose, which uses some mutation testing.
  - Specifically Part 1: [Using CombinationApproval, code coverage and mutation testing to create test coverage](https://www.youtube.com/watch?v=zyM2Ep28ED8)
  - She used test coverage to get set up with decent approval tests
  - !! Note that the test coverage part of the above video is NOT mutation testing - you're altering test inputs instead of altering code to see whether tests fail.
    - ... but using test coverage alone, she could NOT create a fully comprehensive suite of tests
    - This is because you might hit a particular line of code with your tests, but just because you hit that line of code doesn't mean you hit it with every possible relevant set of data combinations
  - She addresses this [at 14:33](https://www.youtube.com/watch?v=zyM2Ep28ED8&t=873), where she uses mutation testing as an extra check to see how good her tests are.
    - She acknowledges that tools are available to help you, but just does a quick by-hand demo of mutation testing
    - She looks for edge cases in the code (eg `if (value < CONSTANT)`) and tweaks the guard values in the code to see what will happen and check her tests fail as a result
    - She repeats that exercise for all the guard values she can find in the code
    - For one of them, she finds a value that when she updates the code, no tests fail as a result (see [timestamp 15:52](https://youtu.be/zyM2Ep28ED8?t=952))
      - She works out this is because she has no test cases whose value is in the middle of a range which she has only tested at its edges
      - So she introduces a test case with a middle value, then mutates the code again, and this time a test fails.
      - Therefore she has "killed the mutant".
      - She sees a similar problem again [at 17:37](https://youtu.be/zyM2Ep28ED8?t=1057) and fixed it by adding another midrange value to the test data
    - ! Note that this was all done manually by eye and choosing obvious mutations, but there is still a possibility that you might have missed a relevant mutation doing it this way
      - To be extra safe, you can use a mutation tool to check you haven't missed any cases.
