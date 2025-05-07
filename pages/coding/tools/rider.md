---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Rider
---

## Overview

Rider is an IntelliJ tool very much like Visual Studio

## Troubleshooting    

- In Rider when I accidentally click in gutter and open horrid window on left
  - right click in horrid area => close annotations
- Deleting files on left in file explorer:
	- It's not obvious - choose Edit from the context menu and there is a whole sub-menu including a Delete option

## Useful shortcuts

- Shift + Shift to search everywhere
- When working on remote machines, might need to change keymap:
  - Shift + Shift then type `keymap`
- Cmd + Shift + R brings up refactoring menu
- Option/Alt + Enter to bring up lightbulb menu ("intention actions")
- F12 - Go to declaration (which in many cases is also definition)
- Cmd + F12 - Go to implementation
- Shift + F12 - Find usages
- Cmd + "-" - Go back to where you were
- Right click => Go to for all optiosn like find usages etc
- Step into - Cmd + F11
- Step over - F10
- Comment out a block of code - Alt + Cmd + /

## Convert between snake case, camel case, etc

- Install [this plugin](https://plugins.jetbrains.com/plugin/10985-case-conversion)
- Works in Rider, Pycharm, IDEA etc (all JetBrains tools)
- Download
- Open your IDE and press ⌘ , to open the IDE settings.
- Select Plugins, click the cog and then click Install Plugin from Disk.
- Select the plugin archive file and click OK.
- Once installed:
    - Select text
    - Edit => Convert case
    - Select Plugin in plugin manager for more help