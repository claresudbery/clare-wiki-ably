---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/IntelliJ-IDEA
---

## General

- Note that it's not obvious from their site, but the Community edition of IDEA is FREE - so you can get IDEA without having to pay.
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

## Configuring your setup

- To make deprecated method calls be shown as strikethrough
    - Settings (Splat + ,) => Inspections => Code maturity => Deprecated API usage 
    - Select "Deprecated symbol" from the "Highlighting in editor" dropdown, bottom right
- Notes from Ted M Young's ensemble (Oct 2023, IDEA v 2023.2.3):
    - Customsie - light theme
        - Font - 14.0 or 16.0
    - All settings (mid screen) (or Splat + ,)
        - Editor => font = 16
    - Projects = > From VS => ssh => Trust project
    - Cmd + ; to see SDKs => click SDKs on left
        - + button at top of screen to get JDK = select num 21 (will prob find automatically)
        - Hit Apply after downloaded
    - Select Project top left
        - Select JDK 21 in SDK drtopdown
        - Clidk OK at bottom
        - Might take a while cos it has to download and index all dependencies
    - Cmd + ; 
        - Sel;ect Modules top left
        - Check name is blackjack and language level is 21
    - IntelliJ cheat sheet for all Ted's classes
        - https://ted.dev/courses/mastering-intellij-idea.html
    - Get old UI
        - Cmd + ,
        - New UI - unchjeck enable new UI
    - Settings (at mid top of IDE) => open files with single click
    - Cmd + , => Editor => General => Code folding => Un check "one line methods"

## Getting started with a new project

- Import project: for clojure, find project.clj
- For plain Java, just open the containing folder
- When you first open a Java project in IDEA, it will ask you to specify the SDK
  - This is because you need an SDK installed
  - JDK is the Java SDK
  - You only need one per machine
  - It will give you a configure button to click
  - Then you select an SDK from dropdown 
    – if JDK’s not already there, click download
      - Nothing actually appears to download straight away though
      - Then, if using Maven, it prompts you to download some stuff (not sure if this is related to the above though!)
      - But anyway, then you’ll see a message at bottom of window saying it’s installing the JDK
  - Once downloaded, Select “JDK” (first option) – this will take you to a Finder window – search for Library folder, then drill down into Java folder
    - (so, it’s in /Library/Java) 
    - and find folder named jdk-somethingorother
  - Note that you'll still see the notification saying SDK is not specified in the notifications window
    - but this seems to just be history of old notifications

## IntelliJ shortcuts

  - See also [keyboard shortcuts](#keyboard-shortcuts) below - which seem slightly different - maybe different keyboard mapping?
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

## Troubleshooting

  - If you get surprising errors in the repl: Try restarting the repl (I think I wrote this in reference to ClojureScript)

## Keyboard shortcuts

### Change / add keyboard shortcuts

  - Splat-shift-A
  - Keyboard | keymap
  - Make sure you have the correct keymap – will prob have an arrow next
    to it – currently seem to be using “copy”
  - Clojure keybindings | Search for “repl”
  - Right-click – keyboard shortcut

### Ted's useful shortcuts cheatsheet

- (pdf version is [here](/resources/images/Ted-IntelliJ-IDEA-Shortcuts-cheat-sheet-v1.1.pdf))

![cheatsheet](/resources/images/Ted-IntelliJ-IDEA-Shortcuts-cheat-sheet-v1.1.png)

### List of shortcuts

- See also [IntelliJ shortcuts](#intellij-shortcuts) above - which seem slightly different - maybe different keyboard mapping?
- [Full list of Mac shortcuts](https://www.jetbrains.com/help/idea/reference-keymap-mac-default.html)
- Find/show usages: Alt + Splat + F7
  - or just Alt + F7
- Go back: Cmd + [
- finding stuff:
  - Search everywhere: Shift + Shift
  - Find in files: Cmd + shift + F
  - Search for objects / classes rather than just "find in files"
    - Cmd + Shift O gives files and classes
    - Cmd + O gives just classes
    - Cmd + Alt + O gives symbols, which is everything but classes
    - Note that IntelliJ does not describe this as "Find" or "Search" but as "Go to"
- Refactoring menu: Ctrl + t
- Cmd + Shift + Enter - finish a line (if no semicolon for instance)
- Alt + Up = select the nearest thing - up again to select wider scope
- In Command + O search menu, instead of typing GameBuilder to search for GameBuilder, you can just type GB