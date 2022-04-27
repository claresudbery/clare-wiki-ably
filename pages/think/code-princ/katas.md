---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Katas
---

## Tools

### Cyber-dojo

- [Cyber-dojo](https://cyber-dojo.org/) is a fantastic tool for getting straight into a kata in any language without setting up an IDE or dev environment. Really useful for workshopping in groups. Note that if you are not using it in a not-for-profit context, you should buy a (very cheap) licence. Details [here](https://blog.cyber-dojo.org/2015/08/cyber-dojo-foundation.html).
- If you follow [this link](https://cyber-dojo.org/creator/choose_problem) you’ll see a list of katas on the left and then when you select one it describes the kata
- Quick start guide if you're working solo:
    - Go to [main home page](https://cyber-dojo.org/creator/home) 
    - If this is your first time: Select "Create a new practice"
        - If you've already started work: Click "enter an existing practice" and enter your saved ID
    - Select a particular challenge and click next
    - Select a language and click next
    - Select "solo"
    - Make a note of your ID and click OK (if you forget to make a note, you can still see it in your url on the next page)
        - If you return at a later date, you can use this ID to continue where you left off
    - The first thing you see will be an explanation of the problem
    - On the left hand side (depending on language) will be a code file and a test file
        - !! The initial code you see will probably have nothing to do with the actual challenge you are attempting. The platform uses the same "hiker" code by default for all challenges. This code is just there as a guide to give you a reminder of the syntax for tests and code in the language / test platform you have chosen.
        - You'll have to rename the files - which isn't obvious - the way to do this is to select the file and then click the grey square button to the right of the `+` and `-` buttons, top left
    - Write tests and code to make those tests pass by selecting the files on the left
    - Your first job is to write a test and see it fail. Then make it pass. Your next job is to write more failing tests, one at a time, and make them pass to gradually build a solution. Use tiny steps! The smaller the better.
    - Keep clicking test after every code change, to run the tests
    - Every time you run tests, you get a red, amber or green blob appear at the top. You can click on previous blobs to see the code at previous states.



## Kata definitions

- [Made Tech Learn Tech katas](https://learn.madetech.com/katas/)
    - (includes Bowling, Mumbling, Number to LCD, Roman numerals, Snake, Tennis, Tennis Refactoring, Turnstile, Wordwrap, Test Framework, Video Store and Mars Rover)
    - Note that the bowling kata can sometimes be a bit opaque (because if you don't play the game, the scoring is quite complex), but I've updated the [readme on the Made Tech site](https://learn.madetech.com/katas/bowling/) to have a simpler explanation (in case that gets lost, I've also added it to the readme in [my repo](https://github.com/claresudbery/bowling-kata-ruby))
- [Made Tech Learn Tech Sparring Exercises](https://learn.madetech.com/sparring/) (overview, then Tic Tac Toe (aka Noughts and Crosses) and Payroll exercises)
    - **Minimax algorithm**:
        - To get an unbeatable AI for [the tic-tac-toe kata](https://learn.madetech.com/sparring/tic-tac-toe/), people generally use the [Minimax algorithm](https://towardsdatascience.com/tic-tac-toe-creating-unbeatable-ai-with-minimax-algorithm-8af9e52c1e7d).
        - TDDing minimax can be tricky. I ended up drawing a lot of diagrams. My notes and diagrams are [here](https://github.com/claresudbery/tic-tac-toe-kata/blob/master/notes.md).
        - The tests for my TDDed minimax implementation are [here](https://github.com/claresudbery/tic-tac-toe-kata/blob/2bb3a41110a2f52996fdfe159088b99f9aea5c99/spec/intelligence_spec.rb), and the code is [here](https://github.com/claresudbery/tic-tac-toe-kata/blob/2bb3a41110a2f52996fdfe159088b99f9aea5c99/lib/intelligence.rb).
        - My version of the game is [deployed here](https://tic-tac-toe-kata.herokuapp.com/tictactoe) (the UI is terrible, I was mostly focused on TDDing minimax).
- Cyber Dojo (see above): If you follow [this link](https://cyber-dojo.org/creator/choose_problem) you’ll see a list of katas on the left and then when you select one it describes the kata
- There are six good refactoring katas pinned to the top of [Emily Bache’s github account](https://github.com/emilybache)

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
    - There's also a [Quick-start Ruby kata guide](/pages/coding/lang/oo/ruby/Ruby#quick-start-ruby-kata-guide)
- [tic-tac-toe kata in Ruby](https://github.com/claresudbery/tic-tac-toe-kata)
    - Also, [this is a nice implementation of the tic-tac-toe kata](https://github.com/Richard-Pentecost/tic_tac_toe) from our Made Tech academy engineers Richard and Claire, pairing together - note that it has a good example of using TDD to code the minimax game-playing AI algorithm