---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Recursion
---

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [TrainRoutes (PRIVATE)](https://github.com/claresudbery/TrainRoutes)	
- [onetruepath](https://github.com/claresudbery/onetruepath)
    - From the Hack Manchester in 2015 where I competed with Laurent from LateRooms. We made a sort of decision tree thing and I _think_ it used recursion?
- [ScreeningMathParser (PRIVATE)](https://github.com/claresudbery/ScreeningMathParser)
    - I think this was the recruitment test when I joined NICE as a contractor.
- The repo for this website wot you are looking at right now: [clare-wiki-ably](https://github.com/claresudbery/clare-wiki-ably)
    - Originally I wrote a sitemap component that used recursion. I was planning to replace it, but it's definitely [here in this commit](https://github.com/claresudbery/clare-wiki-ably/blob/357e2c0a95ffa00712e6c22760bef324c40776c1/_includes/recursive-subfolders.html).
- I'm planning to refactor it because it's pretty nasty and doesn't scale well at all, but in this version of my Reconciliate code base you'll see [where I used recursion to solve](https://github.com/claresudbery/Reconciliate/blob/5f778e5631b64afd7f6154edd0db3f296421777d/Console/Reconciliation/Matchers/MultipleAmountMatcher.cs#L71) the [Subset Sum problem](https://www.geeksforgeeks.org/subset-sum-problem-dp-25/).

## Other Recursion Examples

- The [Subset Sum problem](https://www.geeksforgeeks.org/subset-sum-problem-dp-25/) is NP-Complete, and there are more scalable solutions available than recursion - but it's interesting (I [used recursion myself initially](https://github.com/claresudbery/Reconciliate/blob/5f778e5631b64afd7f6154edd0db3f296421777d/Console/Reconciliation/Matchers/MultipleAmountMatcher.cs#L71), but it so very did NOT scale)