---
layout: page
categories: organising 
location: "pages/organising/tips/tech/leaf"
permalink: /pages/organising/tips/tech/Apple-Macs-and-iOS
---

## iOS

### Text manipulation in iOS 13

- Long explanation of all the things (moving cursor around, selecting and highlighting text etc): [Text manipulation in iOS 13](https://ios.gadgethacks.com/how-to/ios-13-changes-way-you-navigate-edit-text-heres-place-cursor-make-selections-perform-edits-more-0203292/) 

Short summary of what worked best for me:

- Move cursor: Tap, then drag the cursor to where you want it to be
- Select a word: double-tap
- Select all: tap then tap again
- Select a chunk of text: long-press then slide
- cut / copy / paste : Tap with 3 fingers
- Undo : Slide to the left with 3 well-spaced fingers
- Redo: Slide to the right with 3 well spaced fingers

Longer Summary:

- Tap will only take you to start/end of word, not middle
- To move cursor, tap and then drag
    - or another way to get into the middle of a word:
    - tap, then tap again to get Select menu, then long-press in the middle of the word
    - (doesn't work very consistently for me though)
- Selecting / Pasting: 
    - To get Select / Select All / Paste, tap then tap again
    - Or double-tap to select a word
    - Or long-press a word (but not too hard)
    - Long-press and slide to select a chunk of text
    - There's supposed to be stuff about triple-tapping to select a sentence and quadruple-tapping to select a paragraph, but I can't get it to work any more than baout one in ten times.
- Copy / Cut / Paste
    - See above for selecting text - that will bring up the dol cut / copy / paste menu. But also...
    - Tap with three fingers to open a menu with undo, cut, copy, paste and redo options
    - Copy: pinch with three fingers
    - Cut: Pinch with three fingers twice
    - Paste: 3-finger spread
- Undo / Redo
    - Undo : Slide to the left with 3 well-spaced fingers
    - Redo: Slide to the right with 3 well spaced fingers
    - Tap with 3 fingers to bring up a menu with Undo on the far left and Redo on the far right


## Macs

### Mission Control

For some reason my brain confuses this with Activity Monitor (the equivalent of Windows Task Manager).

Mission Control is what you get when you do `Ctrl | Up-arrow` - shows you all running apps and spaces.

### Finding / quitting running apps 

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

### Useful Keyboard Shortcuts

- Log out: Cmd + Ctrl + Q
- Sleep / wake:
    - Short-press power button
- Shutdown: 
    - hold power button for 5 secs
    - for quick shutdown: `Cmd (splat) + Alt + Ctrl + Power` Button
- Restart:
    - hold power button for 1.5 secs
    - force restart: `Cmd (splat) + Ctrl + Power` button