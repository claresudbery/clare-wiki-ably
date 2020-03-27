---
layout: page
location: pages/think/agile-princ/leaf
permalink: /pages/think/agile-princ/Agile-Ways-Of-Working
---

## User First Ways of Working (Delivery):

### Principles:
- Kanban board spanning Backlog => Ready => In Progress => Done => Proven (see Cadence / Rhythm below for definitions)
- Use method of sizing to align team around approach
- Three amigos: 
  - **product** (product owner, business analyst, delivery/project manager) 
  - **design** (user researcher, service designer, experience designer, interaction designer, content designer etc) 
  - **tech** (developer, QA, tech lead) 
  - anyone, from any level of seniority, can play these roles, some will be able to sit in more than one camp - depending on team, project, client, context
- Developers should be testing with users daily and sense-checking with design team
- User focussed 
- Deploy to production with feature flags
- Roadmaps are better thought of as direction of travel. Focus on outcomes, not features. Use the principles in the book Sense & Respond.

### Cadence / Rhythm:
- 2 week sprints, always having view 2 sprints ahead
- At least a sprint ahead: BA and other team members (so the BA isn’t a bottleneck) fleshing out user stories 
- At least a sprint ahead: Design people designing, researching and prototyping
- 6 weekly mini-inceptions (2 days) to workshop new user journey maps. A high proportion of the team to be involved, with representatives across design, tech and product.
- Clear definitions of:
  - "**backlog**": workshops and ideas forming high level epics / stories
  - "**ready**": well defined user story, user-researched, written with acceptance criteria defined and hypotheses expressed with KPIs defined (we believe that this will be achieved and these KPIs will prove it”), designed and prototyped, reviewed by three amigos - 80% design, 20% dev
  - "**in progress**": three amigos and whoever will be working on feature get together to discuss story before developing - 80% dev, 20% design
  - "**done**": deployed in prod and *then* three amigos reviewed (check acceptance criteria)
  - "**proven**": tested with users and meeting KPIs

### Ceremonies:
- **Daily**:
  - Standups to walk the board and discuss the previous and upcoming days’ work. Use the board as an anchor, focusing on user stories rather than individuals
- **Fortnightly**: 
  - **Retrospectives**
  - **Planning meetings**: Introduce upcoming work to the team and do some estimation
- **Ad hoc**:
  - **Backlog refinement**: Three amigos get together to agree that user stories (already written) are “Ready” and can go into the Ready column. Prioritisation also happens at this point.
  - **Kick-off**: Three amigos get together to discuss a new piece of work with developer(s), just in time
  - **Desk check** (some people call this sign-off but I don’t like the bureaucratic implications - I feel like there’s another better title than check-in, but my mind has gone blank)

### Extra:
 
I want to update this doc at some point to cover the following things that came up in discussion (if I've missed abything else, let me know):

- Building slack into your weekly cadence, to improve flow - ie don't try to shcedule 100% of everyone's time
- Show & tells: Keep it light touch, have this at the start of each planning meeting - informal demos, no prep needed. Not forced or artificial. Some sprints won't have stuff to demo and that's fine. But external stakeholders welcome in all ceremonies.
- Showcases: Bigger public events, ad hoc.
- Allow space for tech debt to be addressed in every sprint.
- Swarm around blockers
- WIP limits: Don't allow multiple items in progress at any time - instead, swarm around blocked work.
- Come to a shared understanding of which environments have manual testing (staging, UAT, pre-prod etc) and how that fits into your team's rhythm. This will probably form part of your definition of done.