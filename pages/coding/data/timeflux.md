---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Timeflux
---

## DevBreak '21, Timeflux workshop

Building Brain-Computer Interfaces 

### Preparation before workshop

- [Installation (had to install miniconda first)](https://doc.timeflux.io/en/stable/usage/getting_started.html)
- What I did:
    - Installed Miniconda on MacBook using pkg 8fa371ae97218c3c005cd5f04b1f40156d1506a9bd1d5c078f89d563fd416816, which was the latest on 8 Sept 2021. [Here is the link for the latest one](https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.pkg).
    - Installed Timeflux using these commands:  

```bash
conda create --name timeflux python=3.9 pytables bottleneck
conda activate timeflux
pip install timeflux
pip install timeflux_example
```

    - Downloaded and ran a sample simple app:

```bash
curl -O https://raw.githubusercontent.com/timeflux/timeflux/master/examples/test.yaml
conda activate timeflux
timeflux -d test.yaml
```

### What timeflux is

- 

### Other workshop notes

- download timeflux : https://doc.timeflux.io/en/stable/usage/getting_started.html
- DAG - DIRECTED ACYCLIC GRAPH - data flows in one direction only, with no loops
- Pub/sub allows async loops using DAGs without breaking anything - because one DAG can subscribe to its own publication 
- You can use a broker graph to capture data published by many graphs and then publish to other graphs 
    - Removes dependencies between graphs 
    - All graphs might run at different rates (=how often the graphs are run), so the broker can gather data happening at different frequencies and pub to all, regardless of their frequency 
- This allows a closed loop to be implemented 
- The hello world app adds characters and displays output both before and after: `timeflux -d hello world.yaml`
- To customise a node: use `__init__()` to define initial params and initialize the node 
- Then define `update()`, 
- Define attributes `i` and `o` for input and output 
- Plugging are defined in python. There is an example you can use as a starting point.
- Interfaces can be built in javascript - timeflux.js is a javascript API
- Perfect timing in a browser is hard, but timeflux makes it easy 
- Apple watch = bio feedback - You can see 
- Neuro feedback = same but with neurons firing - eg for relaxation - can be alternative for drugs for TDHD (French for ADHD)
- Interoception = conscious perception of internal body signals, without any external intervention - eg counting your heartbeat without feeling your pulse - also eg using meditation for body awareness 
- Invasive brain wave reading device = ECOG (implants that record neural activity internally)
- EEG is like recording all the voices in a stadium with one microphone above the stadium, so you can't home in on individual voices (neurons)
- But if you get all the people to say the same thing at the same time, you can hear them - eg when they all shout "GOAL" at same time 
- If you close your eyes, your brainwaves will synchronise into one alpha wave (?)
- Some waves happen in certain circus - eg alpha waves when eyes closed, delta waves when sleepy, etc 
- This is called Evoked Related Potential 
- Spectral Neuro feedback = dealing with brainwaves 
- You can use already-recorded EEG signals as your dataset when playing with timeflux if you don't have an EEG
- For locked in people, is very hard to detect a resting state between binary signals, because they have little control over their ability to concentrate on one thing. So actually the tracking of eye movement is more effective for these individuals than EEG analysis.
    - EEGs are great for temporal resolution but not for spatial resolution 
- Hyper scanning = measuring electrical activity of several people at same time 
    - Chemical messages exist between connected people, eg mother and child 
    - The chemical signals Help to synchronise brains together 
    - When people are physically close, their brainwaves synchronise, and the theory is that this happens via chemical signals 
    - This can be stimulated via taking a particular drug 
    - In one trial in columbia they are doing research where they are getting children to meditate together to see how their brain waves might synchronise 
- Demo:
- Go to github and find the p300 speller demo to find a thing that spells out hello world using an EEG
- If you look at the classification node in the yaml and you know anything about psychic node (?) it will look familiar 
- Alpha / beta / delta / theta - do they all exist simultaneously or are they created by combining one another?

## Questions

- What does `conda activate` do?
