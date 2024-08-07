---
layout: page
location: pages/coding/lang/oo/leaf
permalink: /pages/coding/lang/oo/Java
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [2Wheeler-Ingester-London-Summer-2018 (PRIVATE)](https://github.com/claresudbery/2Wheeler-Ingester-London-Summer-2018)
- [cadogan/backend (PRIVATE)](https://github.com/claresudbery/cadogan)
    - See sub-folder containing backend code
- [interview-codebase-java (PRIVATE)](https://github.com/claresudbery/interview-codebase-java)

## How to

- (Clare only) I have a comprehensive section on Java in my Useful Notes doc (OneDrive/TW-Stuff/Organising/Notes)
- There's also some useful stuff on [the IDEA page](/pages/coding/tools/IntelliJ-IDEA)

## Language features

- `final` - write once: gets defined in constructor and after that you can't change it

## String interpolation

- If it's at the end of the string, you can concatenate it:

```java
private String generateContent(int quantity) {
        return "Ticket\n content\n x " + quantity;
    }
```

- (No need to use `Integer.toString(quantity)`, Java automatically converts it to a string).
- If it were in the middle and if there were multiple variables, you could use `formatted` (a method on all `String`s):

```java
private String generateContent(int quantity) {
        return "Ticket\n content\n x %d".formatted(quantity);
    }
```


