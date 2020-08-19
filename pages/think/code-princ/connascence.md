---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Connascence
---

## Headline concepts

- There's a great site [here](https://connascence.io) that describes connascence in more detail than I have here, and with lots of examples.
- Good blog post here.
- Connascence is a way of measuring / describing the way in which software elements are coupled.
- There are three connascence metrics: locality, degree and strength ([see below](#connascence-metrics)). 
- Connascence can be either dynamic or static (see [below](#dynamic-vs-static))
- There are several [types of connascence](#types-of-connascence).
- @KevinRutherford and @JJeffries1 have a [good refactoring video](https://www.youtube.com/watch?v=fSr8LDcb0Y0) from XP Manchester which goes over the usage of connascence. 

## Connascence metrics

There are three connascence metrics: locality, degree, strength. They are listed below. By considering these, you can make decisions about whether you are happy with your level of connascence or not. For instance, if the degree is low, you will probably be happier than if multiple entities are affected. If connascence is strong but local, this is more acceptable than strong and far apart. 

### Locality

How close two entities are to each other. 

See [below](#locality-and-strength) for an explanation of why locality and strength should be considered in conjunction with one another.

### Degree

The number of entities that are affected.

### Strength

The ease with which the type of coupling can be refactored.

See [below](#locality-and-strength) for an explanation of why locality and strength shlud be considered in conjunction with one another.

This useful diagram (by @KevinRutherford, via [DZone](https://dzone.com/articles/about-connascence)) lists the types of connascence in strength order - where red is strong and green is weak ("convention" equates to "meaning", and see [below](#dynamic-vs-static) for dynamic/static distinction):

![connascence-o-meter.png](/resources/images/connascence-o-meter.png)

### Locality and strength 

Locality and strength are worth considering in conjunction with one another because "many of the stronger forms of connascence that can be devastating to the readability and maintainability of a codebase when they appear far apart are innocuous when close together. ... Stronger connascences are more acceptible within a module. Weaker connascences should be used between entities that are far apart (in separate modules or even codebases)." (from [connascence.io](https://connascence.io/locality.html))

## Dynamic vs Static

"static connascences can be determined simply by examining the source code. Dynamic connascences require knowledge of run-time behavior, and thus are harder to reason about." (from [here](https://connascence.io/strength.html))

## Types of connascence

All the types are listed in more detail, with examples, at [connascence.io](https://connascence.io).

The lists below are lifted from [this DZone blog post](https://dzone.com/articles/about-connascence)).

### Static Connascence

There are several types of static connascence 

- Connascence of **[Name](https://connascence.io/name.html)** (CoN): this is when multiple components must agree on the name of an entity.
- Connascence of **[Type](https://connascence.io/type.html)** (CoT): this is when multiple components must agree on the type of an entity.
- Connascence of **[Meaning](https://connascence.io/meaning.html)** (CoM) or - Connascence of **Convention** (CoC): this is when multiple components must agree on the meaning of specific values.
- Connascence of **[Position](https://connascence.io/position.html)** (CoP): this occurs when multiple components must agree on the order of values.
- Connascence of **[Algorithm](https://connascence.io/algorithm.html)** (CoA): this is when multiple components must agree on a particular algorithm.

### Dynamic Connascence

There are also several types of dynamic connascence:

- Connascence of **[Execution](https://connascence.io/execution.html)** (order) (CoE): this is when the order of execution of multiple components is important.
- Connascence of **[Timing](https://connascence.io/timing.html)** (CoTm): this occurs when the timing of the execution of multiple components is important.
- Connascence of **[Value](https://connascence.io/value.html)** (CoV): this occurs when there are constraints on the possible values some shared elements can take. It's usually related to invariants.
- Connascence of **[Identity](https://connascence.io/identity.html)** (CoI): this happens when multiple components must reference the entity.