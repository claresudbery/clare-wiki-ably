---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/IntelliJ-IDEA
---
## General

  - See also [debugging a java app using intellij idea and
    gradle](/pages/coding/tools/Gradle#debugging-a-java-app-using-intellij-idea-and-gradle)
  - To have a repl available:
      - Top right, click the down arrow | Edit configuration
      - Click the + button, top left
      - Select Clojure REPL -\> Local from the list
      - Give it a name
      - Click OK
      - From this point on, it will be available top right, and you can
        just click the green Play button.
  - To run code in the repl: While in file:
      - (Splat-shift-S) Right click – REPL – “switch repl ns to current
        file”: Load namespace in REPL
          - Doesn’t have obvious effect if you only have one namespace
            in your project
          - The convention is that each file contains only one
            namespace, and the name of the file is the name of the
            namespace (but using underscores instead of hyphens)
          - If you don’t follow this convention, it will make requires
            stop working
          - The effect of switching the namespace means that you won’t
            have to qualify your function names and definitions with the
            name of the namespace
      - (Splat-shift-L) Right-click – REPL – load file: do this after
        you edit a file
          - Loading the file means that every line of code in the file
            is run in the repl
          - This means that all your definitions are defined
          - It means you can access the code in the file
          - You can have a file loaded but still not be in the same
            namespace – means you will have to qualify references to
            code in that file
          - You can have several files loaded in the repl at once
          - If it’s not loaded, you can’t access or execute the code in
            that file in the repl – even if the line of code is
            stand-alone.
  - Paredit – bottom right – turned off – gives you automatic bracket
    completion, but can cause more problems than it solves if youre not
    used to it cos you will type your own brackets and muck everything
    up?

## IntelliJ shortcuts

  - Splat-B – go to definition (equivalent of Ctrl+B in Resharper)
  - Splat-alt-left (and right) – move back and forwards in history
  - Splat-shift-A – Action (v useful)
  - Splat-shift-N – search for files
  - Splat-N – search for classes
  - Splat-alt-shift-N – search for symbols
  - Splat-shift-L - Load file in Repl (if you’ve set the shortcut up)
  - Splat-shift-S - switch repl ns to current file (if you’ve set the
    shortcut up)
      - Doesn’t have obvious effect if you only have one namespace in
        your project
  - Splat-shift-F – execute current line in repl (“Send form before
    caret to REPL”) (if you’ve set the shortcut up) (cursor has to be at
    end of line)
      - \!\! This will only work if you have first loaded the file\!
        Even if the line of code is stand-slone\!
  - Ctrl-J – See documentation on the symbol where the cursor is
  - Splat-F8: toggle breakpoint
  - F8: Step over
  - F7: Step into
  - Splat + , shows you Preferences
  - Splat + Alt + Z: revert changes
  - Shift + Splat + up/down arrows: Move a line of code up or down.
  - Cmd + D: Duplicate a line of code.
  - Alt + Splat + L: Pretty print: Xml formatting – and other formatting
      - From menu, this is is Cocde | Reformat code

## Getting started with a new project

  - Import project: find project.clj
  - JDK: Select “JDK” (first option) – this will take you to a Finder
    window – search for Library folder, then drill down into Java folder
    (so, it’s in /Library/Java) and find folder named
    jdk-somethingorother
      - This is because you need an SDK installed
      - JDK is the Java SDK
      - You only need one per machine

## Change / add keyboard shortcuts

  - Splat-shift-A
  - Keyboard | keymap
  - Make sure you have the correct keymap – will prob have an arrow next
    to it – currently seem to be using “copy”
  - Clojure keybindings | Search for “repl”
  - Right-click – keyboard shortcut

## Troubleshooting

  - If you get surprising errors in the repl: Try restarting the repl (I
    think I wrote this in reference to ClojureScript)
