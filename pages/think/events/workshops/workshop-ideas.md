# Collaborative Drawing / Dependencies Between Groups

Dave Rooney: I’m facilitating a workshop this week for our company’s product owners this week. I ran an exercise yesterday to demonstrate handling dependencies between groups, in which 4 pairs of people had to draw different aspects of an image of Spiderman. One did the outline, one did the eyes, one did the shading and the 4th drew the “web” artwork.
In the first round, they were given their instructions and told to go off and do their work. They had 5 minutes. For the second round they could plan together for 2 minutes and then draw separately for 3 mins. For the final round they had 5 minutes to work however they wanted. Here are the results, with Round 1 on the left and Round 3 on the right.

![spiderman drawings](/resources/images/spiderman-drawing.jpg)

The first round went exactly as expected, and visualized how most teams in the company go about dealing with dependencies. The second was actually pretty good, with initial collaboration but separate work. The third wasn’t quite “perfect” but all of the separate parts fit together quite well.
I’m really happy with how the exercise turned out!

What a great exercise! I can see a follow on (or parallel) one where they're asked to draw something, but only one person knows what it looks like—and they're not on any of the teams.

I'm curious: are they drawing on separate surfaces/canvases, and then combining them somehow?

Looks like transparencies

Yes, it was on 4 different transparencies which are then overlaid on each other

Nice illustration of individual work and integration problems.

I’ll give Esther Derby & Don Gray a chunk of the credit because I did use my PSL experience to come up with the idea and how to think through creating the problem for them to solve.

# The Difficulty of Software Estimation

- By @sjdayday
- Tried this out in a small group on Thurs 28/9/23
- Link: http://stevedoubleday.com/problem/
- The first problem under that link is a sliding puzzle game, and reprsents a move problem. The solution is the sequence of moves that gets us from initial situation to target.
    - The first game under the link was desiogned to be quick and easy! But I think I didn't spot this and my first moves made the problem harder to solve.
    - Still, I solved both problems in the time available.
- Move problems:
    - Eg: Every time you head to the ariport for a conference, you are solving a move problem.
    - They're roughly predictable in their solution time
- This link contains stats: http://stevedoubleday.com/graphA
    - Blue is game A, position 1
    - Green is game A, position 2
    - Mostly the blue bars are to the left of the green bars
    - This is a predictable result
- Problem B is an insight problem
    - The answer is that all the letters on the bottom row contain curves
- Insight problems
    - the presentation of the problem is likely to be misleading
    - the solution relies on a leap of insight
- Scientists have been working on insight problems for years
    - Reference: https://docs.lib.purdue.edu/cgi/viewcontent.cgi?article=1143&context=jps
    - They are pessimistic about getting any further with any way of formalising how to solve insight problems
    - There's no upper limit on the posibilie representations of a situation
    - In software that means it's v difficult to predict how long it will take to solve a problem
    - You can't predict who will wolve it quickly, who will solve it in a moderate amount of time, and who will ever solve it
    - When you look at their brains, there's no observable pattern until a second before they shout "I've got it" and then there's an observable amount of activity that represents the "aha" moment
- One way to think about software estimation is to think about insight problems
    - In software we're trying to find a new representation of what's going on at the domain level
    - The solution time for insight problems is an unsolved problem - draw that to people's attention
    - When we adopt agile methodologies, we are implictly acknowledging that insight problems are not predictable in their solution
    - I don't know how long this will take, but you tell me it's the most important thing, so this is what I'll work on and I'll try and get the next most iomportant smallest thing to be functional as soon as possible
- MY QUESTIONS
    - Neurodivergence and drugs and the ability to spot connections between normally unconnected things?
    - Are there things you can do to spur insight, eg get up and go for a walk, or approach things from a new angle?
        - Those activities give us new stimuli
        - Give us unconscious help rather than conscious
        - Taking a break / thinking abnout something else might be helpful, but it's not predictable. We don't know how helpful that break / distraction will be, and we don't know how quickly it will help us        
    - When things take longer than you thought in software dev, is that always an insight problem?
        - No, but project managers get hyper-fixated on the move problems
        - But they don't focus on the insight problems, and they exist too
        - the cognitive science gives us the ability to stop beating ourselves up about unpredictability and just accept it
        - But as Ron says, often things you think ought to be unpredictable that turn out not to be. eg APL programmers know moves that no other human would know
            - There are differences in people's heads that turn unpredivtable insight problems into predictable insight problems
            - So an experienced knowledgeable team is more likely to be correct in their estimations
        - Esther: 
            - Specialists vs generalists: Specialists are good at solving predictable types of problem
            - But generalists have a broader array of problem solving strategies and this gives them advantages when info is not complete and feedback might have longer loop
        - Once you've solved an insight problem, the next time you see it, it becomes a move problem
            - but there are always remaining insight problems that are genuine insight problems
- Laurent: Bongard problems
    - Hofstadter talks about them - one of the canonical categories of insight problems
    - this is being framed as a communication problem 

