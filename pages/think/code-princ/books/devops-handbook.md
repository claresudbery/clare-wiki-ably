---
layout: page
location: pages/think/code-princ/books/leaf
permalink: /pages/think/code-princ/books/DevOps-Handbook
---

## Overview

- pub 2016
- 2nd edition 2021
- by 
  - GENE KIM, 
  - JEZ HUMBLE, 
  - PATRICK DEBOIS, 
  - JOHN WILLIS, 
  - NICOLE FORSGREN

## Three Ways of DevOps

- The core of the book outlines these three ways - summarised below
  - The First Way: The principles and technical practices of Flow
  - The Second Way: The principles and technical practices of Feedback
  - The Third Way: The principles and technical practices of Continuous Learning and experimentation
- Originally came from The Phoenix Project! 
  - "The Phoenix Project presents the Three Ways as the set of underpinning principles from which all the observed DevOps behaviors and patterns are derived"

### First Way: Flow

- These principles "accelerate the delivery of work from Development to Operations to our customers"
- "The First Way enables fast left-to-right flow of work from Development to Operations to the customer. In order to maximize flow, we need to make work visible, reduce our batch sizes and intervals of work, build in quality by preventing defects from being passed to downstream work centers, and constantly optimize for the global goals."
- "By speeding up flow through the technology value stream, we reduce the lead time required to fulfill internal or customer requests, especially the time required to deploy code into the production environment. By doing this, we increase the quality of work as well as our throughput, and boost our ability to out-experiment the competition."
- "The resulting practices include continuous build, integration, test, and deployment processes; creating environments on demand; limiting work in process (WIP); and building systems and organizations that are safe to change."
- Do this by:
  - Creating the foundation of our deployment pipeline
  - Enabling fast and reliable automated testing
  - Enabling and practicing continuous integration and testing
  - Automating, enabling, and architecting for low-risk releases

### Second Way: Feedback

- These principles "enable us to create ever safer systems of work"
- "The Second Way enables the fast and constant flow of feedback from right to left at all stages of our value stream. It requires that we amplify feedback to prevent problems from happening again, or enable faster detection and recovery. By doing this, we create quality at the source and generate or embed knowledge where it is needed—this allows us to create ever-safer systems of work where problems are found and fixed long before a catastrophic failure occurs."
- "By seeing problems as they occur and swarming them until effective countermeasures are in place, we continually shorten and amplify our feedback loops, a core tenet of virtually all modern process improvement methodologies. This maximizes the opportunities for our organization to learn and improve."
- Do this by:
  - Creating telemetry to enable seeing and solving problems
  - Using our telemetry to better anticipate problems and achieve goals
  - Integrating user research and feedback into the work of product teams
  - Enabling feedback so Dev and Ops can safely perform deployments
  - Enabling feedback to increase the quality of our work through peer reviews and pair programming

### Third Way: Continuous Learning and experimentation

- These principles "foster a high-trust culture and a scientific approach to organizational improvement risk-taking as part of our daily work"
- "The Third Way enables the creation of a generative, high-trust culture that supports a dynamic, disciplined, and scientific approach to experimentation and risk-taking, facilitating the creation of organizational learning, both from our successes and failures. Furthermore, by continually shortening and amplifying our feedback loops, we create ever-safer systems of work and are better able to take risks and perform experiments that help us learn faster than our competition and win in the marketplace."
- "As part of the Third Way, we also design our system of work so that we can multiply the effects of new knowledge, transforming local discoveries into global improvements. Regardless of where someone performs work, they do so with the cumulative and collective experience of everyone in the organization."
- Do this by:
  - Establishing a just culture to make safety possible
  - Injecting production failures to create resilience
    - Enable and Inject Learning into Daily Work
    - Become ever better at self-diagnostics and self-improvement and must be skilled at detecting problems, solving them, and multiplying the effects by making the solutions available throughout the organization
  - Converting local discoveries into global improvements
  - Reserving time to create organizational improvements and learning

## Chapter 11: Enable and Practice Continuous Integration

- Follows on from an automated testing chapter - assumes you've sorted out your testing
- “continuous integration is one of the most critical practices that enable the fast flow of work in our value stream”
- “continuous integration remains a controversial practice”
- "the longer developers are allowed to work in their branches in isolation, the more difficult it becomes to integrate and merge everyone’s changes back into trunk."
- "Integration problems result in a significant amount of rework to get back into a deployable state"
- "when merging code is painful, we tend to do it less often, making future merges even worse."
- "Continuous integration was designed to solve this problem by making merging into trunk a part of everyone’s daily work."
- "The surprising breadth of problems that continuous integration solves"
- Contains great practical example - Gary Gruver, HP’s LaserJet Firmware division
  - Note for Clare: I made detailed notes on this for the TBD O'Reilly piece - see "unshared notes" doc
- Trunk-based development is crucial
  - Note for Clare: I made detailed notes on this for the TBD O'Reilly piece - see "unshared notes" doc