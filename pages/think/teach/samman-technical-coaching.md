---
layout: page
location: pages/think/teach/leaf
permalink: /pages/think/teach/Samman-Technical-Coaching-Summary
---

(Technical Agile Coaching With the Samman Method, by Emily Bache - A Summary)

(See also [clare-tech page](https://github.com/claresudbery/clare-tech/tree/master/organising/private/career/samman-technical-coaching.md)) (accessible to Clare only)

## Preface

### Foreword, Kent beck

- Software Dev = learning, where running programs = proof of learning.
- Learning with an experienced guide reduces fear of the unfamiliar and so speeds learning.
- Learning should be episodic. Digest after learning.
- Samman = small cost, low risk, high potential payoff.

### Intro

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

### The purpose of Samman

Aim for improved dev practices:

#### Dev techniques

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

##### Incremental and iterative development

- WIKI
- An increment is an addition, whereas an iteration is a change. The idea is that you make small additions (increments) to your product, but for each new increment you iterate, gradually refining the increment with each new iteration - ie changing it in response to feedback.
	- So for instance an increment would be a vertical slice, which will change iteratively as you refine it in response to feedback.
	- But even within your slice, you will ideally make small incremental changes as you build your implementation.
	- Geepaw says: "I don't use the phrase much anymore, at least not formally, because my own behavior doesn't seem to vary based on whether I'm adding or changing. I do increments and iterations and iterations and increments and I do them at various scales."
- [Reference on diff between incremental and iterative](https://itsadeliverything.com/revisiting-the-iterative-incremental-mona-lisa)

#### Levelling up whole team together

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

##### Measuring outcomes

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
- WIKI Beware Goodhart's Law:
	- Anything you measure and start to use as a target can be gamed
		- Also [as Woody Zuill quoted recently](https://twitter.com/WoodyZuill/status/1493228883147063296?s=20&t=zoFnbfK_nHcoM7MDsrhUkg), "If you try to improve the performance of a system of people, machines, and procedures by setting numerical goals for the improvement of individual parts of the system, the system will defeat your efforts and you will pay a price where you least expect it.” - Myron Tribus
	- Some measurements are more susceptible to that than others
	- Back numbers by qualitative measures, eg talk to people and find whether they really think things are improving

## Part 1: Ensemble Working

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
- Start with a working agreement
	- The first ensemble session will be spent hashing out all this stuff - allow extra time for that or even just devote the session to it.
	- Be explicit about the problem of people being distracted by phones, messages, browsers etc. Talk about how you can get people to stay present and focus on what's happening in each session.
	- Treat everyone with kindness, consideration and respect.	
- Inexperienced teams will need a facilitator
	- This role is independent from other roles
	- Remind the team of the working agreements
	- Ensure regular role rotation
	- Help ensemble to reflect and improve
- !! If you have an idea, eg you see a refactoring which could aid readability, wait until tests are green before politely suggesting it.

### The Ensemble Gives you Superpowers

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

### Coaching behaviours in an ensemble

- Split into the following behaviours:
	- Teach
	- Mentor
	- Facilitate
	- Coach
	- Observe
	- Take short breaks
	- Retrospect
	- Breathing space between and during sessions
- The first four of those are outlined in the [Coaching Competency Framework](http://www.agilecoachinginstitute.com/wp-content/uploads/2011/08/Agile-Coaching-Competencies-whitepaper-part-one.pdf)
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

### Kindness, consideration and respect

- Honour the legacy coder:
	- Woody Zuill: Treat everyone with kindness, consideration and respect
	- Assume previous coders did their best. Resist the temptation to judge. Even if they're not present, others will worry that the same might happen to them one day.
	- Woody again: "Honor the coder and their code. The constraints they endured are not mine to know."
- Yes, and:	
	- In the ensemble:
		- Refactor but do not rewrite. 
		- Don't delete or undo. Say "yes, and".
- Take time out
	- When things get heated and poeple can't uphold the working agreement
	- Break up for 15 minutes. Walk round the block.
	- Ask people to return when they feel calm.
	- Some may take longer to return than others
	- Arrange 121s or bring in scrum master (or equiv) if necessary
- Typists: Listen, don't think
	- Design needs to be spoken by navigator before implemented by typist
		- => primary mechanism for spreading knowledge & enabling collective ownership
	- If typist disagrees with navigator suggestion they should still implement it, so the idea is visible and can be debated. Also the typist's criticisms shgould be saved until they are out of that role
- Be an ally for the quieter peops
	- "I think X has a good idea we should listen to"
- Help people to pay attention
	- Peopel will get distracted by phones and laptops
	- It's hard to draw attention to without making them feel unsafe or reprimanded like a child
	- Instead you can speed up the rotation or ask them to look something up - "since you have your laptop out" - to gently recapture their attention
- Call out bad behaviour that can't wait for a retro
	- Nip it in the bud. "We don't do that here" is a good phrase. Even if they claim it's a joke: "That may be so, but we don't do that here."

### Stories Illustrating Coaching Situations

- When people are stuck, keep asking questions until they get unstuck
- When a navigator is stuck, encourage other ensemble members to provide suggestions, rather than providing them yourself
- Sometimes you might want to suggest someone who is clear on direction take over from a navigator who is stuck
	- and then swap the original navigator back in again afterwards
	- Watch out for the impact this has on the original navigator
- Encourage experiments
	- To settle an argument, try out different options and compare their impacts
	- This shows them their ideas matter
	- This is better than just telling them which is the best option
	- Be pre-disposed to action
- Help the ensemble to discover scenarios when considering test cases
	- Ask pointed questions such as "How will we know when..."
	- Make sure scenarios are recorded (nominate a scribe / archivist)
- Navigator expresses instructions in increasing amounts of detail
	- Intention => Location => Details
	- Start by describing intention
	- If typist struggles to understand what needs to be done, give them a location (eg line number or which tab)
	- If they need more, give even more details (eg what to type)
- Reminders for intentions and tests
	- Navigator says "write an if statement"
		- Coach says "What are we trying to achieve?"
	- Navigator says "Let's handle this case"
		- Coach says "Do we have a failing test for that?"
- Reminders for shortcuts
	- Typist is typing laboriously
	- Coach: "Is there a shortcut for that?"
	- Typist doesn't know
	- Coach: "How do we search for appropriate shortcuts?"
	- You can ask them to undo their typing and do it again with the shortcut, to help the learning stick
	- Quickly other ensemble members will learn them and start prompting each other
- WIKI Consume-First Design
	- Encourage ensemble members to use the Consume First design method. This is where you start writing new code in the place where it will be consumed, rather than with the declaration
		- so a new method starts in the calling method (`if newMethod(arg) == true`).
		- That way, if a timer goes off before a new navigator takes over, they are more likely to be able to follow the thread of what's happening
		- The caller method will often be a test case.
- Check for regular feedback
	- Feedback as in test failures or build errors.
	- It's easy to find yourself writing code, for instance while setting up a test, that has a lot of potential compilation errors. 
		- Then a lot of work will be needed to get it compiling, and all that time you won't know how much progress you've made.
	- Instead, encourage each new line of code to get to a point of successful compilation before moving onto the next thing
	- (see example in book)
- Encourage regular commits
	- Remind them if they haven't committed since the last small step was completed
	- Use the to-do list which is being maintained by the archivist - each commit message can describe the last small to-do item which was completed.
		- Some ensemble timers have a feature where you can keep a list of goals
- The expert is not the typist
	- If only one team member knows how to acocmplish a particular task, they should not be the typist
	- You can switch typists if you find yourself in this situation
	- They need to be the navigator, so that they can clearly describe how the task is accomplished.
- The expert is not in the room
	- Sometimes nobody in the team klnows how to do something, and they need to call in outside expertise
	- They may be worried that the person in question is busy, but the quicker you ask them to temporarily join the mob and help, the quicker you'll get moving
		- Also they're more likely to oblige if they know a whole team is waiting
	- If it happens a lot, speak to a manager about getting the person in question to join more permanently

### Retrospectives

- Basics:
	- Each ensemble session lasts two hours, culminating in a retro approx 15 mins long
		- Reflect on it
		- Process it
		- Learn from it
	- Don't just plunge into more work without reflecting on how to improve
	- Short frequent retros = small outcomes and learnings
		- Act promptly
		- Many small learnings = a lot
		- Longer less frequent retros = bigger problems, not acted upon
	- Mix it up and keep it fresh
- Tips (WIKI)
	- Count to 20 in your head after last person stops writing, before calling a halt
	- When physical, don't get participants to stick stickies on wall. Instead:
		- Collect them as a pile
		- Read each one out before sticking up
		- Do grouping as you go
		- Ask for clarification if needed
		- You can get participants to do their own, one at a time, rather than the facilitator doing it
			- If anyone doesn't have any notes, they can go last and see if they're inspired to think of anything while the others are going
		- Put larger discussions to one side
		- Don't disagree
		- Acknowledge / compliment good contributions
	- You can use a separate learning hour to practice the skills required for a successful retro (see later section)
		- it takes time for a team to build the skills required for good retros
	- Liked / learned / lacked is a good format
	- Dial up the good
		- You ideally want each ensemble session to be better than the last
		- everybody share something that was good and htink about how you can do more of that
		- this can be a separate exercise
- Do your own private retro 
	- make notes on what went well and what could be improved
	- also note what happened
		- so you can pick up where you left off
		- so you can report back to the people who hired you
		- so you can record progress over longer period of time
		- so you can keep track of areas of the code that need further work
- Keep going
	- even if things are going well, keep having retros
	- you want the team to maintain the skill of observing what's going on

### Remote ensembles

- General tips:
	- Arrange things so everyone can see faces as well as code
		- You can use a separate device (eg a tablet) for faces and for code
	- Avoid lag from key presses and mouse movements
		- It's best if typist is typing on their own local machine
	- Be more strict about only the navigator talking, so people don't talk over one another because lag
		- Use "raise hand" functionality 
	- Have more / longer breaks
	- Use an ensemble branch
		- just for small WIP commits, so you can easily swap typist
		- but this can be avoided if you're using liveshare
	- Make sure you still have design discussions
		- You can use a simple drawing tool like Paint, where the typist follows instructions
		- Or something like Miro (higher bandwidth / more lag?)
		- Or a simple shared doc

## Part 2: Learning Hours

[Learning hours](https://www.sammancoaching.org/learning_hours/)

****** THIS IS WHERE I'M UP TO ******

## Part 3: Samman Coaching Engagements

### A Samman Career

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