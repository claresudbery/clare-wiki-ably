- These are my detailed notes from Barry O'Reilly's talk at Software Architecture Gathering Berlin, 2025
- (See also my phone notes from Chris Simon's talk at NewCrafts '25)
- (See also [this blog post](https://www.architecture-weekly.com/p/residuality-theory-a-rebellious-take))
- See also [the below, in 3 parts, on linkedin](https://www.linkedin.com/posts/clare-sudbery-she-her-35939540_time-uncertainty-and-change-in-software-activity-7399403143282708480-Bov1) 
	- ...and here is [the reposted version with images](https://www.linkedin.com/posts/clare-sudbery-she-her-35939540_what-on-earth-is-residuality-theory-time-activity-7401721070275424256-Z4ob)

# Summary

- Consider as many stressors as you can think of - could be 200 (not 3 like in the example in Chris's talk)
	- Don't spend a lot of time on each one 
	- By having a lot of stressors we don't have to get them all right 
	- Over time you'll find the same architecture keeps emerging as handling multiple different stressors
	- 
- **Stressors** - Unexpected events that challenge your system (technical failures, market changes, regulatory shifts),    
- **Residues:** The elements of your design that survive after stressors hit,    
- **Attractors**: States that systems naturally tend toward when under stress,    
- **Incidence Matrix**: A tool to visualise relationships between stressors and components
# Detailed SAG Notes

**Barry O'Reilly - Time, uncertainty and change in software architecture** 

These are my notes from this excellent session from Barry, which I just attended at SAG.

  

Because they were written on the fly and I didn't capture any of the diagrams, I don't expect all of it to immediately make sense, especially to anybody who's new to residuality theory. But hopefully they give you a bit of an idea.

  

- Randomly stressing architectures produces better architectures that are more likely to survive change 

- Better than other techniques like requirements engineering etc 

- Barry has been working on a theoretical explanation for this, and an experimental design to try and falsify the theory 

- For the last ten years he has been working on empirical validation 

- Complexity science 

- A whole scientific domain of its own 
- How we choose to think about complexity changes our tools and methods 

- The history of software architecture thus far:
- Logical phase 

- 1936
- Turing, Russell et al tried to boil the complexity of the real world down to mathematical logic 
- They failed - held a conference approx 1968 to ask, why do we suck so bad at designing and building software?

- Structural phase 

- 1968
- Then Dijkstra et al decided it was all about structure, not logic 
- Reduce systems down to structures and models 
- Eventually leads to enterprise architecture 

- Adaptive phase

- 1979
- Everything is always warping and moving and changing 
- Engineers become the translators of flux, between two moving environments 
- ...Where software and the world are both continually changing 
- Leads to agile 

- Residual phase 

- 2015
- The business context is constantly moving and changing 
- But the software is rigid, structured, doesn't do anything we don't tell it to. Doesn't and cannot evolve 
- The job of the architect is to make sure this rigid thing survives, in this environment we don't properly understand 

- Stressors 

- The actual problem a software architect has to solve is the unpredictable stressors 
- They are unexpected 
- When they appear, they destroy the poor innocent architecture 
- People come along after the fact and say "well why did you do it like that? You should have built it to survive this stuff."
- We talk about scope - we say we will only deal with the problems you tell us about. Anything else is your business.
- Anything else is your fault, and you'll have to pay us all over again when new problems occur that you didn't warn us about 
- One solution to that is agile methodologies. We'll just keep reacting to change and patching our systems to cope 

- Order and disorder 

- Software systems are ordered 
- Human and business systems are disordered 
- Even when you spot patterns, they can disappear 
- The complexity sciences can give us inspiration for coping with both ordered and disordered systems simultaneously 
- This is an unusual challenge that software architects have to solve 
- xxxxxxxxxxxxx
- xxxxxxxxxxxxx

- Random simulation 

- Try to calculate the Aaea of a badly drawn circle, or squiggly shape, inside a square 
- Forget pi r squared, instead throw darts randomly. Measure how many land inside the squiggly shape, and how many outside (but inside the square). The proportions between the two sets of darts will allow you to estimate the size of the squiggly shape 
- ...and is actually very accurate 

- Kauffman networks 

- Random boolean networks 

- (RBN)

- A bunch of light bulbs either on or off 
- Each light blub has a unique function that randomly decides whether it's on or off 
- Number of possible states is 2 to the power of N, where N is the number of nodes in the network 
- If N is big, the number of possible states is impossibly large 
- But if you add connections between the nodes so that they can influence each other's states, you get a subset of states that keep repeating
- These subsets of states are called "attractors"
- They appear in all random complex systems 
- One example is flight: bats, birds, bees all evolved flight independently 
- Flight is an attractor that appears repeatedly when you put biological systems on a planet with gravity 
- Disordered complex systems: throw constraints at them and see what patterns emerge 
- There are levers to increase the number of attractors

- NKP analysis 
- N: The number of nodes in the system 
- K: The number of connections between nodes 
- P: Bias - the number of biased nodes that are more likely to reach a particular state 

- This reduces the number of attractors

- A two step algorithm 

- Residuality theory 
- Make the simulation genuinely random 
- Make the NKP analysis more explicit 
- We only need access to the attractors, not to all the nodes and all their connections 
- But how do we find the attractors? We don't know what they are!
- So we throw darts at the system 
- Invent random stressors 
- What if the competitor changes their price?
- In this new attractor, does our architecture survive?
- No, something breaks 
- But what's left over after we get hit by the dart? Is it good enough?
- If not, make it good enough to survive. This is the residue.
- Take all the residues and use them to build a resilient system 
- It turns out the new system will survive all the things you didn't predict as well as the ones you did 
- xxxxxxxxxxxxx
- xxxxxxxxxxxxx

- But why?

- It's a simple mathematical leverage 
- The structural models of architecture actually prevent us from doing that 
- We want to be correct 
- We try to predict what we think is likely 
- This is the curse of dimensionality (? Not sure I got the right word?)
- Instead of randomly throwing darts, what architects do is deliberately try to aim their darts to land in the same place as their friends' darts 
- You need to be more random in your predictions 
- One way to encourage yourself to think in this counter intuitive way is to have fun 
- What would happen if your city was attacked by a giant fire breathing lizard?
- It's the attractor that's important, not the stressor 
- Reminder: attractors are repeated patterns of node states that emerge when the system is under random stress 
- The stress is random, but the resulting composite states ("attractors") are consistent and repeatable 

- Example: 

- system of electric car charging designed to handle various edge cases to do with EV charging 
- Designed via residuality theory 
- Considered multiple stressors, and the resulting attractors included various capabilities...
- ...for instance, number plate recognition, security cameras, and charging by the minute that increases exponentially the more minutes you stay 
- That combination of architecture decisions creates an attractor
- Then a viral tiktok craze starts where US republicans start parking their trucks in charging slots, waiting for angry EV owners (who they assume are snowflake Democrats) to appear and then filming tiktok videos of themselves dancing in front of enraged EV owners 
- This was an unpredictable stressor, but it turns out the 3 features mentioned above (NPR, cameras, charging strategy) mean that culprits can be identified, caught and charged a huge amount of money... So the company actually benefits from this unusual stressor!
- Douglas Adams: "you can make any story believable by adding "in America" to the end 

- How do we prove that residuality works 

- Criticality
- The programmer has to be correct 
- The architect's goal is Criticality - delivering the correct solution to the customers 
- Apply black stressors and red stressors 
- How many of the red stressors does the naive system survive 
- How many does the residual system survive
- It's like machine learning 
- This is like a training set and a testing set 
- Instead of designing architecture, we're training it 

- Barry's workshop is itself a scientific experiment, with proof at the end!

- The first time we've ever had genuine validatable scientific proof of a software method!

• ⁃ Claim: That residuality is as big as object orientation in terms of a new theory / approach to software development