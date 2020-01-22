---
layout: page
folderlist: false
categories: organising 
location: "pages/organising/tips/tech/leaf"
permalink: /pages/organising/tips/tech/Apples-Macs-and-iOS
---

# iOS

## Misc

- [Text manipulation in iOS 13](https://ios.gadgethacks.com/how-to/ios-13-changes-way-you-navigate-edit-text-heres-place-cursor-make-selections-perform-edits-more-0203292/) (moving cursor around, selecting and highlighting text etc)

# Macs

## Mission Control

For some reason my brain confuses this with Activity Monitor (the equivalent of Windows Task Manager).

Mission Control is what you get when you do `Ctrl | Up-arrow` - shows you all running apps and spaces.

## Finding / quitting running apps 

- [Detailed stuff here](http://osxdaily.com/2013/05/17/see-all-running-apps-mac-os-x/)
- Options:
    - Activity Monitor (the equivalent of Windows Task Manager)
    - the `top` command in Terminal
        - is updated live
        - more useful with flags:
            - sort by cpu: `top -o cpu`
            - sort by memory usage: `top -o rsize`
    - the `ps` command in Terminal
        - not updated live
        - defaults to only displaying terminal processes active under the current user
        - but `ps aux` gives you more and therefore more useful
        - pipe to `more` to see pages of output one at a time: `ps aux | more`

## Useful Keyboard Shortcuts

- Log out: Cmd + Ctrl + Q
- Sleep / wake:
    - Short-press power button
- Shutdown: 
    - hold power button for 5 secs
    - for quick shutdown: `Cmd (splat) + Alt + Ctrl + Power` Button
- Restart:
    - hold power button for 1.5 secs
    - force restart: `Cmd (splat) + Ctrl + Power` button