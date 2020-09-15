---
layout: page
location: pages/think/code-princ/leaf
permalink: /pages/think/code-princ/Useful-Terms
---

## Primitive Obsession

"Primitive Obsession is when the code relies too much on primitive data types (like integers and strings). It means that a primitive value controls the logic in a class and this value is not type safe. Therefore, primitive obsession is when you have a bad practice of using primitive types to represent an object in a domain."
(from [here](https://medium.com/the-sixt-india-blog/primitive-obsession-code-smell-that-hurt-people-the-most-5cbdd70496e9#:~:text=Primitive%20Obsession%20is%20when%20the,an%20object%20in%20a%20domain.)).

## Race Condition

"A race condition is an undesirable situation that occurs when a device or system attempts to perform two or more operations at the same time, but because of the nature of the device or system, the operations must be done in the proper sequence to be done correctly." (from [here](https://searchstorage.techtarget.com/definition/race-condition))

Both operations are "racing" to access/change shared resources.

Race conditions can be handled by Mutex or Semaphores. They act as a lock to allow a process to acquire a resource based on certain requirements to prevent the race condition.

### Example 1:

Two or more threads can access shared data and they try to change it at the same time. Because the thread scheduling algorithm can swap between threads at any time, you don't know the order in which the threads will attempt to access the shared data. Therefore, the result of the change in data is dependent on the thread scheduling algorithm, i.e. both threads are "racing" to access/change the data.

Problems often occur when one thread does a "check-then-act" (e.g. "check" if the value is X, then "act" to do something that depends on the value being X) and another thread does something to the value in between the "check" and the "act".

(from [here](https://stackoverflow.com/questions/34510/what-is-a-race-condition))

### Example 2: 

"A light switch. In some homes there are multiple light switches connected to a common ceiling light. When these types of circuits are used, the switch position becomes irrelevant. If the light is on, moving either switch from its current position turns the light off. Similarly, if the light is off, then moving either switch from its current position turns the light on. With that in mind, imagine what might happen if two people tried to turn on the light using two different switches at exactly the same time. One instruction might cancel the other or the two actions might trip the circuit breaker."
(from [here](https://searchstorage.techtarget.com/definition/race-condition))

## State Machine

A state machine (aka Finite State Machine, or FSM) is any object that behaves differently based on its history and current inputs. It can be in exactly one of a finite number of states at any given time. The FSM can change from one state to another in response to some inputs; the change from one state to another is called a transition.

## Command Query Separation (CQS)

Every method should either be a command that performs an action, or a query that returns data to the caller, but not both.

In other words, *asking a question should not change the answer*. More formally, methods should return a value only if they are referentially transparent and hence possess no side effects.

Command–query separation (CQS) is a principle of imperative computer programming. It was devised by Bertrand Meyer as part of his pioneering work on the Eiffel programming language.

## Pure and Impure Functions

An impure function is a function that mutates variables/state/data outside of its lexical scope, thus deeming it “impure”.

Pure functions don’t modify external variables/state/data outside of the scope, and return the same output given the same input. They are deterministic.