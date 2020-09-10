---
layout: page
location: pages/think/events/workshops/leaf
permalink: /pages/think/events/workshops/Workshop-Types
---

See also [Agile Techniques](/pages/think/agile-princ/Agile-Techniques) and [Consulting Principles](/pages/think/agile-princ/Consulting-Principles).

## Misc

- [workshops tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=7247fd4c-5a5c-4678-a41b-aa72740b1df4&query=tag%1Fworkshops%1FtagGuid%3Af516d459-b182-4e38-85c0-15ad61fe373f%1Eview%3AVIEW%2FALL_NOTES&)
- [Running a remote inception / remote workshops](/pages/think/events/workshops/Remote-Inception)

## All types of workshop

- Five whys
- Futurespective
- [Value Stream Mapping](https://kanbanize.com/lean-management/value-waste/value-stream-mapping/)
- Lean Value Tree
- Empathy mapping
- Stakeholder empathy mapping
- Event storming
- Service mapping
- Wardley mapping:	
	- [Wikipedia](https://en.wikipedia.org/wiki/Wardley_map)
	- [List of Wardley resources](https://wardley-maps-community.github.io/awesome-wardley-maps/)
	- [Summary blog post](https://blog.gardeviance.org/2015/02/an-introduction-to-wardley-value-chain.html)
	- [19 blog posts ("chapters") by Simon Wardley on Medium](https://medium.com/wardleymaps/on-being-lost-2ef5f05eb1ec)
	- [Simon Wardley on Twitter](https://twitter.com/swardley/status/1273932178720796673?s=20)
	- [Wardleypedia](http://wardleypedia.org/mediawiki/index.php/Wardleypedia)
- User journey / story mapping
- [The Cynefin Framework](https://en.wikipedia.org/wiki/Cynefin_framework)
- Elevator pitch
- Trade-off sliders 
- Hypothesis Workshops - see [notes below](#hypothesis-workshops)
- Inverse Conway Manoeuvre - see [notes below](#inverse-conway-manoeuvre)
- CRC cards
	- blank ("naked") CRC cards 
- Value proposition map / value proposition design
	- [Real example here](https://github.com/claresudbery/clare-tech/blob/master/resources/images/value-proposition-map.png) (Clare only) 
	- [Blank example here](value-proposition-map-blank.jpeg)
	- Over on the far right you list the things you want to achieve ("jobs to be done")
	- In the same section, you list gains that users might get
	- Under that list things that are currently painful for users
	- On the far left, list features / services in your solution
	- Also list ways in which gains might be achieved ("gain creators) 
	- Also list ways in which pains might be alleviated ("pain relievers")	
	- Now you want to cross-reference 
		- (? I'm not 100% sure I'#ve got this bit right - need to check)
		- for each job, check that it has an associated service / feature
		- for each gain, check that it has an associated gain creator
		- for each pain, check that it has an associated pain reliever
		- for each feature / service, check that it has an associated gain creator or pain reliever
- Data mapping
	- [Real example here](https://github.com/claresudbery/clare-tech/blob/master/resources/images/data-mapping.png)(clare only)
	- get people to start by adding postits for sources and destinations of data
	- then add lines to indicate how data moves from one place to another
- As-is and to-be user journey mapping
	- Real examples [here](https://github.com/claresudbery/clare-tech/blob/master/resources/images/as-is-user-journey-map.png) and [here](https://github.com/claresudbery/clare-tech/blob/master/resources/images/to-be-user-journey-map.png) (clare only)
	- As-is:
	- put the ultimate goal over on the right
	- add post-its to represent steps along the way
	- have a line underneath that represents whether each step makes happier or sadder
	- Pink post-its underneath document pain points
	- Blue post-its above document possible quick wins that will improve things for the user
	- To-be:
	- Now do the same again but for the suggested improvement journey (or to represent a brand new journey)
- Storyboarding
	- [Real example in this repo](/resources/images/storyboarding.png)
	- Fold paper to create 8 panels, then use them to create a ocmic strip that describes a blue-sky imagined new or improved user journey.

## Specific types of workshop in more detail

### Hypothesis workshops

Notes from [Tito](https://twitter.com/rbs_tito)'s [Made Tech talk](https://www.madetech.com/resources/webinars/avoiding-the-legacy-trap-how-to-ensure-your-legacy-decisions-arent-holding-back-your-modernisation) August 2020 (see also screenshots below):

- in the context of replacing legacy - the point is that you are revisiting the things your system already does, and asking how probable is it that users will even need some of that stuff 
- The whole team should be involved
- What is the point of the thing that you are building
- Put goals on the right - ideally 1 - no more than three - if more split into separate workshops
- put features on the left
- write postits between left and right that will lead from the thing on the left to the thing on the right - see image 
- add numbers saying how likely it is that this will happen - see image
- add colours to show priority - see image. 
- you have to take risks and this enables you to visualise / understand the risk of investment vs return
- in the context of replacing legacy - the point is that you are revisiting the things your system already does, and asking how probable is it that users will even need some of that stuff 
- every event assumes that every event to the left of it is true 
- you can then prioritise what to focus on based on how likely it is that all the events will happen that you need in order to reach your goal
	- for instance, MHCLG energy certificates, finding a certificate provider, it's unlikely people won't find one by just using google, 
	- so there's little point putting tons of effort into improving or reimplementing this legacy product
- then your hypothesis is that nobody will use this product so don't implement it
	- or it's highly likely that you'll reach your goal by improving / reimplementing this thing, therefore go for it	

![hypothesis-workshops.png](/resources/images/hypothesis-workshops.png)
![hypothesis-workshops-2.png](/resources/images/hypothesis-workshops-2.png)
![hypothesis-workshops-3.png](/resources/images/hypothesis-workshops-3.png)

### Inverse Conway Manoeuvre 

Notes from [Tito](https://twitter.com/rbs_tito)'s [Made Tech talk](https://www.madetech.com/resources/webinars/avoiding-the-legacy-trap-how-to-ensure-your-legacy-decisions-arent-holding-back-your-modernisation) August 2020 (see also screenshots below):

- Your software systems / components will likely match your org structure
- Don't fight conway's law - don't reoganise your products in a way that won't match your teans
- the new structure becomes an emergent pattern of your architecture
- but don't expect it to work like magic
- you need strong leaders to manage the fact that there will be a temp velocity slowdown and a bit of chaos

![inverse-conway-manoeuvre.png](/resources/images/inverse-conway-manoeuvre.png)
![inverse-conway-manoeuvre-2.png](/resources/images/inverse-conway-manoeuvre-2.png)

