---
layout: page
location: pages/organising/tools/leaf
permalink: /pages/organising/tools/Obsidian
---
## Contents of this file

- [[#Getting started with Obsidian]]
- [[#Useful bits and bobs]]
	- [Vault management](<#vault management>)
	- [Keyboard shortcuts](<#keyboard shortcuts>)
	- [[#Publish to a website]]
- [[#Customising Obsidian]]
	- [[#Configuring a new vault]]
	- [css snippets](<#css snippets>) / [[#css snippets]]
	- [Plugins](<#plugins>)
	- [Variables](<#variables>)
	- [Modal forms](<#modal forms>)
	- [QuickAdd](<#quickadd>)
		- [Use QuickAdd to automate note and folder creation](<#use quickadd to automate note and folder creation>)
		- [DON'T Use QuickAdd this way to automate folder and file creation](<#dont use quickadd this way to automate folder and file creation>)
- [Basic operations](<#basic operations>)
	- [Command palette](<#command palette>)
	- [Settings](<#settings>)
	- [Quick Switcher](<#quick switcher>)
	- [Navigating](<#navigating>)
	- [Source mode](<#source mode>)
	- [Linking to other content](<#linking to other content>)
	- [Formatting markdown](<#formatting markdown>)
	- [Callouts](<#callouts>)
	- [File / folder management](<#file  folder management>)
	- [[#Attachments and images]]
	- [[#Centre text on the page]]
	- [[#Find and replace with line breaks]]
- [File syncing](<#file syncing>)
	- [Syncing with Google Drive](<#syncing with google drive>)
	- [Syncing with iCloud](<#syncing with icloud>)
	- [Github Sync plugin](<#github sync plugin>)
	- [GitHub Syncing on iPhone](<#github syncing on iphone>)
- [Organising content](<#organising content>)
	- [Saving / storing links to 3rd party content](<#saving  storing links to 3rd party content>)
	- [Importing content from other Notes systems](<#importing content from other notes systems>)
	- [Each note should contain one idea](<#each note should contain one idea>)
	- [Maps of Content (MOCs)](<#maps of content mocs>)
	- [Templates](<#templates>)
	- [Properties](<#properties>)
		- [Showing / hiding properties](<#showing  hiding properties>)
		- [Bad properties](<#bad properties>)
		- [Searching for properties and other things](<#searching for properties and other things>)
		- [Tag properties](<#tag properties>)
		- [Parent properties](<#parent properties>)
		- [Aliases](<#aliases>)
- [Troubleshooting](<#troubleshooting>)
	- [[#Updating headings so links aren't broken]]
	- [If you lose the outline or properties pane](<#if you lose the outline or properties pane>)
	- [If folders are not in alphabetical order in dropdowns](<#if folders are not in alphabetical order in dropdowns>)
	- [If live preview colours text inside single brackets](<#if live preview colours text inside single brackets>)
	- [If you can't delete a note](<#if you cant delete a note>)
	- [[#Fixing internal links that use hyphens instead of spaces]]
- [[#To do (Clare)]]
	- [Questions](<#questions>)
- [[#My original Obsidian notes]]
	- [Obsidian Overview](<#obsidian overview>)
	- [Notes from Diana's presentation at Socrates UK '24](<#notes from diana's presentation at socrates uk '24>)
# Getting started with Obsidian

- Nice getting-started tutorial [here](https://obsidian.rocks/getting-started-with-obsidian-a-beginners-guide/)
- The [[#Basic operations]] section below - browse these to help you find your way around
- [[#Publish to a website]] is v handy functionality if you want to publish
- I love [[#QuickAdd]] and [[#Modal forms]]
- I use [[#Syncing with iCloud]] which I find v useful
- You might find useful stuff in the [[#Organising content]] section
- See [[#Troubleshooting]] if you have problems
# Useful bits and bobs
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

## Keyboard shortcuts

- !! Now maintaining this list in Obsidian - [[Keyboard shortcuts|CareerAnalysis vault]]
## Publish to a website

- I hoped I could link to private pages from elsewhere, like I can with clare-tech by using GitHub links...
	- ...but it wasn't really the same. I found a way of doing this by putting my vault into a GitHub repo and sharing links to files in that repo, but Obsidian uses non-standard markdown so things like internal links and callouts didn't work nicely
- By paying for Obsidian publish, you can publish your whole vault as a website
	- It's not very cheap! It's $95 per year PER WEBSITE
- You can publish multiple vaults to one website
	- ...and you can publish only parts of your vault
- I've published [here](https://publish.obsidian.md/clare-wiki-career)
	- I've published only the public parts of my Clare's Career vault, AND sections of clare-wiki, all to the same site
- To get this working, do the following:
	- Create an [Obsidian account online](https://obsidian.md/auth?returnto=%2Faccount%2Fpublish#signup)
		- You won't necessarily have one of these already if you're using the free version
	- Sign in online and [pay for Obsidian Publish](https://obsidian.md/account/publish) in your account
	- Sign in within the Obsidian app as well
		- Not the same as signing in online
		- Go to [[#Settings]] > General > Account > Login
	- Enable Obsidian Publish in the app: [[#Settings]] > Core plugins > Publish.
	- Now you can publish via [[#Command palette]] > Publish changes
	- [More here](https://help.obsidian.md/publish/setup)
# Customising Obsidian

## Configuring a new vault

- Start with the vault closed while you do actions in the file system:
	- Plugins:
		- Easiest thing is to copy `community-plugins.json` and `core-plugins.json` ***and the plugins folder*** from the `.obsidian` folder of another vault...
			- ...but be aware that you'll also be copying over vault-related config info
			- ...so, for instance, I ended up with a Git config file having its remote source being overwritten with the url of a different repo, because I'd copied over the [[#Github Sync plugin|Github Sync community plugin]] from another vault
		- ...or open the [[#Plugins|plugins section]] of another vault and copy over the plugins you want in both vaults
		- I currently have the following...
		- Core (non-default): 
			- Properties view
		- Community:
			- Colored Text
			- Highlightr
			- Modal forms
			- QuickAdd
	- Hotkeys:
		- Copy `hotkeys.json` from the `.obsidian` folder of another vault
			- Remember that if the other vault has hotkeys that you want to keep that refer to specific things created using community plugins, you need to create those things first - eg a specific [[#QuickAdd]] macro
		- Open up your new copy of `hotkeys.json` in a text editor and remove any that you don't want to keep
	- css
		- Check the snippets sub-folder (if there is one) under `.obsidian`
		- Copy whatever's in there into a new `snippets` sub-folder under your destination `.obsidian` folder
	- While you're looking at the `.obsidian` folder of your source vault, check whether any of the other `json` files might contain any other customisations you want to copy over to the new vault
- Open the vault
	- (Note that these are my preferred settings, stored here for my benefit - your preferences may differ):
	- Turn on any css snippets:
		- Go to [[#Settings]] => Appearance => scroll down to css at the bottom
		- If no snippets are listed (and you copied some over in the previous step), click the Refresh button
		- Turn the slider to "on" for each snippet you want to apply
	- Make properties sections be hidden by default: [Settings](<#settings>) => Editor => properties in document => hidden
	- Create a Templates folder, point to it from the core `Templates` plugin, add at least one simple template
		- More on this [[#Templates|here]]
	- Go to [Settings](<#settings>) and remove any [[#Plugins|plugin]] macros you don't want
		- If you copied over the whole of your `plugins` folder and you had the `QuickAdd` or `Modal forms` plugins, you will now have all the macros you set up, and this might include stuff that's not relevant to this vault
## css snippets

- Used for styling how things look in a note
- In [settings](<#settings>) under Appearance, at the bottom, click the folder icon next to CSS Snippets to open the correct location
- Create a `css` file in your vault, under `.obsidian/snippets` (Use Cmd + shift + `.` to show hidden files in MacOS file explorer)
  - Call it what you like, eg `my-styles.css`
- In [settings](<#settings>) under Appearance, at the bottom, click the Refresh button to show your css file [thing]
- Turn the switch on next to your file to load what's in it
- To find out what the css is for the bit you're interested in, use the developer tools:
  - Cmd + option + i (Mac) or Ctrl + Shift + i (Windows)
  - Click the "Select an element on the page to inspect it" tool 
  - (top left of the right hand pane - a diagonal arow in a dotted square).
  - Hover over the app to highlight pieces of it, and click on the part you want to style.
- To get your css to work when publishing your notes using Obsidian Publish:
	- Copy any css snippets into one file called `publish.css` in the root of your vault. Publish this file when you publish everything else.
## Plugins

- On desktop:
  - Obsidian (top left) => Settings => Community plugins => turn on
    - or use [command palette](<#command palette>) to reach settings
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

## Variables

- There are various places you can use variables
- The places I know about are [templates](<#templates>) and [QuickAdd](<#quickadd>)[]()
- In templates, you can use them to fill in values, like `{{date}}` in the example [below](<#templates>)
- In QuickAdd, you can use them in things like file paths, like in the example [below](<#use quickadd to automate note and folder creation>)
- There are standard Obsidian variables. I know about these three (I don't _think_ there are any more):
  - `{{date}}`
  - `{{time}}`
  - `{{title}}`
- You can also create your own variables. In that case you need the `VALUE` keyword followed by the name of the variable:
  - `{{VALUE:VariableName}}`
- The only way I know of capturing a variable is via `QuickAdd`
  - In this case, it's not at all obvious and (IMHO) really badly documented, but the way to do it is simply to refer to it elsewhere, either in a QuickAdd macro or in a template.
  - eg in the example [below](<#use quickadd to automate note and folder creation>)
    - I want a FileName variable 
    - so I simply add `{{VALUE:FileName}}` to my file name format and when I run the `QuickAdd` command, it will popup an input asking me to enter a value for `FileName`
    - I also want a `LessonUrl` variable, so I add it to my template, and this also results in a popup with an input asking me for a value
    - For full explanation, see [example](<#use quickadd to automate note and folder creation>)
  - As far as I can work out, you _don't_ (and maybe even can't?) use the `Capture` type of QuickAdd to capture variables. Anything captured via that method will end up being pasted into a file, rather than being made available as a variable to other bits of functionality

## Modal forms

- `Modal forms` is a useful plugin
- My notes come from [this article](https://obsidian.rocks/improving-callouts-with-obsidian-modal/)
- The modal forms plugin doesn't add any icons on the left hand side - instead it adds a bunch of commands to [command palette](<#command palette>) - just search for "modal forms"
  - Each command opens a new form - by default they appear on right hand side (or main panel on mobile), but you can configure it differently via [plugin settings](<#plugins>)
  - Note that these forms are what you use to _manage_ forms you will then create yourself - so they are effectively _meta_ forms
- Example - create a form you can use in future to create new callouts:
  - Install two [plugins](<#plugins>): `QuickAdd` and `Modal Forms`
  - Create the form:
    - Select "Modal Forms - new form" from [command palette](<#command palette>)
    - This will open a form for you to fill out in the right hand panel (where properties normally appear)
    - Name = `new_callout`, Title = `New Callout`
    - Click `Add more fields`
      - ! You'll then instantly get an error for fields BELOW that you haven't even filled in yet - don't worry, just keep filling in the form
    - Add four fields (every time you want another field, click `Add more fields`):
      - 1. Name = `Title`, Type = `Text`
      - 2. Name = `Contents`, Type = `Text`
      - 3. Name = `Collapsible`, Type = `Toggle`
      - 4. Name = `Type`, Type = `Select`
        - Click `Add more options` and keep clicking it every time you want to add a new option
        - Labels are up to you, values should be actual values - see [below](<#callouts>) for list of callout types
        - Use the arrows to change the order they'll appear in the dropdown
    - (Optional) Click `Preview` to see what it looks like
    - Click `Save and Close`
  - Now you have a way of gathering data from user, but as yet, you don't have
    - A way of triggering the form
    - A way of processing the data from the form. 
    - So...
  - ...Use `QuickAdd` to define what will be done with the form data:
    - Go to the QuickAdd settings (see [plugins](<#plugins>) for how)
    - Type "New Callout" into the input next to `Manage Macros`
    - Click the `Template` button to the right, and select `Capture`
    - Click `Add Choice` to create a new action called `New Callout`
    - Click the gear icon to the right of the new `New Callout` action
    - Turn on `Capture to active file`
    - Scroll down and turn on `Capture format`.
    - Paste this code (note that the encasing triple backticks should ALSO be pasted into the textbox - it won't work without them!):
````js 
```js quickadd
    const modalForm = app.plugins.plugins.modalforms.api;
    const result = await modalForm.openForm('new_callout');
    const collapsible = result.get('Collapsible');
    const col = (collapsible) ? '-' : '';
    return result.asString(`> [!{{Type}}]${col} {{Title}}\n> {{Contents}}\n\n`);
```
````
    - Close the popup
  - Test it works:
    - Open [command palette](<#command palette>) and type "quick" to select `Run QuickAdd`
    - Select `New Callout` (if it's the only one, you can just hit Enter)
    - Fill in the form 
      - You can use tab to navigate, and spacebar to set the toggle, and Enter to Submit
      - You can include `\n` in the `Content` input to add new lines, or once it's done, use up arrow to enter the callout, and use Shift+Enter at the END of a line to add new lines
  - Create a hotkey / command
    - If you want, in QuickAdd [settings](<#settings>) you can click the lightning icon next to `New Callout`
    - Now it'll turn up as its own item in [command palette](<#command palette>)
    - This also means you can give it its own [hotkey](<#keyboard shortcuts>) if you like

## QuickAdd

- You can use the `QuickAdd` [plugin](<#plugins>) to automate actions you do frequently 
- See [Modal Forms](<#modal forms>) for an example of using it to automate the creation of [callouts](<#callouts>)
- See [below](<#use quickadd to automate note and folder creation>) for using QuickAdd to automate the creation of a file in specific folder using a specific template
- [Format syntax](https://quickadd.obsidian.guide/docs/FormatSyntax)

### Use QuickAdd to automate note and folder creation

- Here's how to use QuickAdd to automate the creation of a file in specific folder using a specific template:
- Create a [template](<#templates>)
- Open the [QuickAdd settings](<#plugins>)
  - (if not done already) In the `Template Folder Path` section, specify the path to your templates folder. 
  - Create a new macro: 
    - Next to `Manage Macros`, enter your macro's name 
    - Select Template via the button to the right 
    - Click `Add Choice`
    - The macro will appear above the `Manage Macros` button
  - Edit the new macro: Click the cog icon to the right of its name:
    - Specify which template to use next to `Template path`
    - Turn on `File Name Format` 
      - Put something like this in the input: `{{VALUE:LessonID}} - {{VALUE:LessonName}}`
        - Or if you want a bespoke sub-folder to be created...
        - Enter this instead: `{{VALUE:FolderName}}/{{VALUE:LessonID}} - {{VALUE:LessonName}}`
        - The forward-slash means the missing folder will be created, with `FolderName`
      - The `{{VALUE:` part indicates these are custom [variables](<#variables>)
        - It means QuickAdd will prompt the user to enter two values for `LessonID` and `LessonName` (and `FolderName` if you went for that option)
    - I discovered I could also access the `LessonID` variable in my template
      - I wanted to capture another variable (`{{VALUE:LessonUrl}}`) to use only in my template (not in the `QuickAdd` macro), so I just added it to the [template](<#templates>), and because that template was referenced in the QuickAdd macro, when the macro ran, it popped up an input asking the user for a value for the variable
      - Note that I couldn't originally get this to work (not sure why), so I attempted a sneaky way of doing this...
        - I do NOT recommend this...
        - I turned on `Create in folder`, and in `Folder path` I entered `{{VALUE:LessonUrl}}` and clicked `Add`
        - It added it to the list of folders in the config, but not to the list the user sees
        - but it did SEEM to mean I could reference `{{VALUE:LessonUrl}}` in my template...
        - but then the folder-picking stopped working, so it seemed this just broke stuff
        - ...and anyway it turned to be unnecessary, as I could just add the variable to the template
      - If you want more sophisticated ways of getting user input for templates, I believe you can do this using the `Templater` plugin, but I haven't explored this
    - Select `Create in folder` and select the folder you want to use
      - You can select multiple folders here
    - Select `Include subfolders` (if you want)
    - Select `Open` (if you want)
    - There's no Save button, just close the popup and your settings will be saved
  - Turn the macro into a command: 
    - Click the lightning icon to the right of its name
    - Now it will turn up in the [command palette](<#command palette>) and you can setup a [hotkey](<#keyboard shortcuts>) to trigger it
- I tried to make this fancier by adding more steps in `QuickAdd` - spoecifically I tried to use `Capture` and `Macro` but I couldn't make head or tail of it and the documentation didn't help
  - eg I found lots of scources suggesting I use scripts using javascript but I couldn't for the life of me work out how to actually enter a script
  - and I couldn't work out how the hell to get variables to work
  - ...and I was spending WAY too long on it
  - ...so I had to give up and stick with my original simple solution
  - but fwiw this video MIGHT help - I just didn't have 45 mins spare to watch it: [here](https://youtu.be/xAR6N9N8e6U?si=roUI4BADRh0yY_Q4)

### DON'T Use QuickAdd this way to automate folder and file creation

- (Don't do this! Use QuickAdd in a different way instead, [[#Use QuickAdd to automate note and folder creation|as described in separate section]])
- Go to [settings](<#settings>) => QuickAdd
- Click Manage Macros
- Give it a name
- Click `Add Macro`
- Click `Configure`
- Add a template step:
  - Click `Template`
  - Click the cog next to the new Template step 
  - Click the title to change it to what you want
  - Select the template you want to use (click in `template path` input)
  - Close the popup (there is no Save button, it saves automatically)
- Add a Capture step:
  - Click `Capture`
  - Click the cog next to the new Capture step 
  - Click the title to change it to the name of the captured variable - eg `FolderName`
  - Close the popup (there is no Save button, it saves automatically)
- Nope. I give up. I was trying to follow the instructions below from Google AI, but I couldn't make any sense of "Add a macro choice and select create folder" and "Add a macro choice and select create note" - these options did not appear to be available
- 2. Create a Macro:
Go to the "Macro" choice in QuickAdd settings.
Click "Add New Macro".
Give your macro a name (e.g., "Create Folder and Note").
Click "Configure". 
3. Configure the Macro:
Template Choice:
Add a "Template Choice" to your macro.
Choose a template that will be used to create the note within the folder.
Capture Choice (Optional):
Add a "Capture Choice" to your macro.
This allows you to capture input from the user, for example, to name the folder.
Macro Choice (Create Folder):
Add a "Macro Choice" and select "Create Folder".
In the "Folder Path" field, specify where the new folder should be created (e.g., "Projects/{{VALUE:Folder Name}}").
In the "File Name" field, specify the name of the new folder (e.g., "{{VALUE:Folder Name}}").
Macro Choice (Create Note):
Add a "Macro Choice" and select "Create Note".
In the "Folder Path" field, specify where the new note should be created (e.g., "Projects/{{VALUE:Folder Name}}").
In the "File Name" field, specify the name of the new note (e.g., "{{VALUE:Folder Name}}.md").
Add a "Wait" Choice (Optional):
Add a "Wait Choice" to allow the user to see the folder and note being created.
Save the Macro:
Click "Save" to save your macro. 
4. Use the Macro:
Open the command palette (Ctrl/Cmd + P).
Type "QuickAdd" and select the macro you created.
Follow the prompts to create the folder and note. 
Example Macro Configuration:
Macro Name: Create Project Folder and Note
Template Choice: (Choose your preferred template)
Capture Choice:
Name: Folder Name
Prompt: Enter the name of the project folder:
Macro Choice (Create Folder):
Action: Create Folder
Folder Path: Projects/{{VALUE:Folder Name}}
File Name: {{VALUE:Folder Name}}
Macro Choice (Create Note):
Action: Create Note
Folder Path: Projects/{{VALUE:Folder Name}}
File Name: {{VALUE:Folder Name}}.md
Wait Choice: (Optional)
Time: 1 second

# Basic operations

## Command palette

- Mobile: In main window, pull down from top of screen as though refreshing
- Desktop: Cmd + P / Ctrl + P
- Note you can use this to reach Settings: Open command palette => search for settings => "Open settings"

## Settings

- Open command palette (Cmd+P) => search for settings => "Open settings"
- Or just use Cmd/Ctrl + `,`

## Quick Switcher

- Get there via Cmd/Ctrl+O
- Used to find and go to, or create, other notes / content
- There's also search functionlaity via magnifying glass, top right

## Navigating

- Use [quick switcher](<#quick switcher>) to move between notes
- Backlinks show you what links to your content and what it links to
- Click the link icons with arrows, top right
- You can also see relationships in graph format
  - Click the graph icon (linked circles) on left hand side
- Use Cmd + P => "Copy file path" to copy file path
- Use the community plugin "Reveal active file" from Clare Macrae to get a little crosshairs-ish icon at the top of the file explorer that will reveal the location of the current file

## Source mode

- View source as markdown instead of formatted:
  - Desktop: 
    - View => Source mode
    - Three dots top right => source mode
    - [Command palette](<#command palette>) => View source mode
    - I have the hotkey Cmd + Shift + M set up for this
  - Mobile: Three dots, top right => Source mode
    - View => Source mode 

## Linking to other content

- Links to sub-sections via headings
  - Like this: `[[#A header|that header there]]`
  - As soon as you type `[[#` you'll be given a list of possible headings in this file
  - Whatever goes after `|` is the link text
  - If you want to link to a heading in another note, do it like this: `[[Clare's Career MOC#A heading|a heading in another note]]`
    - Note the first part is the name of the other note - once you type`[[` it will give you a dropdown of notes, then type `#` and it'll give you another dropdown of headings
- Links to other files: 
  - Like this `[[my other file]]`
  - Just start typing `[[` - the closing braces will be filled in, and you can type note/file name to search
- Ordinary links
  - `[Link text](actual url)`
  - You can also just type the link text and then Cmd+K or Ctrl+K like most other apps
- Links to sentences / paragraphs in other notes
  - You can add an id anywhere at the end of a sentence or paragraph, by typing `^id-name`
	  - It has to be at the end of the line, and you have to have a space between the end of the line and the `^` character
  - Then elsewhere you can type `^id-name` inside a link - either just `[[^id-name]]` in the same file, or `[[file-name^id-name]]` in another file (note that it will get converted to `[[file-name#^id-name]]`)
  - Or if the ID hasn't been added yet, you can just type `[[^` or `[[file-name^` and you'll get a dropdown containing all the paragraphs in that file, and you can also type words and it will find the relevant para - then select the para and it will create an id with a random name (eg `^adf45g`) and insert it at the end of the relevant block in the relevant file

## Formatting markdown

- Bold/italic:
  - `*italic*` Cmd + I / Ctrl + i will get you here
  - `**bold**` Cmd + b / Ctrl + b will get you here
  - `***bold and italic***`  
  - you can use underscores instead of asterisks
- Horizontal line / divider
  - `***` then press Enter
- Lists:
  - Type `1.` and enter for ordered list
  - Type `-` for bullet list
- blockquotes:
  - Type `> ` then the quote

## Callouts

- [My notes came from this article](https://obsidian.rocks/using-callouts-in-obsidian/)
- [Official documentation here](https://help.obsidian.md/callouts)
- You can also create yourself a little modal form to fill in to create callouts
  - See [Modal forms](<#modal forms>)
- If you want, you can use [command palette](<#command palette>), type "callout", select "insert callout" and it will give you a template to fill in
  - The focus will automatically be in the callout type, so you can replace this text with the type you want - but don't press Enter afterwards! Use arrow keys instead
  - When you're done, either keep pressing Enter until you're out the bottom, or use the down arrow to get out of it.
- Tip: 
  - `> [!tip] A tip`
  - `> the actual tip`
  - Instead of `[!tip]` you can use another type of callout - see list below
- Custom callout: 
  - `> [!custom title]`
  - `> the text of the callout`
- Collapsible callout, default to closed: 
  - `> [!tip]- A collapsed tip`
  - `> the text of the callout`
  - To default to open, use `[!tip]+` instead of `[!tip]-`
- All the callout types:
  - `abstract` (green)
  - `attention`, `caution` (orange)
  - `bug` (red)
  - `check`, `done` (green)
  - `cite` (grey)
  - `danger`, `error` (red)
  - `example` (purple)
  - `fail`, `failure`, `missing` (red)
  - `faq`, `help`, `question` (yellow)
  - `hint`, `important` (sky blue)
  - `info` (blue)
  - `note` (blue)
  - `quote` (grey)
  - `success` (green)
  - `summary`, `tldr` (green)
  - `tip` (sky blue)
  - `todo` (blue)
  - `warning` (orange)

## File / folder management

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
  - Desktop: Select folder and hit F2

## Attachments and images

- You can just copy / paste an image and it will embed it for you
- Or place the image in the Attachments folder, which you configure in Settings => Files and links => default location for new attachments
	- then use this syntax: `![[my-image.jpg]]`
- To make them smaller:
	- `![[Pasted image 20250813180043x.jpg|100]]`
	- The `|100` bit at the end is specifying that it should only be 100 pixels wide
- To centre them on the page (with optional sizing too):
	- `![[Pasted image 20250813180043x.jpg|center|100]]`
	- [[#Centre text on the page|See below]] for how to centre text
- I found a way of getting screenshots pasted directly into Obsidian low res so they don't take up tons of storage
	- I documented it in Clare's Career Obsidian (currently accesible to Clare only), in `Misc small AI projects#Get low-res Macbook screenshots` and in `Keyboard shortcuts`
   
## Centre text on the page

- Based on [instructions here](https://forum.obsidian.md/t/text-alignment-with-links-images-formatting-using-markdown-etc/33920/2) (although I didn't do the `cMenu` bit)
- Open a separate editor (I use VS Code) (you can't edit css direct in Obsidian)
- Add this css to both `snippets/my-styles.css` and `publish.css`:
```css
.center-align {
display: block;
text-align: center;
}

.right-align {
display: block;
text-align: right;
}

.left-align {
display: block;
text-align: left;
}
```
- Create three templates files in your `Templates` folder:
	- One called `Center Align Text Template` containing the following: `<span class="center-align"><% tp.file.selection ( ) %></span>`
	- One called `Left Align Text Template` containing the following: `<span class="left-align"><% tp.file.selection ( ) %></span>`
	- One called `Right Align Text Template` containing the following: `<span class="right-align"><% tp.file.selection ( ) %></span>`
- Use the Templater (Cmd + `,` then bottom left) plugin to create hotkeys for the above 3 templates
	- I've only done one hotkey so far - it's Cmd + Ctrl + c for centring text
- Select the text you want to centre, and press the hotkey - it'll surround the text with the appropriate html, resulting in something like this:
	- `<span class="center-align">Centred text</span>`
## Find and replace with line breaks

- See here: https://forum.obsidian.md/t/find-and-replace-and-linebreaks/53041
# File syncing

- If syncing between MacBook and iPhone, your best option seems to be [iCloud](<#syncing with icloud>)
- You can also place your folder somewhere like [Google Drive](<#syncing with google drive>)
  - but this seems a bit flakier than iCloud, and you have to keep manually pulling and pushing, and it's risky to have files open on both devices at once - whereas iCloud just automatically syncs across devices
- Or you can use [GitHub](<#github sync plugin>)

## Syncing with Google Drive

- First create a new vault on mobile (I did this on iphone)
  - just vault, not in iCloud
  - Install + enable the `Google Drive Sync` plugin
    - see [plugin instructions](<#plugins>) if you're not sure how
  - READ THE CAVEATS
    - You have to use the plugin to manage all syncing from now on
    - You can NOT manually add, edit or remove files or config files directly in Google Drive
  - To set things up, you have to go to https://ogd.richardxiong.com - read the instructions you get when you install the plugin
    - !Do this while the vault is still empty!
    - Don't add any content or push to Google Drive until you've set up the refresh token
- To sync with Google Drive:
  - Use the [command palette](<#command palette>)
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
  - If you create a brand new vault and create more than one folder before pushing to Google Drive for the first time, it will create two directories in Google Drive for that vault, and each directory will contain a different one of the vault folders
  - To avoid this happening, push to Google Drive after creating the first folder, then again after creating the second folder
    - After this you can add multiple folders in one sync, and it will work fine
  - I reported this as an issue [here](https://github.com/RichardX366/Obsidian-Google-Drive/issues/10)

## Syncing with iCloud

- It's a bit buggy / idiosyncratic to set up, but after that seems pretty smooth
- Here's what I had to do to get it working first time (see below for subsequent times):
	- Start in phone app
	  - It might give an iCloud option on startup, but only for opening existing vaults, not creating new ones
	  - ... and if you try adding an Obsidian folder to your iCloud drive folder in your MacBook, it won't show up on your phone
	  - But if you just create a new vault, and then delete it (click icon top left, then click name of vault, then select Manage vaults, then select vault name, then "delete vault")...
	  - ...this will bring you to a screen with a "Create new vault" option that allows you to select "Store in iCloud"
	    - I worked this out courtesy of [this post on the Obsidian forum](https://forum.obsidian.md/t/not-able-to-sync-through-icloud/97859/2) (the post is dated 9 Mar '25, I was looking on 31 Mar '25)
	  - ! Warning! If you already created an Obsidian folder in your iCloud drive folder via Macbook, it will still be there! In Finder, it will look as though you have two identically-named folders in the same location
	    - I suggest either removing or renaming the duplicate (not the one being accessed via the phone app) asap
	  - You will now be able to open that folder on desktop and find the vault you created on mobile
  - After you've got it working, you can just place vaults in your iCloud drive folder
	  - This will mean they show up on your phone
  - ! I don't know if the duplicate folder was the cause, but I also had another problem:
    - When I copied another vault I'd already created, on Macbook, from another folder to the new iCloud drive/Obsidian folder, it DID appear on both mobile and desktop, BUT changes did not sync bwteeen desktop and mobile. It seemed like there were two entirely separate vaults.
    - And then when I looked on Desktop at the vault list (via File => open vault), the vault I created on mobile was not listed as being in iCloud Drive / Obsidian. Instead, it was listed as being in `Users/claresudbery/library/Mobile Documents/iCloud~md~Obsidian/Documents`
    - But if I closed down the problematic one on Desktop and removed it from the vault list (via the three dots nest to the vault name in the vault list), then opened it up again by selecting iCloud Drive in the Finder, it found the right one, synced bwteeen desktop and mobile, and the location in the vault list was listed as `Users/claresudbery/library/Mobile Documents/iCloud~md~Obsidian/Documents`
    - At this point I could have the same vault open on both desktop and mobile, and changes in either one would sync with a second or two

## Github Sync plugin

- Note that in the end I didn't bother trying to get this working on mobile
- Actually in the end I didn't use it at all, because even on desktop the functionality is limited - eg you can't edit commit messages - they're automatically generated - and I found it just as easy to use my normal GitHub tools (command line and Git?Hub Desktop, fwiw)
  - I installed the plugin on desktop, and used [iCloud sync](<#syncing with icloud>) to sync with my phone
  - Then changes are committed to Github on laptop
  - I did find [[#GitHub Syncing on iPhone|these instructions]] on how to get it working on phone, but I couldn't be bothered
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
- Troubleshooting:
	- At one point I suddenly got an error in Github Desktop and on the command line: "Your branch is based on 'origin/main', but the upstream is gone." 
	- I still don't understand what this meant or what had happened - everything looked fine in github config and at github.com
	- Whether this is what fixed it I don't know, but I ran `git branch --unset-upstream` on the command line, then closed and reopened Github Desktop and Obsidian, and everything was working again.

## GitHub Syncing on iPhone

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

# Organising content

## Saving / storing links to 3rd party content

- Info here copied from [this article](https://obsidian.rocks/save-articles-to-obsidian-five-different-methods/)
- Five methods...
- 1. Bookmark it
  - Using your browser's bookmarks. Nothing to do with Obsidian
- 2. Copy/paste selective sentences / paras into an Obsidian note
  - Include the url of the original article
- 3. Summarise the content in your own words, in an Obsidian note
  - Include the url of the original article
- 4. Use a bookmarklet. This is 
  - "a tool that you can install as a bookmark, but instead of taking you to a website, it performs some common task for you."
  - There is a bookmarklet that helps pull content into Obsidian. You can find installation instructions on [Kepano’s site](https://stephanango.com/obsidian-web-clipper)
  - The suggestion is that "you also write a note that links to this note with your takeaways. Treat your clipped note as a source article, and create a new note for your own thoughts. This is a great way to save articles in Obsidian."
  - ...or explore this [altenative way of clipping articles into Obsidian](https://obsidian.rocks/clipping-articles-into-obsidian/)
- 5. Use a service
  - The recommended one here is [Readwise](https://readwise.io/)
  - "Readwise is a highlighter tool. It’s like a bookmark tool, but on steroids."
  - "Instead of bookmarking whole articles, you can bookmark a single sentence, image, or even a single word if you want. Readwise will then save that highlight in their database and offer it up to you whenever you need it."
  - "You can automatically sync your Readwise account with your Obsidian vault, so that new notes are created in your vault anytime you highlight something on the internet."
  - "This is both the easiest and the most effective solution I’ve found for saving content to Obsidian."
  - "The downside is that Readwise is a premium tool, and not the cheapest one at that."
  - "If you’re interested in this functionality but don’t want to pay for it, I hear that [Omnivore](https://omnivore.app/) is a great open-source and free alternative. I haven’t tried it yet, but it looks great as well."

## Importing content from other Notes systems

- https://obsidian.md/plugins?id=obsidian-importer
- "The Obsidian team recently released a Community Plugin called Obsidian Importer (click to open in your vault). This new tool allows you to transfer notes from many other note-taking systems. At the time of writing, Obsidian Importer supports:
  - Evernote
  - HTML
  - Notion
  - Bear
  - Google Keep
- And they’re planning on supporting many others, including Apple Notes"

## Each note should contain one idea

- Notes summarised from [here](https://obsidian.rocks/five-title-ideas-for-notes/#Idea-1-Each-Note-Should-Contain-One-Idea)
- 1. Each note contains only one idea
  - eg "Vit D can prevent kidney stones"
  - So my habit of adding multiple sections per file would prob change so that each section was an individual note
- 2. Rename notes some time after you write them
  - Keep revisiting them to decide whether they're ephemeral or not
  - If you're keeping them, rename them (if appropriate) and edit
  - This is from the [Zettelkasten](https://obsidian.rocks/getting-started-with-zettelkasten-in-obsidian/) notes technique
- 3. Search before creating
  - The Cmd/Ctrl + O hotkey allows you to search and see if a thing already exists... then if it doesn't, pressing Enter will create it for you
- 4. If you can't find a note you wrote, rename it
  - Give it a name that matches whatever you were searching for - then you know it'll be easier to find next time!
- 5. Use [aliases](<#aliases>) sparingly
  - "I typically recommend aliases for only two things: synonyms and abbreviations. If I write a note about GTD, it’s not a bad idea to also add an alias spelling out “Getting Things Done”. That way you can search for either term and find the note."
  - "Additionally there are few things more frustrating than searching for a word, expecting to find a note, and discovering later that you used a different word."

## Maps of Content (MOCs)

- See [this article](https://obsidian.rocks/getting-started-with-obsidian-a-beginners-guide/)

## Templates

- My notes summarised from [this article](https://obsidian.rocks/getting-started-with-templates-in-obsidian/#comment-29383)
- Create a Templates folder in your vault
- Make sure you have the core `Templates` [plugin](<#plugins>) enabled
  - Configure it in [Settings](<#settings>) to use your Templates folder
- Place notes in your Templates folder
  - Each note represents a template
  - When you "insert" this template, everything in it will be inserted into the note you are in
  - The most likely thing you'll put in it will be [properties](<#properties>), but you can also put content if you want
  - You can use variables so that, for instance, the date will always be set to the current date
    - The example below has a formatted date, but you can also just use `{{date}}` or `{{time}}`
    - I experimented with `{{datetime}}` and `{{DateTime}}`, but I couldn't get either of those to work
  - You can also use [custom variables](<#variables>)
    - I used this feature for my [file creation macro](<#use quickadd to automate note and folder creation>)
    - I wanted to capture another variable to use ONLY in my template, so I just added `{{VALUE:LessonUrl}}` to the template, and when I ran the `QuickAdd` macro, it popped up an input asking for a value for the variable
      - See [example](<#use quickadd to automate note and folder creation>)
      - If you want more sophisticated ways of getting user input for templates, I believe you can do this using the `Templater` plugin, but I haven't explored this
- To use the template: 
  - Open / create a note
  - Select the "insert template" icon on the left below the calendar icon
    - or use [command palette](<#command palette>) => "insert template"
    - or create a [hotkey](<#keyboard shortcuts>) - Cmd/Ctrl + T is a good one (that's what I've done)
  - Any content in the template will be inserted into your note wherever your cursor is
  - Any properties in the template will go at the top of your note regardless of where your cursor is
    - If you already have properties, the new ones will be merged with the existing ones
    - See [this article](https://obsidian.rocks/five-pro-tips-for-obsidian-properties/#Tip-4-Merge-Properties-from-Templates) for some discussion of potential gotchas when mergng properties from a template
- Here is an example template adapted from the above article:
```
---
parent: "[[Home]]"
ID: "{{VALUE:LessonID}}"
Lesson link: "{{VALUE:LessonUrl}}"
tags:
- any-tag
date: "{{date:YYYY-MM-DD}}T{{time:HH:mm}}"
---
```
- Note that in the article, they suggest `{{date:YYYY-MM-DD}}T{{time:HH:mm}}` for the date, but that results in an "invalid properties" error and prevents you from editing the properties in the properties editor.
  - But if you use `"{{date:YYYY-MM-DD}}T{{time:HH:mm}}"` instead of `{{date:YYYY-MM-DD}}T{{time:HH:mm}}` (ie, encase the value in quotes) then it works a bit better. You might still get a warning but you can now edit the properties in the properties panel without getting the "invalid properties" error.
  - Note that I found a suggestion that it might be better not to use the core Templates plugin, and use the community `Templater` plugin instead: [here](https://forum.obsidian.md/t/correct-format-for-date-time-template-variables-in-properties/68241/5)

## Properties

- Properties are note metadata - or notes about your notes
- More [here](https://obsidian.rocks/an-introduction-to-obsidian-properties/)
  - and [here](https://obsidian.rocks/five-pro-tips-for-obsidian-properties/)
- To get started with properties...
	- First, stop them from appearing by default at the top of your file: Go to [[#Settings]], and disable Editor > Show properties in document
	- Now open the [[#Command palette]], type “properties”, and select “Show file properties”
	- You'll now be able to see them in the panel on the right (Cmd + Alt + B) by clicking the little `i` icon at the top
	- ...or you can see them at the top of the note using [view source](<#source mode>) 
- Note that if you copy properties as pure text using [[#Source mode]], they might not work
	- you might get an error in the panel on the right saying "invalid properties"
	- I don't know why!
	- But you can fix this by instead deleting the copied text, clicking Add property in the panel on the right to add any old random property, and then once the property text is added to the top of your file, edit it appropriately.
- It used to be that properties were added using frontmatter
  - Same as Jekyll! Same as clare-wiki!
  - Like this at top of each file:
```yaml
---
updated: 2023-08-11T06:17
date: 2023-08-11T06:16
tags: writing/idea
parent: "[[Home]]"
---
```
  - You can still add that to the top of an Obsidian file, but when you hit Enter it will turn into a `Properties` metadata section
    - ...depending on whether you have them [hidden](<#showing  hiding properties>)
  - If you add a Jekyll frontmatter header to the top of an Obsidian file, it won't acknowledge the specific properties as being meaningful in any special Obsidian way, but it will recognise it as representing properties, and format it accordingly.
- You can add properties using the Add property button or by just adding a row to the yaml
- To remove a property...
  - Click on its icon and select Remove, or...
  - [view source](<#source mode>) and remove the line of yaml
- It's up to you how many properties you have per file, or you can have no properties at all
- The keyboard shortcut Cmd/Ctrl + `;` allows you to create a new property
- More on properties:
  - [Showing / hiding properties](<#showing  hiding properties>)
  - [Bad properties](<#bad properties>)
  - [Searching for properties](<#searching for properties and other things>)
- Different types of property:
  - [Tags](<#tag properties>)
  - [Parent](<#tag properties>)

### Showing / hiding properties

- You can make properties sections be hidden by default: [Settings](<#settings>) => Editor => properties in document => hidden
  - or set to "source" to allow you to see the YAML as it appears in the code snippet above
  - If they're hidden, one way to see them is to go into [source mode](<#source mode>) and then expand the section at the top via the little arrow
    - ...or enable the core "Properties view" plugin, then go to [command palette](<#command palette>) => `Properties: Show all properties` or `Properties: Show file properties`

### Bad properties

- Note that the [article linked to above](https://obsidian.rocks/an-introduction-to-obsidian-properties/) contained bad data for `parent` - it was formatted as `[[Home]]` instead of `"[[Home]]"`
- When you have a bad property, it shows up as yellow in the property editor but won't let you edit it. The only way to edit is either in [source mode](<#source mode>) or by clicking on the icon and deleting the property, then recreating it.

### Searching for properties and other things

- In the search box (Cmd/Ctrl+Shift+F), put your search term in square brackets, and it will search properties for you
- "Use brackets and a colon ([property:value]) to return files with that property and value. For instance:
  - [aliases:MOC] returns files where the aliases property value contains MOC
  - [completed:true] returns files where the completed property value is true
- Both property and value allow complex logic, such as parentheses for grouping, the OR operator, double-quotes for exact matching, and regex.
  - To learn more about complex logic, see [Search Operators](https://obsidian.rocks/obsidian-search-five-hidden-features/#search-operators).
  - Bonus tip: If you use a search frequently, you can also embed searches within notes."
- (from [here](https://obsidian.rocks/five-pro-tips-for-obsidian-properties/))

### Tag properties

- Go into properties (depending how you're [showing them](<#showing  hiding properties>))
- If you don't have one already, you can add a `tags` property:
```
---
tags: writing/idea
---
```
- Then in a non-source view, when you place cursor in the tags value, it will give you a dropdown to auto-complete, which gets filtered when you start typing

### Parent properties

- Note that the [article linked to above](https://obsidian.rocks/an-introduction-to-obsidian-properties/) contained bad data for `parent` - it was formatted as `[[Home]]` instead of `"[[Home]]"`
  - See [bad data](<#bad properties>) for how to fix this

## Aliases

- [More here](https://help.obsidian.md/aliases)
- Aliases allow you to reference a file using different names
- Like this in YAML:
```yaml
---
aliases:
  - Doggo
  - Woofer
  - Yapper
---
```
- You can link to aliases by just typing an alias name in an internal link
- Obsidian creates the link with the alias as its custom display text, for example `[[Artificial Intelligence|AI]]`.
# Troubleshooting

## Updating headings so links aren't broken

- There is no functionality and no plugins to react automatically to update links when headings are edited, cos it wouldn't be performant
- ...but what you can do is right-click and choose "Rename this heading", and then it will find and update all links for you
## If you lose the outline or properties pane

- Use [command palette](<#command palette>) to "show outline" or "show file properties"
- They might both be in the same pane on the right, in which case the circle with an i icon will show properties, abd the horizontal lines will show outline

## If folders are not in alphabetical order in dropdowns

- This happened to me when I removed the third folder down out of four (in alpha order) and then re-added it. 
- It started appearing as the fourth item in selection dropdowns
- I fixed it by dragging the fourth folder to a new location and then dragging it back to its original location
- This seemed to reset the order to the way I wanted it in the dropdown
- ...although this does suggest that the dropdown is listing them in creation order - so the workaround wouldn't work so well with more folders involved

## If live preview adds colour to text inside single brackets

- You can't have `[text]` because the text gets turned into a different colour inside the square brackets
- See discussion [here](https://forum.obsidian.md/t/live-preview-dont-color-square-bracketed-text-as-a-link-unless-its-part-of-a-link/79896/2)
- Fix it using [css snippets](<#css snippets>)
- Use the following snippet:
```css
.cm-s-obsidian {
  & .cm-link.cm-hmd-barelink {
      color: var(--text-normal);
  }
  
  & .cm-link.cm-hmd-barelink:hover {
      color: var(--text-normal);
      text-decoration: none;
  }
}
```

## If you can't delete a note

- If all it has a title and no content, you can't delete it. 
- Add some text in the body and then you'll be able to delete it.

## Fixing internal links that use hyphens instead of spaces

- When internal links use hyphens instead of spaces, this is called "slugifying"
- Whatever markdown tools I was using for internal links before I imported this repo into Obsidian, they did it like this:
	- If you had a heading that looked like this: `# My Heading`
	- ...and you wanted to link to that section from elsewhere in the file, you would create a link that looked like this: `[My Heading](#my-heading)`
	- But sadly Obsidian doesn't understand this syntax. Obsidian, instead of using hyphens to represent spaces in heading titles, uses two possible syntaxes:
		- This: `[My Heading](#my%sheading)`
		- ...or this: `[My Heading](<#my heading>)`
	- The second of those is preferable (easier to read)
		- (More on this [here](https://forum.obsidian.md/t/internal-links-not-working-with-spaces-in-titles-missing-file-explorer-plugin/92350))
- What you want to do is unslugify!
- I couldn't find any plugins that do this
- By default, Obsidian uses a different syntax for internal links
	- They're called wikilinks and they look like this: `[[#My Heading]]`
	- I found a community plugin called Link Converter that changed markdown links to wikilinks, but sadly it couldn't handle hyphens - it didn't understand that they represented spaces. So after conversion, the links still didn't work.
	- I also tried the Better Markdown Links plugin mentioned in the above [forum link](https://forum.obsidian.md/t/internal-links-not-working-with-spaces-in-titles-missing-file-explorer-plugin/92350/5), but that wasn't any use either.
- I tried doing it in VS Code with regex that I got from ChatGPT, but that wasn't possible without using Python:
	- **Find:** `\[\[#([^\]|]+)\|([^\]]+)\]\]`
	- **Replace with:** `[[#${1//-/ }|${2}]]`
	- "`//-/` is a **non-standard** syntax. This exact replacement might require scripting (e.g., JavaScript, Python) because vanilla regex replace doesn’t support nested replacement logic (like replacing inside a group result)."
- I [asked for help on the Obsidian forum](https://forum.obsidian.md/t/trying-to-convert-old-markdown-to-work-in-obsidian-hyphens-in-internal-links/103017), but I solved the problem all by myself before they had a chance to answer
- In the end I used a Python script suggested by ChatGPT
	- To be honest I was surprised it worked!
	- But it did.
	- I've saved it in `development/python-scripts/fix_links.py`
	- I ran it via `python3 fix_links.py` in the relevant folder
	- You have to change the path at the bottom to point at the root of your obsidian vault
	-  If you comment out the three lines after `if new_content != content:` and uncomment the two print statements after that, you can test the output before running it for real (or just use source control).
	- Here's the full Python script:

```python
import os
import re

def deslugify(slug):
    return slug.replace('-', ' ')

def process_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find and replace markdown-style links
    # e.g. [Some Header](#some-header) → [Some Header](<#some header>)
    new_content = re.sub(
        r'\[([^\]]+)\]\(#([a-z0-9\-]+)\)',
        lambda m: f'[{m.group(1)}](<#{deslugify(m.group(2))}>)',
        content,
        flags=re.IGNORECASE
    )

    if new_content != content:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated: {file_path}")
        # print(f"Would update: {file_path}")
        # print(new_content)

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for filename in files:
            if filename.endswith('.md'):
                process_file(os.path.join(root, filename))

# 🟡 Change this to your folder path
target_directory = '/path/to/vault/root'
process_directory(target_directory)
```

# To do (Clare)

- Check ToCs for published content
  - (I'm not sure how the `outline` core plugin will work on published content?)
- Look into [day planning using Obsidian](https://obsidian.rocks/planning-your-day-by-timeboxing-in-obsidian/)
- Get to know QuickAdd better:
  - [video](https://youtu.be/xAR6N9N8e6U?si=roUI4BADRh0yY_Q4)
- Explore automatic updating of MoC contents using DataView
  - "To automatically update a Map of Content (MoC) in Obsidian with links to all notes within a folder, you can use the Dataview plugin or a plugin like Waypoint. Dataview allows you to create dynamic lists of linked notes, while Waypoint automates the creation of a MOC note within a folder and links all notes within that folder to it."
  - Jackie's [DataView article](https://medium.com/os-techblog/how-to-get-started-with-obsidian-dataview-and-dataviewjs-5d6b5733d4a4)

## Questions

- Tables of contents?
  - Use the `outline` core plugin?
  - For some other ideas, see [here](https://forum.obsidian.md/t/a-graphically-cool-table-of-contents/87684/5)
- Linking to individual headings / sections in notes?
  - See [formatting](<#formatting markdown>) below
# My original Obsidian notes
## Obsidian Overview

- For taking notes / organising knowledge
- [Obsidian](https://obsidian.md/)
- See [here](/pages/organising/BigIndex/Big-Index-Useful-Tools.md#other-technologies-considered-for-bigindex) for other note-taking tools
- See iPhone Notes: "SoCraTes UK '24" for notes on a session I attended about Obsidian
- See also book by Tiago Forte - building a second brain - been recommended to me by a few people

## Notes from Diana's presentation at Socrates UK '24

- Personal note taking app and organising knowledge 
- like notion, but runs on laptop or phone rather than in browser 
- Can be published to a website (clare-wiki!)
	- See [[#Publish to a website|notes below on publishing]]
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
    - It has a [[#Publish to a website|publish feature]] which will allow you to turn your notes into a website!!! Clare-wiki!!