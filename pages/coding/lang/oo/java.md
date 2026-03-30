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

## Running a java project
- You could just open your code entry point (often `Main.java`) in IntelliJ IDEA, and click the big green Play button
- Or...
- You could run the following from the root:
	- ```bash
		mkdir -p out
		javac -d out $(find src/main/java -name '*.java')
		java -cp out org.example.Main # Change path to match package structure
	```
	  - `javac` compiles source code; `java` runs compiled code.
	  - `javac -d out src/main/java/org/example/Main.java` 
		  - (or `javac -d out $(find src/main/java -name '*.java')` to compile ALL java files)
		  - 1. Takes your `.java` source file(s).
		  - 2. Compiles it into JVM bytecode (`.class` files).
		  - 3. Writes output into the out directory (`-d out`).
	  - `java -cp out org.example.Main`
		  - 1. Starts the JVM.
		  - 2. Uses out as the classpath (`-cp out`) so it can find compiled classes.
		  - 3. Runs the class `org.example.Main` (its main method).
	  - So the flow is:
		  - 1. Compile (`javac`)
		  - 2. Run (`java`)
	  - ...but you only need manual `javac`/`java` commands when you want to run from terminal, CI, or without IDE assistance.
## Compiling java code

- When you compile code (via [[maven]] or [[#Running a java project|the java command]]), class files are created... eg `Main.class`. 
- `Main.class` would be compiled Java bytecode (a binary artifact), produced from `Main.java`.
- Typically it goes in an `out` folder
- Generally you should add `out/` to `.gitignore`: compiled output should generally not be committed in a source repo.
## Folder and package structure 

- See notes in [[maven#Folder structure with Maven]] - they're specific to Maven, but they'll also help you to understand general java folders and packages.
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

## Troubleshooting

### Cannot find symbol

- "src/main/java/manchester/digital/Main.java:8: error: cannot find symbol"
	- Could be you haven't compiled all code - eg if you compiled `Main.java` but didn't compile a file it depended on
	- Try running something like `javac -d out $(find src/main/java -name '*.java')` instead of something like `javac -d out src/main/java/org/example/Main.java`
