---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Katas
---

## Tools

- [Cyber-dojo](https://cyber-dojo.org/) is a fantastic tool for getting straight into a kata in any language without setting up an IDE or dev environment. Really useful for workshopping in groups. Note that if you are not using it in a not-for-profit context, you should buy a (very cheap) licence. Details [here](https://blog.cyber-dojo.org/2015/08/cyber-dojo-foundation.html).

## Kata definitions

- [Made Tech Learn Tech katas](https://learn.madetech.com/katas/)
    - (includes Bowling, Mumbling, Number to LCD, Roman numerals, Snake, Tennis, Tennis Refactoring, Turnstile, Wordwrap, Test Framework, Video Store and Mars Rover)
- [Made Tech Learn Tech Sparring Exercises](https://learn.madetech.com/sparring/) (overview, then Tic Tac Toe (aka Noughts and Crosses) and Payroll exercises)
    - **Minimax algorithm**:
        - To get an unbeatable AI for [the tic-tac-toe kata](https://learn.madetech.com/sparring/tic-tac-toe/), people generally use the [Minimax algorithm](https://towardsdatascience.com/tic-tac-toe-creating-unbeatable-ai-with-minimax-algorithm-8af9e52c1e7d).
        - TDDing minimax can be tricky. I ended up drawing a lot of diagrams. My notes and diagrams are [here](https://github.com/claresudbery/tic-tac-toe-kata/blob/master/notes.md).
        - The tests for my TDDed minimax implementation are [here](https://github.com/claresudbery/tic-tac-toe-kata/blob/2bb3a41110a2f52996fdfe159088b99f9aea5c99/spec/intelligence_spec.rb), and the code is [here](https://github.com/claresudbery/tic-tac-toe-kata/blob/2bb3a41110a2f52996fdfe159088b99f9aea5c99/lib/intelligence.rb).
        - My version of the game is [deployed here](https://tic-tac-toe-kata.herokuapp.com/tictactoe) (the UI is terrible, I was mostly focused on TDDing minimax).

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- The elevator kata:
    - [ElevatorKata01](https://github.com/claresudbery/ElevatorKata01)	
    - [ElevatorKata02](https://github.com/claresudbery/ElevatorKata02)	
    - [XPManLiftKata](https://github.com/claresudbery/XPManLiftKata)
- [GameOfLife01](https://github.com/claresudbery/GameOfLife01)
- [FizzBuzzKata](https://github.com/claresudbery/FizzBuzzKata)
- [SimpleCardGameKata](https://github.com/claresudbery/SimpleCardGameKata)
- [BowlingGameKata-TDD-as-if-you-meant-it-](https://github.com/claresudbery/BowlingGameKata-TDD-as-if-you-meant-it-)
- [CoduranceBankKata (PRIVATE)](https://github.com/claresudbery/CoduranceBankKata)
- [TrainRoutes (PRIVATE)](https://github.com/claresudbery/TrainRoutes)	
    - Thoughtworks recruitment exercise
- [ScreeningMathParser (PRIVATE)](https://github.com/claresudbery/ScreeningMathParser)
    - I think this was the recruitment test when I joined NICE as a contractor.
- [NumberToLCD_Kata (PRIVATE)](https://github.com/claresudbery/NumberToLCD_Kata)
    - Made Tech recruitment exercise
- Lots of Ruby katas are linked to [on my Ruby page](http://127.0.0.1:4000/pages/coding/lang/oo/Ruby#github-repos)
- [tic-tac-toe kata in Ruby](https://github.com/claresudbery/tic-tac-toe-kata)
    - Also, [this is a nice implementation of the tic-tac-toe kata](https://github.com/Richard-Pentecost/tic_tac_toe) from our Made Tech academy engineers Richard and Claire, pairing together - note that it has a good example of using TDD to code the minimax game-playing AI algorithm

