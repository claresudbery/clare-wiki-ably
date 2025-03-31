---
layout: page
location: pages/organising/tools/leaf
permalink: /pages/organising/tools/Obsidian
---

## Contents of this file:

- [Obsidian Overview](#obsidian-overview)
- [Useful Obsidian links](#useful-obsidian-links)
- [Notes from Diana's presentation at Socrates UK '24](#notes-from-dianas-presentation-at-socrates-uk-24)
- [Vault management](#vault-management)
- [Plugins](#plugins)
- [Basic operations](#basic-operations)
  - [Meta organisation](#meta-organisation)
  - [Formatting markdown](#formatting-markdown)
  - [File / folder management](#file--folder-management)
- [File syncing](#file-syncing)
  - [Syncing with Google Drive](#syncing-with-google-drive)
  - [Syncing with iCloud](#syncing-with-icloud)
  - [Github Sync plugin](#github-sync-plugin)
  - [GitHub Syncing on iPhone](#github-syncing-on-iphone)

## Obsidian Overview

- For taking notes / organising knowledge
- [Obsidian](https://obsidian.md/)
- See [here](/pages/organising/BigIndex/Big-Index-Useful-Tools.md#other-technologies-considered-for-bigindex) for other note-taking tools
- See iPhone Notes: "SoCraTes UK '24" for notes on a session I attended about Obsidian
- See also book by Tiago Forte - building a second brain - been recommended to me by a few people

## Useful Obsidian links

- Nice getting-started tutorial [here](https://obsidian.rocks/getting-started-with-obsidian-a-beginners-guide/)

## Notes from Diana's presentation at Socrates UK '24

- Personal note taking app and organising knowledge 
- like notion, but runs on laptop or phone rather than in browser 
- Can be published to a website (clare-wiki!)
    - But can I link to private pages from elsewhere, like I can with clare-tech by using GitHub links?
- Tasks plugin allows you to manage tasks 
- It's all markdown 
    - But it has its own query language which is embedded and proprietary 
- You can customise it endlessly!
- Minimum information principle - keep notes small 
- Use a template plugin 
- Use the randomizer to find random notes and either read them or delete them, as a way of cleaning things up 
- Is easy to take one big note and split it up into separate files - select text and say extract note from selection 
- Refactoring plugin allows you to identify a pattern and refactor accordingly 
- Questions 
    - Cross platform?
        - You can pay extra to sync across devices - £8 per month 
        - But also the files can be placed somewhere like Google drive to create syncing for free 
        - Any customisations have to be done manually on each separate device 
    - Editing markdown?
        - Yes, easy to link between pages and sections of pages 
        - Can link to paragraphs as well 
    - Porting data?
        - Standard markdown 
    - Ios?
        - Standard ios editing interface, so it's just as awkward to edit as any other ios app 
        - But all the functionality is there, eg linking between docs 
        - Has customisable toolbar 
    - Performance when you have lots of notes?
        - Works well but will take a while to sync data on a new device 
- Tiago Forte - building a second brain 
    - Good book 
    - Anita used a system suggested there, which is to divide everything using the PARA paradigm - Projects, Areas, Resources and Archive 
- Diana 
    - Used it to write her book 
    - Could highlight words she wanted in a glossary, and then use a plugin to generate the glossary for her 
    - It created a graph for her of the conceptual relationships between the different parts of her book 
    - It has a publish feature which will allow you to turn your notes into a website!!! Clare-wiki!!
    - uses it in concert with github, so things get pushed automatically, I think?

## Vault management

- File => Open Vault to both open and create vaults
- You can put them anywhere on hard disk
  - Obsidian will automatically create a new folder with the name of the vault, so you don't need to do that bit - just specify the root folder
  - If you want to move it, just close Obsidian and move folders around (including all contents)
- Different vaults will open in different windows
  - When looking at a window, the way to tell which vault it is is to look bottom left
    - or on iPhone, click the icon top left to see the name of the vault
    - Then click the name of the vault to see a list of all vaults, which will also show you where they are (eg "iCloud")
- The default is for them to go into your Mac Documents folder
- You can open folders containing existing markdown files
- If you want to change the location of an existing vault, just close Obsidian and move folders around (including all contents)
  - but when you reopen, community plugins will have to be re-enabled (see below)
- If you want to know whereabouts on your hard disk a particular file or folder lives...
  - The file explorer in Obsidian is the left hand pane
  - Files are not given extensions here (or not by default)
  - So the default `Welcome.md` will just appear here as "Welcome"
  - Right click on a file, choose Reveal in Finder (or Show in System Explorer if not Mac)
  - then in Finder, you can right-click and choose Get Info
  - If you want the path for Terminal, just copy / paste - then something like `iCloud Drive > Documents > GitHubTest-iCloud` will get pasted as `/Users/claresudbery/Documents/GitHubTest-iCloud` in Terminal

## Plugins

- On desktop:
  - Obsidian (top left) => Settings => Community plugins => turn on
  - Browse for what you want, and install
    - You have to do it separately for every vault you want to use the plugin for
  - Now two things might (should?) happen:
    - A new icon for your plugin will appear on the left in the main window, probably at the bottom
    - In Settings, your plugin will appear at the bottom on the left under Community plugins - this will allows you to access the setitngs foir your plugin
    - In Settings => Community plugins (not the list of plugins but the place you go to add new plugins), you'll see it listed and you can select it to read the readme
  - If you open a new vault, or move a vault and then re-open, community plugins will have to be enabled/re-enabled
    - ...and then you'll be faced with a dialog that has "Turn on and reload" at the top - do not click this button! This turns on restricted mode, which turns OFF community plugins!
- On mobile:
  - Select the icon top left
  - Select your vault
  - Click the settings cog
  - Select community plugins and turn them on (if not already on)
  - Browse to find and install the plugin
  - Remember you have to do it separately for each repo
  - you'll now find the plugin settings in the plugin section at the bottom of Settings for this vault (click top left, select vault, click Cog)
  - Also, when in an open file, click the hamburger menu bottom right to see any commands related to that plugin
  - Also, in Settings => Community plugins (not the list of plugins but the place you go to add new plugins), you'll see it listed and you can select it to read the readme

## Basic operations

### Meta organisation

- View source as markdown instead of formatted:
  - Desktop: View => Source mode
  - Mobile: Three dots, top right => Source mode

### Formatting markdown

- Links to other files: 
  - Like this `[[my other file]]`
  - Just start typing `[[` - the closing braces will be filled in, and you can type note/file name to search
- Ordinary links
  - `[Link text](actual url)`
  - You can also just type the link text and then Cmd+K or Ctrl+K like most other apps
- Bold/italic:
  - `*italic*`
  - `**bold**`
  - `***bold and italic***`
  - you can use underscores instead of asterisks
- Lists:
  - Type `1.` and enter for ordered list
  - Type `-` for bullet list
- blockquotes:
  - Type `> ` then the quote
- Callouts:
  - Tip: 
    - `> [!tip] A tip`
    - `> the actual tip`
  - Custom callout: 
    - `> [!custom title]`
    - `> the text of the callout`
  - Collapsible callout, default to closed: 
    - `> [!tip]- A collapsed tip`
    - `> the text of the callout`
    - To default to open, use `[!tip]+` instead of `[!tip]-`
  - If you want, you can use command palette (Cmd + P or see below), type "callout", select "insert callout" and it will give you a template to fill in
  - [More here](https://obsidian.rocks/using-callouts-in-obsidian/)

### File / folder management

- Add a file to a folder:
  - Desktop: Right-click the folder => Add note
  - Mobile: Long-press the file and select "New note"
- Create a folder: 
  - Mobile: The + image in a folder icon, that appears when you select the vault top left
- Move a file into a folder:
  - Mobile: Long press on a file and wait a second or two, then choose "move file to"
- Create a sub-folder
  - Mobile: Create a new folder, then long-press and "move folder to"
- Rename a file or folder: 
  - Mobile: Long press on the folder name for at least a second, wait for menu to appear - select rename
- Command palette:
  - Mobile: In main window, pull down from top of screen as though refreshing
  - Desktop: Cmd + P / Ctrl + P
   
## File syncing

- If syncing between MacBook and iPhone, your best option seems to be [iCloud](#syncing-with-icloud)
- You can also place your folder somewhere like [Google Drive](#syncing-with-google-drive)
  - but this seems a bit flakier than iCloud, and you have to keep manually pulling and pushing, and it's risky to have files open on both devices at once - whereas iCloud just automatically syncs across devices
- Or you can use [GitHub](#github-sync-plugin)

### Syncing with Google Drive

- First create a new vault on mobile (I did this on iphone)
  - just vault, not in iCloud
  - Install + enable the `Google Drive Sync` plugin
    - see [plugin instructions](#plugins) if you're not sure how
  - READ THE CAVEATS
    - You have to use the plugin to manage all syncing from now on
    - You can NOT manually add, edit or remove files or config files directly in Google Drive
  - To set things up, you have to go to https://ogd.richardxiong.com - read the instructions you get when you install the plugin
    - !Do this while the vault is still empty!
    - Don't add any content or push to Google Drive until you've set up the refresh token
- To sync with Google Drive:
  - Use the command palette
  - You can use either of the two commands `pull from google drive` or `push to google drive`
  - Also, when in an open file, click the hamburger menu bottom right to see "push to google drive"
    - When you push, it pulls first
- To sync with other devices
  - On another device, eg laptop, choose File => Open vault => Open folder as vault
  - Choose the Google Drive folder that's already been created when pushing to google drive from mobile app
  - It will be able to tell that you have the plugin installed, and will prompt to enable it
  - From now on you can push from either mobile or desktop
  - !Note it doesn't recommend you have it open and editing on both devices simultaneously!
    - At first I found I could edit in laptop while app was open, as long as I pushed from laptop and then pulled from app before trying to make changes in app - and vice versa
    - BUT if both devices are editing the same file, they will end up with each other's changes!
    - Also after a couple of rounds, you'll suddenly have duplicate files all over the place
- !! Syncing can sometimes be slow
  - Even though Google Drive says it's up to date, new files might not appear immediately - can take several seconds
- !! There's some kind of bug to do with folders!
  - If you create a brand new vault and create more than one folder before pushing to Google Drive for the first time, it will create two directory in Google Drive for that vault, and each directory will contain a different one of the vault folders
  - To avoid this happening, push to Google Drive after creating the first folder, then again after creating the second folder
    - After this you can add multiple folders in one sync, and it will work fine

### Syncing with iCloud

- It's a bit buggy / idiosyncratic op set up, but after that seems pretty smooth
- Here's what I had to do:
- Start in phone app
  - It might give an iCloud option on startup, but only for opening existing vaults, not creating new ones
  - ... and if you try adding an Obsidian folder to your iCloud drive folder n your MacBook, it won't show up on your phone
  - But if you just create a new vault, and then delete it (click icon top left, then click name of vault, then select Manage vaults, then select vault name, then "delete vault")...
  - ...this will bring you to a screen with a "Create new vault" option that allows you to select "Store in iCloud"
    - I worked this out courtesy of [this post on the Obsidian forum](https://forum.obsidian.md/t/not-able-to-sync-through-icloud/97859/2) (the post is dated 9 Mar '25, I was looking on 31 Mar '25)
  - ! Warning! If you already created an Obsidian folder in your iCloud drive folder via Macbook, it will still be there! In Finder, it will look as though you have two identically-named folders in the same location
    - I suggest either removing or renaming the duplicate (not the one being accessed via the phone app) asap
  - You will now be able to open that folder on desktop and find the vault you created on mobile
  - ! I don't know if the duplicate folder was the cause, but I also had another problem:
    - When I copied another vault I'd already created, on Macbook, from another folder to the new iCloud drive/Obsidian folder, it DID appear on both mobile and desktop, BUT changes did not sync bwteeen desktop and mobile. It seemed like there were two entirely separate vaults.
    - And then when I looked on Desktop at the vault list (via File => open vault), the vault I created on mobile was not listed as being in iCloud Drive / Obsidian. Instead, it was listed as being in `Users/claresudbery/library/Mobile Documents/iCloud~md~Obsidian/Documents`
    - But if I closed down the problematic one on Desktop and removed it from the vault list (via the three dots nest to the vault name in the vault list), then opened it up again by selecting iCloud Drive in the Finder, it found the right one, synced bwteeen desktop and mobile, and the location in the vault list was listed as `Users/claresudbery/library/Mobile Documents/iCloud~md~Obsidian/Documents`
    - At this point I could have the same vault open on both desktop and mobile, and changes in either one would sync with a second or two

### Github Sync plugin

- Note that in the end I didn't bother trying to get this working on mobile
  - I installed the plugin on desktop, and used [iCloud sync](#syncing-with-icloud) to sync with my phone
  - Then changes are committed to Github on laptop
  - I did find these instructions on how to get it working on phone, but I couldn't be bothered
- How to Use
  - Click the Sync with Remote ribbon icon (little GitHub cat, on the left in main page) to pull changes from your GitHub repo and push local changes.
  - If there are any conflicts, the unmerged files will be opened for you to resolve (or just push again with the unresolved conflicts - that should work too).
- Setup
  - "Navigate to your vault and git init the folder.
    - !! What he means here is that you have to go to wherever Obsidian thinks the physical location of your vault is!
    - So basically, you need a git clone in the folder Obsidian is using for your vault
    - If you get "not a vault" errors, this is why.
  - For simplicity, this plugin does not support branching. Everything gets pushed to main.
  - Setting up remote URL
    - All this plugin needs now is your GitHub repo's remote URL. You can grab this from the GitHub repo page for your vault:
    - You can use either the HTTPS or SSH url. 
    - Try clicking the Sync button now - it should work.
- "Follow my stuff at https://kevin.gd/"

### GitHub Syncing on iPhone

- I also found this video but didn't watch in the end: https://www.youtube.com/watch?v=h3oK1yX3CZ8&t=190s
- This is what I got via Google's AI, so might not be accurate:
Here's a breakdown of the process:
1. Set up on your computer (Mac/Windows):
Create a GitHub repository: Create an empty repository on GitHub to store your Obsidian vault. 
Install Obsidian Git plugin: In Obsidian (desktop), install the "Git" plugin from the community plugins. 
Configure Git:
Go to Obsidian settings, find the Git plugin, and configure your GitHub username, password (or a personal access token for better security), and commit author information. 
Clone your GitHub repository to your computer. 
Move the .git folder from the cloned repository to the root directory of your Obsidian vault. 
Push your vault to GitHub: Make sure your vault is synced with your GitHub repository. 
2. Set up on your iPhone:
Install Obsidian and a Git client (a-shell or iSH): Install the Obsidian app and either a-shell or iSH from the App Store. 
Set up a-shell/iSH:
a-shell: Use pickFolder to select the Obsidian folder on your iPhone. 
iSH: Install Git in iSH using apk add git. 
Clone your GitHub repository:
a-shell: Use lg2 clone to clone your GitHub repository. 
iSH: Use git clone to clone your GitHub repository. 
Create an empty vault in Obsidian: Create a new vault in Obsidian on your iPhone. 
Copy the cloned repository to the Obsidian vault:
a-shell: Copy the contents of the cloned repository to the Obsidian vault folder. 
iSH: Copy the contents of the cloned repository to the Obsidian vault folder. 
Configure Git in Obsidian:
a-shell: Use a-shell to set up Git authentication and commit author information. 
iSH: Use git config to set up Git authentication and commit author information. 
Sync your vault:
a-shell/iSH: Use Git commands (e.g., git add, git commit, git push) to sync your vault with GitHub. 
Obsidian Git plugin: Enable auto-commit and sync in the Obsidian Git plugin settings. 
Alternative: Using iCloud (with caveats):
Create a vault in Obsidian that uses iCloud: This allows Obsidian to automatically create a folder in iCloud. 
Set up Git with the iCloud vault: You can still use Git with an iCloud vault, but you might encounter issues with iCloud's limitations. 
Consider using a tool like a-shell or iSH: These tools can help manage Git operations on your iPhone, even with an iCloud vault. 