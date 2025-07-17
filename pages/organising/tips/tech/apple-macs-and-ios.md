---
layout: page
categories: organising 
location: "pages/organising/tips/tech/leaf"
permalink: /pages/organising/tips/tech/Apple-Macs-and-iOS
---

## iOS

### Turn off default live photos

- To stop your iPhone from taking Live Photos by default, 
- you need to disable the Live Photo feature in the Camera app 
- and then ensure your phone preserves those settings. 
- First, go to Settings > Camera > Preserve Settings 
	- and make sure the switch next to "Live Photo" is turned on. 
- Then, in the Camera app, 
	- disable Live Photos by tapping the Live Photos icon 
	- (it will have a slash through it when off). 
### How to create a new iPhone Siri command

- In Shortcuts app, click plus button top right    
- search for first action, eg dictate text    
- search for second action, eg add trello card    
- the second action will be added after the first    
- if you want to dictate text, the result will be listed at the bottom as a variable called "dictated text" whenever you have a gap where a variable can go, eg for the name of a Trello card or the content of a note    
- click the drop down at the top => rename to give it a sensible name    
- click done    
- in settings => accessibility, scroll down to vocal shortcuts    
- it's not just a toggle! You can click through   
- click Add Action => continue    
- search for the shortcut you just created    
- enter the words that will trigger the command  
    - !!!! The only way I could get this to work for my trello action was for the trigger words to be exactly the same as the name of the command!
- hit enter on keyboard    
- say the phrase three times - it's a good idea to wait for the green tick at the end of each repetition

### How do i draw a quick diagram on my phone?
    
- Use the ability to draw in the photos app	
- But also, the Notes app also has some diagram drawing functionality!
### Convert live photos to normal ones in ios

- To convert multiple Live Photos to regular still photos on your iPhone, you can use the Photos app to select and save them as still images. You can also use the Shortcuts app to automate this process.  
- Here's how to convert multiple Live Photos to still photos using the Photos app:  
	- Open the Photos app and navigate to Live Photos: Scroll down to the "Media types" section, then select "Live Photos".  
	- Select the photos: Tap the "Select" button and choose the Live Photos you want to convert.  
	- Save to Files: Tap the Share icon and select "Save to Files," choosing a location like "Downloads".  
	- Open Files app and save as images: Open the Files app, navigate to the folder where you saved the photos, tap the three-dot icon, select "Select," choose the photos, and tap the Share icon, then select "Save images".  
- Alternatively, you can use the Shortcuts app for automation:  
	- Open the Shortcuts app: Search for it or find it on your homescreen.  
	- Create a new shortcut: Tap the "+" icon and search for "photos".  
	- Configure the shortcut:  
	- Select "Photos" under Actions and turn on "Select Multiple".  
	- Search for "Convert Image" and select it, turning on "Preserve Metadata".  
	- Search for "Save to Photo Album" and tap it, then tap "Next".  
	- Name and save the shortcut: Give it a name and tap "Done".  
	- Run the shortcut: Use the shortcut to select and convert your Live Photos.  
- Important Note: Converting Live Photos to still photos essentially creates a duplicate of the key frame (the main still image) in the Live Photo. 
	- The original Live Photo will still remain in your library, and the new still photo will be saved separately.
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

### Ventura OS - fingerprint recognition slow or unresponsive

- Remember to manually lock your laptop when testing fixes, use Cmd + Ctrl + Q
    - Using the off button on the smart bar doesn't lock it!
- Turn keyboard off and on again
    - this seemed to work for me
- Reconfigure fingerprints in settings
- Turn laptop off and on again

### How do I know whether I have Intel or Silicon, or x64 vs ARM64?

-	Check About this Mac (top left) => Processor
-	An Intel processor is x64
-	An M1 processor = Apple Silicon = ARM64

### Mission Control

- For some reason my brain confuses this with Activity Monitor (the equivalent of Windows Task Manager).
- Mission Control is what you get when you do `Ctrl | Up-arrow` - shows you all running apps and spaces.

### Finding / quitting running apps 

- [Detailed stuff here](http://osxdaily.com/2013/05/17/see-all-running-apps-mac-os-x/)
- Options:
    - Cmd + option/alt + escape
      - will bring up a list of running apps, so you can select one and force quit
    - Activity Monitor (the equivalent of Windows Task Manager)
      - You can use this if you want to shut down / terminate / force quit an app.
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
- [See below](<#diagnosing a constantly spinning fan>) for what to do if fan keeps going off

### Diagnosing a constantly-spinning fan

- Start with [Activity Monitor](<#finding  quitting running apps>)
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
- [System preferences](<#system preferences top tips>)
- [shortcuts tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=ba3426a1-35e2-47d5-888d-445432271c8c&query=tag%1Fshortcuts%1FtagGuid%3A830603fb-b0ba-403f-9177-3e3ae2b8a9a0%1Eview%3AVIEW%2FALL_NOTES&)
 
### Problems with headphones

- Problem: Output goes to headphones in some contexts but built-in speakers in others.
    - Sometimes it's even going to a second screen!
    - Solution: 
        - System Preferences | Sound
        - Check the checkbox 

### Laggy mouse

- plug-in USB trackball mouse lagging or being jerky (not responding at all then suddenly catching up)
- I found something online suggesting you [reset the SMC](<#resetting the smc>)
- I also foudn something suggesting closing down background apps
- and someting saying turn bluetooth keyboard on and off
- and restart laptop

### Resetting the SMC

- on my machine (ex-MT Macbook Pro with Ventura OS (June '23)), which has an Intel processor (which I can tell because in the Mac abhout dialog it says processor instead of chip), you do it like this:
- Turn laptop off
- Hold down the following four keys for 10 seconds:
    - Shift
    - Ctrl 
    - Alt/Option
    - Power (the fingerprint key, top right)
- Restart

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

### Maximise window on Mac without creating separate desktop / space

- double-click title bar at top of window to get it to fit Mac screen

### When dock / system tray moves to another monitor

- If you drag the mouse to the bottom of a screen and keep dragging, the dock will move to that screen.
- Go to the screen you want the dock on, drag the mouse to the bottom of the screen and keep dragging. The dock will come back.

### Take screenshot and copy straight to clipboard

- Cmd + Ctrl + Shift + 4
- (Cmd + Shift + 4 is just take a screenshot)

### If your browser suddenly goes hyper-zoomed-in on Chrome on a Macbook

- Cmd + 0 will fix that.

## Do simple video editing in QuickTime on Macbook

- See [here](/pages/organising/tips/tech/misc-tech-tips.md#do-simple-video-editing-in-quicktime-on-macbook)

## Change power saving settings so Macbook doesn't shut down when inactive

- I needed to do this when I was having issues with Google Drive failing to upload a large file
- The problem seems to be that this becomes a background task, and the Macbook can't detect that it's happening so it shuts down mid task, and the upload gets cancelled and restarts when you re-activate your laptop
- Solution:
    - Settings => Lock screen => start screen saver when inactive (change to "never")
    - Settings => Lock screen => Turn display off on power adaptor when inactive (change to "never")
    - Settings => Battery => Options => Turn on “prevent automatic sleeping on power adaptor when the display is off”
- ! Don't forget to turn everything back on again !
    - You have to do it in the right order. Do Lock screen settings first (change to 5 and 10 mins). You won't be able to change the “prevent automatic sleeping" display setting setting until you've changed the Lock screen settings to something other than "Never", and it doesn't always pick up on those changed settings straight away - sometimes you have to close and open Settings and then go back to Lock screen settings to check it's changed everything

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

## To properly quit an app

- Cmd + Q - removes it from system tray

## Troubleshooting

### If external hard disk is not appearing in Finder

- In Finder, select Finder > Settings from the menu bar.
- In the General section of settings, make sure you tick the boxes next to External disks and Hard disks.
- Go to the Sidebar and check Hard disks and External disks there as well.
- This setting gets changed if you've followed an online instruction telling you to drag the hard disk icon into Terminal. the only icon I've ever been able to find is the one in the Sidebar in Finder. If you drag this into Terminal, Terminal doesn't respond but it does disappear from the Sidebar and turns the above setting off in Settings! Most annoying!

### If you want to access an external hard drive in Terminal

- These three steps:
    - `cd /`
    - `cd Volumes`
    - `cd ls -la` (list all hard drives)
    - Then if for instance it is listed as `WD USB 2`, you can do `cd "WD USB 2"`

### If you are being told your external hard dive is read only

- It may be that the hard disk is NTFS, which is a Windows format and doesn't work with Mac by default
- I downloaded / installed [Paragon NTFS For Mac](https://shop.paragon-software.com/277/?scope=checkout&cart=255539&cfg=paragon2018)
    - The install required a restart and then I had to 
        - eject the hard disk (in Finder)
        - Turn hard disk off/on again and reconnect USB
- It required some quite heavy duty system access, which made me a bit worried so I turned it off again afterwards:
    - System Settings => Login Items
        - kextload
        - NTFS for Mac.app
        - Paragon NTFS for Mac
    - System Settings => Privacy and Security => Full Disk Access
        - com.paragon-software
    - System Settings => Privacy and Security => ???
        - I thought there was something else but if there was I can't find it!
- It was only a 10-day trial anyway. You have to pay for full version. It's £26.

## Which thunderbolt / USB-C port to use for charging

- Apparently if you charge your Mac using the left hand ports, it can cause overheating and excessive CPU usage
- Some recommend using the right hand ports instead
- But I don't think my current MacBook (circa 2020 to 2024) has this problem!

## If your Spotlight index is not getting rebuilt

- This happened to me after OS upgrade to Sequioia on Mac - I couldn't use the Spotlight search (cmd + spacebar) to search for apps any more - it wouldn't find any of them
- I tried manually forcing index rebuild by adding the Application folder to Spotlight privacy (DSettings => Spotlight => Privacy) and then taking it out again, but that didn't work
- I tried leaving the laptop on overnight for several days to give it time to rebuild index in background, but that didn't work
- I tried effectively turning Spotlight off and on again to force it to rebuild its index:
  - Open Terminal from /Applications/Utilities/ (you can use Spotlight to open Terminal as well, if Spotlight is working enough to be able to do that)
  - Run the following command to find out if indexing is enabled on the volumes your data is on that you wish to search: `mdutil -as`
  - At the command line enter the following command exactly, with precise characters and capitalization: `sudo mdutil -Ea -i off`
      - ! This is slighty different to what they say in the below article. This is the correct version.
    - `-i` is used to toggle indexing on and off
    - `-E` is used to erase and rebuild the index
    - `-a` is used to apply the command to all volumes
  - Now that Spotlight search has been disabled, it’s time to turn it back on again which will force the index to rebuild: `sudo mdutil -Ea -i on`
    - When I did this, the feedback on the command line only said it was enabling the index on `/System/Volumes/Data`
    - No matter what I did, it always said it was working with `/System/Volumes/Data` and ignore my requests to make changes to other folders
      - See copy of command line [below](<#what happened when i tried to rebuild spotlight index from command line>)
    - But the day after I did all of this, my index on `/Applications` was rebuilt. 
      - I don't know if that was because of what I did on the command line or because I was leaving my machine on overnight, which was another piece of advice from [this article](https://osxdaily.com/2024/11/11/how-to-fix-spotlight-search-issues-on-macos-sequoia/).
  - Let the Spotlight index rebuilding process complete, this can take many hours depending on how much data you have on the Mac, so just let it run in the background
  - When Spotlight has finished rebuilding its index, run `mdutil -as` again to confirm indexing is enabled on the volumes your data is on that you wish to search
    - Check to make sure your primary drive (/) shows “Indexing enabled” and that any other volume you wish to search or index is also showing “Indexing Enabled”
  - From [here](https://osxdaily.com/2024/11/11/how-to-fix-spotlight-search-issues-on-macos-sequoia/)
    - ! In this article they get the command slightly wrong. You can't use the flags all together as `-Eia off`, you have to do `-Ea -i off` instead. Otherwise you get `Error: unexpected indexing state (a)`

### What happened when I tried to rebuild Spotlight index from command line

- It seemed like no matter how I tried to direct it ot other volumes, it only ever acted on `/System/Volumes/Data`:

```bash
Usage: mdutil -pEsa -i (on|off) -d volume ...
       mdutil -t {volume-path | deviceid} fileid
	Utility to manage Spotlight indexes.
	-i (on|off)    Turn indexing on or off.
	-E             Erase and rebuild index.
	-s             Print indexing status.
	-a             Apply command to all stores on all volumes.
	-V vol         Apply command to all stores on the specified volume.
	-L volume-path List the directory contents of the Spotlight index on the specified volume.

➜  ~ sudo mdutil -L /Applications
Spotlight directory not found at root: /Applications

➜  ~ sudo mdutil -E -i on -V /Applications
/System/Volumes/Data:
	Indexing enabled.

➜  ~ sudo mdutil -E -i off -V /Applications
/System/Volumes/Data:
2024-11-17 10:32:17.530 mdutil[71186:2809821] mdutil disabling Spotlight: /System/Volumes/Data -> kMDConfigSearchLevelFSSearchOnly
	Indexing disabled.

➜  ~ sudo mdutil -E -i on -V /Applications
/System/Volumes/Data:
	Indexing enabled.

➜  ~ mdutil -as
/:
	Indexing enabled.
/System/Volumes/Data:
	Indexing enabled.
/System/Volumes/Preboot:
	Indexing enabled.

➜  ~ sudo mdutil -E -i off -V /
/System/Volumes/Data:
2024-11-17 10:34:12.777 mdutil[71232:2811416] mdutil disabling Spotlight: /System/Volumes/Data -> kMDConfigSearchLevelFSSearchOnly
	Indexing disabled.

➜  ~ sudo mdutil -E -i off -V "/"
/System/Volumes/Data:
2024-11-17 10:34:21.608 mdutil[71237:2811512] mdutil disabling Spotlight: /System/Volumes/Data -> kMDConfigSearchLevelFSSearchOnly
	Indexing disabled.

➜  ~ sudo mdutil -E -i off -V "/Applications"
/System/Volumes/Data:
2024-11-17 10:34:31.202 mdutil[71243:2811652] mdutil disabling Spotlight: /System/Volumes/Data -> kMDConfigSearchLevelFSSearchOnly
	Indexing disabled.

➜  ~ sudo mdutil -E -i on -V "/Applications"
/System/Volumes/Data:
	Indexing enabled.

➜  ~ sudo mdutil -E -i on -V "/"
/System/Volumes/Data:
	Indexing enabled.

➜  ~ sudo mdutil -E -i on -V /
/System/Volumes/Data:
	Indexing enabled.

➜  ~ sudo mdutil -E -i on -V /Applications
/System/Volumes/Data:
	Indexing enabled.
```

## Kernel panics

- Sometimes when the Mac shuts down unexpectly you get an error report that talks abhout "panic" or "kernel panic".
  - "Sleep transition timed out after 180 seconds"
    - ...or at least I think this was the error. I didn't actually save the error, only the web page I found when I searched it (see below).    
  - I got this error after I'd left my 2020 Mackbook Pro plugged in overnight with the case closed. It was plugged in before I closed the case.
  - I think this is quite unusual - I might leave it plugged in overnight or I might close the case overnight, but rarely both at once.
  - It was also awaiting an OS update which I thkn I'd set to "try again tonight", so it's possible it had tried to act on that.
    - The update hadn't been installed but had been doanloaded. I don't know if it was already downloaded before I'd closed the case.
  - This page might be relevant: https://discussions.apple.com/thread/251274321?sortBy=rank&page=4
    - Everything here is dated 2020, which might be relevant to the fact that I have a 2020 model?

### Check battery level on keyboard

- System Settings => bluetooth

## Edit images in the Preview app

- Sometimes you don't get any edit features and it seems like you can't edit
  - When this happens, just select View => Show Markup Toolbar (near the bottom of the menu), or click the two forward-facing arrows, top right
- If you want to change the dimensions of an image, use Tools => Adjust Size