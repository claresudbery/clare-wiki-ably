---
layout: page
folderlist: true
categories: organising BigIndex
location: "pages/organising/tips/leaf"
permalink: /pages/organising/tips/Macs
---

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