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

### How do I know whether I have Intel or Silicon, or x64 vs ARM64?

-	Check About this Mac (top left) => Processor
-	An Intel processor is x64
-	An M1 processor = Apple Silicon = ARM64


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
- [See below](#diagnosing-a-constantly-spinning-fan) for what to do if fan keeps going off

### Diagnosing a constantly-spinning fan

- Start with [Activity Monitor](#finding--quitting-running-apps)
- Useful article with more tips [here](https://mackeeper.com/blog/fix-macbook-pro-fan-noise-loud/)
    - When it says hold down D and then select a language, it just means the d key on your keyboard, not specifically upper case D.
    - When it says select a language, after you have done that just wait. No need to click on either of the buttons below ("shut down" and "restart").

### Specify location of screenshots

- This in Terminal (see above for Google Drive path):

```
defaults write com.apple.screencapture location [insert location here]
killall SystemUIServer
```

- Possible locations:
    - A separate Screenshots folder on your desktop
        - Your desktop is in your home folder, so path will be ~/Desktop/Screenshots
        - or if you want full path, open a terminal, and if it's not already at `~` by default, run `cd ~` then `cd Desktop`, then `pwd` 
    - Google drive:
        - To get its path, right-click Google Stream => My Drive in Finder, and choose Services => New iTerm tab here
        - Then type `pwd` and hit Enter
        - (Note it probably contains a space, which will mean you need quotes around it for the Terminal command below)
- See [here](https://plusbryan.com/how-to-automatically-save-screenshots-to-google-drive) for full instructions
    - !NB! Your Google Drive location might be different
    - See above for how to find Google drive location

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
- In Finder:
  - see Home folder: Cmd+Shift+h
  - Go one level up from where you currently are: Cmd+up-arrow
  - Go to a folder you know the path for: Cmd+Shift+G
  - Show hidden files : `Cmd + Shift + Dot`
    - You might also have to run these lines in the terminal (from [here](https://apple.stackexchange.com/questions/280736/folder-displaying-in-terminal-but-not-finder)): `defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder`
- [System preferences](#system-preferences-top-tips)
- [shortcuts tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=ba3426a1-35e2-47d5-888d-445432271c8c&query=tag%1Fshortcuts%1FtagGuid%3A830603fb-b0ba-403f-9177-3e3ae2b8a9a0%1Eview%3AVIEW%2FALL_NOTES&)
 
### Problems with headphones

- Problem: Output goes to headphones in some contexts but built-in speakers in others.
    - Sometimes it's even going to a second screen!
    - Solution: 
        - System Preferences | Sound
        - Check the checkbox 

### System Preferences - Top Tips

- Keyboard shortcuts 
    - Hack: Alt/Option + F2 to open display pane, then Cmd + L to gt back to main preferences
- When you're in a sub-dialog, don't close it to get out of it! Use the back button (top left) instead, then you can get back to other dialogs
- Use the search input (top right)

### Setting up a new Mac Using Brew

- [Brew: Mac Bulk App Installer For a New Mac OS Install using HomeBrew](https://www.switchingtomac.com/tutorials/how-to-make-a-bulk-app-installer-for-a-new-mac-os-install-using-homebrew/)
- I made a brew script
    - Public notes [here](/pages/organising/tips/tech/Installing-A-New-Mac)
    - Clare notes [here](https://github.com/claresudbery/clare-tech/blob/master/organising/private/reinstalling-new-mac.md)

### Customise Finder to have home folder (and other folders) in favourites

* Open Finder
* Use Cmd+Shift+h to see Home folder
* Use Cmd+Up-arrow to go one level up from where you currently are
* Drag Home folder into favourites

### Customise touchbar so it has a sleep key on it (or any other keys)

* System Preferences
* Keyboard
* Customise Control Strip
* Drag what you want into the touchbar

### Show desktop on MacBook

- What I've done is go into system preferences and set up a hot key - if you click the right hand alt / option key, that'll do it. It's a toggle, so you can press again to retore things to how they were.
- System Preferences => Mission Control => Show Desktop - select "Right Option"

### If your browser suddenly goes hyper-zoomed-in on Chrome on a Macbook

- Cmd + 0 will fix that.

## Both iOS and Macs

### Find lost device

- If it's in the house but you don't know where, you can get it to make a sound
    - For some reason this is only available via Find my iPhone on icloud.com - it doesn't work in the Find My app
    - You can also do this for your fanily's devices, but only if they are added to your family via Settings => iCloud account => Family sharing, and they accept the invite
        - Accepting the invite can be awkward - you might have to resend the invite

### Erase device / erase laptop

- Via Find my Iphone (available via icloud in the browser, as well as the app on devices), you can erase any device (including MacBook). It will get erased the next time it connects to the internet, and you'll get a notification. 
- Note for Clare: 
    - I erased a faulty work laptop on 13/11/21 (after it had been replaced with a new one). 
    - In the process, I found another two laptops listed (old work laptops?) (annoyingly I couldn't tell the difference between them), so I erased them too.
        - I guess this means that at some random point in the future I may get a notification that one of these devices has been connected to the internet... and be confused by it. So this is a note for my future self!