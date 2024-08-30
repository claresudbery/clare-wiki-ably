---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Misc-Coding-Principles
---


## Misc

- Reading list from LateRooms: Dropbox\IT Training\Current\To Read

## The case against null

Lots of things are better to return than null:
  - An empty string ("")
  - An empty collection
  - An "optional" or "maybe" monad
  - A function that quietly does nothing
  - An object full of methods that quietly do nothingsee Null Object Pattern
  - A meaningful value that rejects the incorrect premise of the question
    - (which is what made you consider null in the first place)
- The trick is realizing when to do this. 
- Null is really good at blowing up in your face but only when you dot off it without checking for it. 
- It's not good at explaining why.
- Exceptions are essentially a way to reject an assumption. If you’d rather stay where you are you can bake the rejection of that assumption into a kind of value that can express either results or rejections. 
  - It’s not that weird. We do it in algebra all the time - see [below](#how-algebra-uses-similar-approaches-to-null-avoidance-techniques)
- More [here](https://softwareengineering.stackexchange.com/questions/373751/if-nulls-are-evil-what-should-be-used-when-a-value-can-be-meaningfully-absent)

### How algebra uses similar approaches to null-avoidance techniques

This rather delightful answer to the question “are complex numbers really numbers?” was linked to in a question about why we should [avoid nulls](#the-case-against-null).

Its basic premise is “Complex numbers are a hack. The same is true for imaginary, transcendental, real, rational, and negative numbers. Zero and infinity as well. They are all additions to the counting / natural numbers. In different ways, they all work by rejecting the premise of a question. That is, rejecting its assumption.”

More here: https://math.stackexchange.com/questions/622729/why-are-complex-numbers-considered-to-be-numbers/1696269#1696269

## Convention over configuration

- "Convention over configuration (also known as coding by convention) is a software design paradigm used by software frameworks that attempts to decrease the number of decisions that a developer using the framework is required to make without necessarily losing flexibility and don't repeat yourself (DRY) principles."
- "The concept was introduced by David Heinemeier Hansson to describe the philosophy of the Ruby on Rails web framework, but is related to earlier ideas like the concept of "sensible defaults" and the principle of least astonishment in user interface design."
- More here: https://en.wikipedia.org/wiki/Convention_over_configuration