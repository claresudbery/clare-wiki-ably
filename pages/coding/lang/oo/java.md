---
layout: page
location: pages/coding/lang/oo/leaf
permalink: /pages/coding/lang/oo/Java
---
## Useful links
- [JDoodle](https://www.jdoodle.com/online-java-compiler) - write Java in the browser (I have an account with saved code) ^jdoodle
	- NB: When importing libraries, click the "external libraries" icon above the right hand pane - looks like a file icon with a downward-pointing arrow
		- ...Don't use the links they provide to find libraries, they're not terribly useful - just use Google or Gemini
# IntelliJ Keyboard Shortcuts
- See [[intellij-idea#Keyboard shortcuts|intellij-idea - Keyboard shortcuts]]
## GitHub Repos 
Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, you can ask me to share the code, but in some cases it won't be possible.
- [2Wheeler-Ingester-London-Summer-2018 (PRIVATE)](https://github.com/claresudbery/2Wheeler-Ingester-London-Summer-2018)
- [cadogan/backend (PRIVATE)](https://github.com/claresudbery/cadogan)
    - See sub-folder containing backend code
- [interview-codebase-java (PRIVATE)](https://github.com/claresudbery/interview-codebase-java)
## How to
- (Clare only) I have a comprehensive section on Java in my Useful Notes doc (OneDrive/TW-Stuff/Organising/Notes), but I've now pulled a lot of that into clare-wiki, eg [[intellij-idea#Getting started with a new project]]

## Run configurations
- Java projects (and Clojure projects) are typically (always?) associated with run configurations.
- Next to the play button, top right, you'll see three dots. Click this for a dropdown including Configuration => Edit, which will lead you to a dialog for editing the run configuration
- In here you can specify things like JDK, main entry point, working directory.
- When you look at run configurations you'll likely see (on the left) 
	- an Application config (configuring the main entry point), 
		- Even though this isn't (eg) a Gradle config, it might still depend on (eg) Gradle-imported modules, source sets, and dependencies.
		- If that model is stale/missing (for example after moving folders), Application configs can show errors like "module not specified" or "unresolved main class".
		- The solution might then be something like "Sync all Gradle projects" (more on that [[#^sync-gradle|here]])
- See also [[#Module not specified|Troubleshooting - Module not specified]] 
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
			  - This is actually going to look for a method called `main()` inside the file called `Main.java` in the folder `org/example`
			  - You can specify a different class to run instead of `Main`, eg `java -cp out org.example.exercises.Exercise01`
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
### Module not specified
- The last time I opened this repo, I could just open Main.java and click the big green Play button. But this time when I do that, it opens up an "Edit Configuration" dialog, which says "module not specified" and then "uk.co.autotrader.Main" with the "uk" in red.
- This can happen if you move folders around. In this case I'd moved the project into a new sub-folder.
- When a Gradle/IntelliJ project is moved, cached module metadata and run configurations can still reference old absolute paths. That often leads to exactly what I saw: module not specified and unresolved main class (uk in red for uk.co.autotrader.Main).
- The error means IntelliJ has lost the project/module context for that run config, so it no longer knows where uk.co.autotrader.Main lives.
- "module not specified" means run config has no module/classpath selected
- uk in red in uk.co.autotrader.Main means IntelliJ can’t resolve that class from the current module context
- The solution:
	- Re-link/import the Gradle project so IntelliJ recreates modules
	- In IntelliJ, open the Gradle tool window (click the elephant icon over on the right) and click the refresh icon ("Sync all gradle projects") 
		- ...or right-click `build.gradle.kts` and choose Reload build.gradle.kts configuration / Link Gradle Project / Import Gradle Project.
		- (Disclaimer: I tried this and it didn't work)
- What “Sync all Gradle projects” did: ^sync-gradle
	- Re-read build.gradle.kts + settings.gradle.kts.
	- Rebuilt IntelliJ’s internal project model: modules, source roots (src/main/java, src/test/java), dependency classpaths, and available Gradle tasks.
	- Updated linked Gradle project metadata so run configs can again select a valid module/classpath.

