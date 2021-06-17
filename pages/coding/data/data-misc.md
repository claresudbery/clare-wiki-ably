---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Data-Misc
---

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don’t ask me to share the code, because I can’t. They’re listed here purely for my reference.

- [data-engineering (PRIVATE)](https://github.com/claresudbery/data-engineering.git)
    - Stuff learnt / played with during TW data engineering course.

## B-Tree

- [What's a B-Tree]()
- [Cool B-Tree Visualisation Tool](https://www.cs.usfca.edu/~galles/visualization/BTree.html) - enter data and click Insert. Keep entering data (for the simplest demo just enter single letters) and it will build a B-Tree for you.

## Data Lakes

- These are the alternative to data warehouses
- Typically a data warehouse will have a common structured schema (ie every piece of data will have the same format) – will pull data from different sources and convert to that schema
- A data lake contains the original source data in its original formats
- Tools like Spark can then be used to pull in data in a variety of different formats and convert to dataframes and then join into one consistent schema
- James Dixon coined the term: Data lake = large body of water in natural state
- Data marts = akin to small units of bottled water
- Users can dive into the lake and take samples
- But nobody really knew how to design them
- Kickback: People started talking about data lakes => data swamps
    - Here is [Martin Fowler arguing why you might want to avoid data lakes](https://martinfowler.com/articles/data-monolith-to-mesh.html)
- We see a lot of brokenness in the business of both getting data out of operational systems, and acting on the insights from that data
- Watch out for people trying to build data lakes with no particular purpose in mind!
- Data lakes shouldn’t be used as ways for systems to talk to each other
- We want these operational systems to share freely with one another
- One of the reasons data warehouses came about was to take query pressure off basic operational systems – so data was replicated and hived offline
- More info - including [original giant notes doc](https://github.com/claresudbery/data-engineering/blob/master/Data%20Engineering%20Course.docx) - available in my [data engineering repo](https://github.com/claresudbery/data-engineering.git) (accessible to clare only)
- Martin fowler's [definition of data lake](https://martinfowler.com/bliki/DataLake.html)