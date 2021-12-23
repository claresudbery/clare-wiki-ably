---
layout: page
location: pages/think/teach/leaf
permalink: /pages/think/teach/Samman-Technical-Coaching-Summary
---

(Technical Agile Coaching With the Samman Method, by Emily Bache - A Summary)

(See also [clare-tech page](https://github.com/claresudbery/clare-tech/tree/master/organising/private/career/samman-technical-coaching.md)) (accessible to Clare only)

## Foreword, Kent beck

- Software Dev = learning, where running programs = proof of learning.
- Learning with an experienced guide reduces fear of the unfamiliar and so speeds learning.
- Learning should be episodic. Digest after learning.
- Samman = small cost, low risk, high potential payoff.

## Intro

- Two examples introduced - using tests to fix buggy private functions, and using tests to design new code. No solutions described yet.
- Learning hour: starts with a warmup, then a coding activity.
- Samman method:
	- Ensemble working:
	- Code with your teams daily on their BAU as a mob, using driver-navigator
	- Use timers
	- Use whiteboards to sketch out ideas
	- Daily learning hour (see [Good Ideas](#daily-learning-hour))
	- TDD
	- Refactoring
- More about Samman
	- Samman = Swedish word meaning together
	- It's not the name of the collective Emily works with! That's ProAgile, I think.
	- Foundation = good relationships with colleagues
	- Focus on technical practices
	- Learn from one another
	- Change long term behaviour
- Benefits
	- Shorter lead time
	- Higher quality
	- Skilled devs attracted to the business (quality code, effective practices, healthy culture)
	- Life as a dev is more fun with high quality design and tests
	- Less tech debt
	- Accelerate by forsgren et el has a lot of useful research about the effectiveness of Continuous Delivery, which includes TDD
- Pitch
	- TDD and CI can't be learnt easily or quickly - requires teaching and practice.
- Other books by Emily
	- The coding dojo handbook
	- Mocks, sounds and fakes (never finished)
- Acknowledgements
	- Llewellyn falco cos based on his ideas
	- Emily started out by pair-coaching with him.

## The purpose of Samman

Aim for improved dev practices:

### Dev techniques

- Better unit tests
	- Suite of automated tests to go with code
	- demonstrate code works as intended
	- document assumptions
	- Provide safety net for refactoring
	- Facilitate cheaper maintenance
	- People often don't learn how to write good tests
	- Bad tests can increase maintenance costs without providing useful safety net
- CI
	- Implied trunk based development
- Refactoring and migrating
	- Should be safe
	- Add regression tests without taking big risks
- Incremental and iterative development
	- WIKI
	- Increments are vertical slices, whereas iteration is building gradually one advance at a time, even when that advance doesn't result in a full new increment? And each iteration gets feedback and is used to improve on the previous iteration? I think the idea is that increments are fine as long as you use iteration to build each increment gradually and refine the process as you go. Otherwise you will try to perfect each increment before getting feedback from the users.
	- Ref: https://www.zentao.pm/agile-knowledge-share/Scrum-what-%23039%3Bs-the-difference-between-incremental-and-iterative-development-845.mhtml

### Levelling up whole team together

- Build consensus about how this team wants to work
- Expected outcomes
	- First step = Insights - can be reached after 10-20 coaching days:
	- what good unit tests look like
	- What CI actually is
	- That you can safely refactor code you don't understand
	- You need iteration plus increments
	- Build skills and habits
	- Anchor ways of working
	- Finally:
	- Changes in attitude
	- Increases in skill
	- Improved code quality
	- More productive teams
- Measuring outcomes
	- WIKI Beware Goodhart's Law!
	- Anything you measure and start to use as a target can be gamed
	- Some measurements are more susceptible to that than others
	- Back numbers by qualitative measures, eg talk to people and find whether they really think things are improving
	- Attitudes
	- Simple survey
	- Enthusiasm for techniques
	- Improved code quality
	- Increased number of test cases
	- More frequent integration
	- Longer term:
	- Meeting deadlines more frequently
	- Fewer bugs
	- Fewer despairing calls to rewrite whole system from scratch
	- Increased productivity!
	- ...but this v hard to measure
	- See Rethinking Productivity in Software Engineering - compendium of essays from 2019
	- My suggestion: recruitment and retention?

### Ensemble Primer

- "on-som-bull"
- Ensemble not mob
- Typist not driver
- Everyone hears the navigator explain and sees the Typist type
- Use a timer - can make your own, which can be fun!
- Previous navigator becomes next typist
- You might like to have a third role = "researcher" - looking into tools, syntax etc
- Another possible role is "archivist" -
	- someone documenting decisions, alternatives, designs etc
	- Might also keep track of current goal
	- On a to-do list in the timer
	- Or a shared doc
	- Or on a whiteboard
- Navigator will get better results describing things in high level terms - "define a function called foo which takes one param called bar which is an int"
- Other team members can chip in if they want, but should choose their moments.
- You can also suggest shortcuts etc to typist
- It's good to ask questions if you're not following, but choose your moment
- You might want to pause coding for a group discussion.
	- Use whiteboards or online docs
	- Pause ensemble roles
	- Have a bias to action - aim to get back to coding soon ish
- Inexperienced teams will need a facilitator
	- This role is independent from other roles
	- Remind the team of the working agreements
	- Ensure regular role rotation
	- Help ensemble to reflect and improve
- !! If you have an idea, eg you see a refactoring which could aid readability, wait until tests are green before politely suggesting it.
- People from other teams can visit occasionally and use this as a way to understand what this team is doing
- Things a coach might be able to contribute:
	- Writing more or better unit tests
	- Introducing some refactorings to reduce coupling or increase cohesion
	- Introducing missed capabilities of the IDE
	- Introducing more design patterns
	- Increasing testability
	- Building features in smaller batches
	- Improving code quality
- Working with a well functioning ensemble gives you the superpowers to do everything above - but you might first need to put some work in to get them functioning effectively as an ensemble.
- Sal used a technique with the Cucumber mob where they would always have a shared mindmap of their planned approach, where they would tick bits off as they went along
Coaching behaviours in an ensemble
- Split into the following behaviours:
	- Teach
	- Mentor
	- Facilitate
	- Coach
	- Observe
	- Take short breaks
	- Retrospect
	- Breathing space between and during sessions
- The first four of those are outlined in the Coaching Competency Framework (http://www.agilecoachinginstitute.com/wp-content/uploads/2011/08/Agile-Coaching-Competencies-whitepaper-part-one.pdf)
- Teach:
	- Look out for teachable moments
	- Eg they need a particular technique they haven't used before
	- Pause the ensemble
	- Outline some theory
	- You might have pre-prepared slides
	- You could demonstrate on a quick kata
	- Go through some concepts
	- Immediately mentor them in using the technique
	- This way they're more likely to remember it
- Mentor:
	- Help the team to apply techniques they have already learnt
	- You may need to take over navigator role
	- Try to hand back navigation to them as quickly as poss
	- The more familiar they become, the less input will be needed from you
- Facilitate:
	- Conducting a process without having an opinion
	- Eg two design suggestions which have equal merit:
	- Facilitate the creation of two branches
	- Implement one suggestion on each branch
	- Facilitate a discussion about which is best
- Coach:
	- Professional Coaching, as defined by the ACI or ACF (Agile Coaching Institute, Agile Coach Federation)
	- Partner with people and support them to achieve their goals
	- Work on the assumption they have the answers within themselves
	- Your job is to help them fulfil their promise
	- A key tool is the "coaching question" - evokes action without telling them what you think the action should be
	- You DO have opinions, so this style of Coaching only works if they (a) already aspire to use techniques like TDD, and (b) have the basics of the skills they need.
	- So for instance if they're stuck on what test to write next. You might say, "what's next on the list of scenarios?" and then "what would you assert if this scenario was working?"
	- If coaching isn't enough to get them going, switch to mentoring or teaching.
- Observe:
	- Don't need to intervene
	- Give your whole attention to language and tone
	- Get a feel for whether the test-code-refactor rhythm is sustainable
	- See what they've learnt
	- See what could be improved
	- See whether anyone is being ignored or talked over (something you might bring up in 121s or retrospectives, or maybe you sign other team members to take on the same observational role, as an attempt to get them to see it themselves)
- Take short breaks
	- You don't have to be present all the time
	- Everyone should be free to leave for short periods, including you
	- Taking a break forces them to fend for themselves
	- Your goal is to make yourself entirely dispensable
	- Before leaving altogether, experiment with leaving them for longer and longer periods
- Retrospect
	- 15-25 mins before the end of a scheduled session
	- Preferably just after a commit
	- Get them to consciously realise what they have learnt
- Breathing space between and during sessions
	- 5-min break in the middle of a two-hour session
	- Make sure to finish on time or early
	- In offices you need time to tidy up at the end
	- Take a picture of all retro postits
	- Make sure you have time to rest before your next activity

## A Samman Career

- Pair coaching
	- A good way to learn
	- Useful for speeding up the process with larger orgs
	- Take it in turns to be facilitator while the other is a participant
	- Give private feedback
	- Re-assess after the first 10-day coaching block
	- You might want to split up and each take separate teams
	- Or do ensemble sessions separately but learning hour together
- Visiting coach programme
	- Invite other coaches to join you
	- Pair coach
	- Each coach stays for a 10-day block
	- Learn from one another
	- Teams being coached get more variety
	- All coaches paid at same rate
	- If you get invited, be flattered and take it seriously!
- Preparing for a coaching career
	- Core skills to be comfortable with:
	- TDD
	- Refactoring
	- Software design with loose coupling and high cohesion
	- Pair programming
	- Designing test cases
	- Presentation skills
	- Chairing and facilitating
	- White boarding
	- Live coding to demonstrate

## Good Ideas

### Daily Learning Hour

- One hour per day
- Starts with a warmup (see below)
- Then
    - coding exercises in pairs
- Finally:
    - Discussion re what was learnt while coding
    - Homework to try the exercise again alone

### Warmups

- Golden Rule of TDD: Ask people to call out, What are the five most important things about TDD?
    - Generate some discussion and use this to tease out the golden rule, which is "don't create any production code without a failing test that requires it".
    - This is a good one to do before a paired TDD exercise (eg try to apply the golden rule), to illustrate the rule in action.