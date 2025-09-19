---
layout: page
location: pages/organising/tools/leaf
permalink: /pages/organising/tools/Miscellaneous-Tools
---

## Misc

- Notepad++ Macros: See [separate notepad++ macro page](/pages/organising/tools//Sample-Notepad++-Macros)
- [Useful tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=7ae17d68-c956-43fd-841f-a3daba3b85ef&query=tag%1FUseful%1FtagGuid%3A445d553a-0d3d-80ce-5f4e-641a12368bae%1Eview%3AVIEW%2FALL_NOTES&)
- [Tools tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=e4f18f96-b476-459c-a741-a54e1c505904&query=tag%1FTools%1FtagGuid%3Abf7c84e2-5e3a-06c7-2762-f2213ad6e7ce%1Eview%3AVIEW%2FALL_NOTES&)
- [Brew: Mac Bulk App Installer For a New Mac OS Install using HomeBrew](https://www.switchingtomac.com/tutorials/how-to-make-a-bulk-app-installer-for-a-new-mac-os-install-using-homebrew/)

## Advice on choosing tech tools

- See [Rob Bowley's great LinkedIn post](https://www.linkedin.com/posts/robertbowley_startups-scaleups-ctoinsights-activity-7130114354934370304-DNro?utm_source=share&utm_medium=member_desktop)

## Little automations

- These are all documented in [[misc-automations]]
## Spectacle

  - Tool which allows keyboard shortcuts for moving windows around

  - Doesn’t run on startup

  - Click the spectacles in the menu bar at top of Mac screen to see all
    shortcuts – typically splat + shift + letter – eg
    
      - \! Commands won’t work on maximised windows\!
    
      - **Alt + Splat + C** (centre current window)
    
      - > **Alt + Splat + arrow** (anchor current window to left or
        > right - good for tiling / to tile)

## Avatar maker

- Personal avatar / profile image maker: [Makowka](https://picrew.me/image_maker/644129)
- Here's the image I made (Feb 2021) (Make sure you credit Makowka, and images can only be used as profile pictures):

![Makowka avatar](/resources/images/MAKOWKA-AVATAR.png)

## YouTube timestamp

- To add a time stamp to a YouTube video, add `?t=43s` to the end of the url (or `&t=43s` if there are already query params added to the end of the url).
- The time is in seconds, so if you want to go more than 60 seconds in, just calculate the total num of seconds. For instance 1:30 would be `?t=90s`
- Like this: https://youtu.be/imNlIoeCjao?t=43s
- ...or like this: https://www.youtube.com/watch?v=zyM2Ep28ED8&t=127s
- ! Note you don't have to do the calculation yourself. 
  - You can just click the Share button in YouTube, check the "Start at" checkbox and fill in the timestamp there.

## Due app

### Accessing deleted items

- To access deleted items in Due, go to settings => backup and email a backup to yourself. But do it quickly! Depending how often you use the app you might have less than 24 hours of backups.
- Top tips:
  - If you want to access something deleted, do it asap
  - Don't delete things! Use the tick button instead, to log things done.

## Drawing tools

- Free tools:
  - [Excalidraw](https://excalidraw.com/) 
    - comes highly recommended by Neal Ford and Mark Richards for architecture diagrams
    - good sketch view - encourages people to realise this is not final
  - [Google drawings](https://docs.google.com/drawings)
  - [Draw.io](https://app.diagrams.net/) (not the same as Google drawings but integrates with Google drive)
- Paid:
  - [Miro](https://www.miro.com) (free if someone else hosts?)
  - [Jamboard](https://jamboard.google.com/) (not actually a drawing tool - postits only)
  - [Omnigraffle on the Mac](https://www.omnigroup.com/omnigraffle)
  - [Visio](https://www.microsoft.com/en-au/microsoft-365/visio/visio-in-microsoft-365)

## Snapdrop: "Like airdrop, but for everything"

Share files between any two devices: https://snapdrop.net/

## Phantom Buster

[Phantom Buster](https://phantombuster.com/automations/linkedin/9227/linkedin-message-sender) is another tool you can also to send linkedin messages - similar to [Dux Soup](<#dux soup>).

## Dux Soup 

Dux soup is a LinkedIn marketing tool

Some simple info that might help if you're finding Dux Soup confusing:

- It's a browser extension - nothing to do with LinkedIn itself
  - It automates LikedIn interactions by clicking through LinkedIn links on your behalf
- Whenever Dux soup visits a profile on your behalf, it stores data from that profile and can tag that stored data with a configured tag which you can later use to search with (see Dux Soup Options => Actions)
- Use Dux Soup Options => Actions to define what will happen whenever a profile is visited - including sending personal messages
- Use the "scan profile" functionality to scan headline info (basically just name and profile id) from LinkedIn search results
- Use the "download data" functionality to download scanned data - or more detailed data from visited profiles - in csv form
- Use the "revisit data" functionality to upload your own edited csvs and visit all the profiles in the csv (potentially also messaging each person)
- Visit the "skipping" and "throttling" sections in Dux soup options to define whether profiles are revisited and also how many profiles you visit per day. Thie is important - if you get it wrong you might get banned from LinkedIn!!

See marketing.md in clare-tech for more detailed notes (Accessible to Clare only).

## Hubspot

(for Clare, the url is stored in chrome bookmarks, under MT Docs => podcast =>
marketing - this won't work for anyone else unless you've also stored the url he
re, sorry!)

### Uploading files to Hubspot

- We use this to upload our full polished podcast transcripts
  - We get these from our transcriber - we can't proceed with this step until we have received the final transcript from the transcriber
- Menu / top strip -> marketing -> files
- Upload files (top right) - select a file
- After uploading: middle of screen: All types -> documents
- Check checkbox next to file
- Click Move at the top - move into podcast-transcripts folder
- To get url of uploaded file:
  - Search for its name
  - Hover over the file and click on Details
  - Click on Copy URL under the url

### Hubspot utm url tracker

- (for the podcast, these notes are now in Gina's Handover Doc)
- Menu (top left) or top strip -> Reports -> analytics tools 
- bottom of screen: Tracking Url builder
- Top right: Create tracking url (fill in fields)
  - For MTB podcast - links to episodes:
    - UTM campaign = Digital Service Delivery
    - Source = Organic Social
    - UTM source = Twitter or whatever
    - UTM medium = social
    - UTM term = Making_Tech_Better_EpisodeXxx
    - UTM content = [your name]
  - For MTB podcast - links to transcripts:
    - UTM campaign = Digital Service Delivery
    - Source = Other Campaigns
    - UTM source = Made Tech Website
    - UTM medium = Making Tech Better
    - UTM term = Episode Xxx
    - UTM content = Transcript
- To fetch the now-created url:
  - The url you just created will probably now be listed at the top of the page, but if not, use "Search tracking urls" at the top to find it.
  - Hover over the row
  - Click "Copy short url" to get the shortened version
  - Click "Actions" to get access to the long tracking url and also to the original url.

## Google suite

### Use keyboard to accept auto-correct suggestions

- Place cursor in mis-spelt word
- Press tab to highlight the correction
- Press Enter

### Google sites

- Here: https://sites.google.com/
- To edit a page:
  - Go to Pages on the right, expankd Home and select your page
- To link to your page from the home page:
    - Select Home, at the top of the tree on the right under Pages    
    - ... or 
        - Go to Sites home (icon top left)
        - Go to Made Tech Knowledge site (Under recent sites at the bottom)
    - You'll see a top-level link to "PR, Blog and podcast"
- To create a sub-page:
    - click dots on one page in page browser on right
    - or drag a page in page browser and move it to be nested under another page
- To link to one page from another:
    - type the name of the page in a link section, and it will get foudn for you
- To base a page on another one:
    - Click the dots next to the page in page tree on right
    - Select duplicate
    - Your new page is now prob at the bottom of the tree
    - You can drag to move it around
- To get name of page to match title
    - Click the three dots in the page browser on the right, and select properties
- To add a row of link sections, like on the podcast page
    - In the browser on the right, select Insert
    - Select one of the layouts
    - Each section will now have an image. If you don't want this, click each of the images until the delete icon appears
    - To add titles and links, just start typing and then use the popup to turn text into a heading or a link
    - Now each row can be duplicated using the buttons on the left

### Google Docs - Linking to sub-sections

- You can link to sections in the same doc by using 
  - highlight => right-click => Link => Headings and bookmarks (at the bottom). 
- But if you want to link from one doc to another...
  - Insert => Bookmark
  - Then click the blue bookmark and right-click where it says Link, and choose "copy link address".

### Google meet - breakout rooms

- You can set up breakout rooms in advance of a meeting, as long as participants are on the invite list - just go into the meeting and set it up. Then you can close mtg down but it will be remembered
- If you set someone up as a co-host, that means they can also assign breakout rooms
- For me to get this working, because I have a pro Google account:
  - I have to log into separate Google account - clare@claresudbery.com
  - Then create calendar invite
  - Use calendar settings to turn on host management
  - Then add co-host of SSE account
  - Copy Google meet link into an invite created using Google SSE account

### Google meet - co-hosts

- If you set someone up as a co-host, that means they can also assign breakout rooms
- Here's how to do it:
  - Go into the actual meeting using the link for the relevant day
  - Click "host controls" bottom right (it's a little padlock icon)
  - Click "host management"
  - Under People, click the three dots next to the person you want to set up as a co-host

### Emoticons / emojis in docs

- Ctrl + cmd + space to embed emojis
  - Windows key + `;` on Windows
- In Google docs now in Chrome you can just type a colon to get a dropdown
	- Right-click => menu doesn't work any more - it creates a comment instead of embedding it in the text
- NB: In google sheets you have to be in the formula input for it to
  work.

### Strikethrough in docs

- Google docs:
  - Windows: Alt + Shift + 5
  - Mac: Cmd + Shift + X (If this gets overridden by 1Password, go to chrome://extensions/shortcuts and just delete whatever's set there and then it should change to "not set")
- (In Word it's Ctrl + Alt + S)

### Google sheets on iphone

- To see other sheets / tabs, get out of editing mode (click the green tick top left), and then they will appear at the bottom of the screen. 

### Google trends

- Find out what people are searching for!
  - [Here](https://trends.google.com/trends)

### Gmail - downloading monthly Google Play 100Gb receipt

- It's ridiculously difficult, but here's how:
  - Three dots, top right of email => Print => Print as PDF
### Gmail mail merges and templates

- I created email templates in SSE Gmail 
	- (when composing, click three dots bottom right => template - have to turn feature on first via Settings => Advanced)
	- (to edit an existing template, compose new email, click three dots bottom right, select existing template, edit, then click three dots again and save it to overwrite existing template)
	- !Watch out! It has a tendency to overwrite the subject line with the name of the template! If you edit it back again and then save again to overwrite the template, sometimes this works. But mostly it doesn't. The whole thing seems a little buggy tbh.
- ...then used mail merge 
	- (have to use pro account - I had to use clare@claresudbery.com) 
	- (the mail merge icon appears over on right hand side when you click in the To field)
	- (you have to check the mail merge checkbox before the spreadsheet option gets enabled)
	- (it will want fields for first name, last name and email address by default)
	- (for other fields, in the body of the email type an @ after you've set up the mail merge and attached the spreadsheet via the icon in the To field - it'll give you the option to select spreadsheet columns)
		- You have to type the @ at the start of a blank line for it to work, but once you've done that you can move it to be embedded in a para
			- ...or if you delete a chunk of text and then paste it back in again, that seems to kick-start it to pick up on all the cell-refs
		- If your source data has line breaks, they'll be ignored in the mail merge - it'll collapse it all into one para
			- This is apparently fixable, but it's a bit of an arse:
			- "I found [this documented solution](https://stackoverflow.com/questions/74194424/stop-multi-line-cell-from-combining-into-paragraph-when-emailed-from-google-shee) on Stack Overflow, which references a tweak to the code in [this Apps Script mail merge solution](https://developers.google.com/apps-script/samples/automations/mail-merge#code.gs). In brief, the way to adjust this behavior in the native Gmail is to change how the JSON character escapes are happening and replace `/n` with `<br>` in function `escapeData_()`."
	- Some gotchas:
		- It kept telling me my email addresses were missing or badly formatted. the only fix I could find was to delete all empty rows in the sheet. I shouldn't have had to do this - I definitely saw it working previously with empty rows, but wevs, this fixed the problem.
### Chrome bookmarks

 - To copy bookmark links with titles as well as urls (eg to add links from bookmarks to a spreadsheet)... 
 - Create Chrome bookmarks folder (click 3 dots top right => bookmarks and lists => bookmark all tabs)
 - Use Export functionality from bookmarks manager to export bookmarks (click three dots top right in bookmark manager)
 - Open exported html in TextEdit, find the bit you're interested 
 - Then just c+p direct into Excel

### Getting Google Authenticator to autofill for passcodes and passkeys on iPhone 16 ios

- Settings => General => Autofill & Passwords => Autofill From
  - Select "Passwords" 
  - Then lower down on the same screen, where it says "Set up Codes in" it will have a default selection of "Passwords" 
  - but you can change this to "Authenticator"
  - You may well have TWO Authenticator apps. The blue one is Microsoft. You want the Google one, which is (Dec '24) a multicoloured asterisk.

### Adding more than 10 Google accounts in Gmail on iphone 16 ios

- After you've added 10 accounts, you'll get an error saying max accounts reached
- This problem is not with google and not with ios settings, it's actually with Safari
- The solution is to clear your Safari cache: 
  - Settings => Apps => Safari => scroll right down to "Clear History and Website Data"
- Then close the recent Google login browser tabs in Safari
- Restart Safari
- Restart Gmail
- Proceed to add more accounts 

## How to make Zoom record individual voices locally

- Settings => Recording => Local Recording => Record a separate audio file for each participant who speaks
- Then to find the recording afterwards:
  - On the same computer you had the meeting on:
  - Login to Zoom, and go to https://zoom.us/recording/local

## Redis 

- In memory key value store, at Samba was not in application 

## Finding birth + death certificates

- [Free public service to find death certificates](https://www.freebmd.org.uk/cgi/search.pl)
  - Or you can [search the GRO index](https://www.gro.gov.uk/gro/content/certificates/indexes_search.asp) - which actually seems to be more accurate (my great-grandmother's age at death was listed inaccurately on the other site) - and then order copies directly from GRO.

## Letterboxd - adding notes to films

- I've already created a custom list "want to watch" under my profile
- To see existing notes:
  - Claresudbery | Lists
  - Select the list
  - click "List view" (icon wi horizontal lines, top right) to see notes
- To add a new film with note / add a note:
  - It varies per platform
  - The important thing is to look for the edit icon
  - On desktop you only see the edit icon (little pencil) BEFORE you click through to the list itself
  - On mobile you see it by clicking through to the list and THEN clicking the three dots top right and selecting edit - but you have to do this while looking at the whole list, not when looking at an individual film (then click Edit entries, then select the film you want to edit from the list that comes up)
  - I suspect maybe you can't add a note while adding a film - you have to go back and add the note afterwards?

## Mentimeter

- Search terms: poll, quiz

- Useful for quizzes, surveys, polls, Q&A, audience participation, interactive presentations
- Use [mentimeter.com](https://www.mentimeter.com/) to create something new
- Use [menti.com](https://www.menti.com/) when sharing someting you've created
- !! Is a great alternative to typeform, which will draw you in with a free account
  - ...but Typeform is pretty useless because it's only free for 10 responses per month, and that includes when you're testing your own poll or quiz!
  - ...so I ended up paying for an account
- Things I found difficult when creating a form with Menti:
  - Everythign is called a presentation, whether it's quiz or poll or whatever... and every question is called a slide.
  - To allow multi-select on multiple choice questions, on the Content tab scroll down to the bottom and select "Let participants submit multiple options"
  - You have to enable voting on quiz questions - click Customize
  - You have to set it to "audience pace" (click Settings) or they'll only get whichever question you're looking at, and won't get the next until you move to next slide
  - When you click View Results it doesn't actually show you voting statistics. To see those, go back to the slides and the results are shown next to them
  - To share the quiz with people, click the Share button => Participation => Copy link
  - To share results, you can do the following, but the first option works best:
    - 1. click Share => Presentation sharing and copy link for live results
      - !! I could only get this to work for the first slide in the presentation, until I realised if you hover bottom left, you'll get a next/prev slide button
      - You can grab the urls from clicking next/prev slide to get permanent links for each page of results
    - 2. Click View results, click through to each slide from the bottom of the screen and note the url
      - BUT these are only updated every 10 mins so not much use in a live situation
    - 3. Just share the management screen which has results next to each slide
      - Doesn't look great but does give you instant results

## Random red panda

![ageimals_red_panda.jpeg](/resources/images/ageimals_red_panda.jpeg)

## Video Editing Tools

- Kinemaster (good on mobile)
- Inshot (good on mobile)
- Youtube (free if you have gmail account)
- Shotcut (free on windows desktop)
- QuickTime (on Mac)

## Creating nicely formatted code snippets for slides etc

- One good tool for snippets of code is [carbon.now](https://carbon.now.sh/)
  - It can be fiddly if you want to correct mistakes (because you can’t necessarily reverse engineer back to code from rendered image)
  - But it turns out you can give it a gist url](https://github.com/carbon-app/carbon#usage), which is a much better way of keeping track 

## Misc Public APIs

- [Some interesting Public APIs](https://github.com/public-apis/public-apis)
  - Over 100 public APIs that can be used in your projects. It contains APIs that return data on anything from animals, food, government and weather

## Access Clipboard History

- To access your full clipboard history
- On Windows:
  - Use Windows key + V
- On Mac:
  - Install Flycut from App store
  - Use Command + Shift + V + left/right arrow keys to scroll through history
    - ! Have to hold down Command + Shift + V while using arrow keys!
  - ! You have to start the app before it will work!
    - It won't be obvious that it's started - it'll just get added to the system tray on the top of the screen.
    - What it has in its clipboard history will be whatever got added the last time you opened the app.
    - To add to system startup items:
    - Apple menu > System Settings, click General in the sidebar, then click Login Items on the right.
    - Click the + button, open the Applications folder, and search for Flycut.
  - ! Will have to enable in Accessibility to get it working
    - When you first install it, it tells you to do this but you might find you can 't because it's not actually listed there
    - Just copy something into clipboard and then press Command + Shift + V
    - Then you will get the same message again, and this time Flycut will be listed under Accessibility
  - ! Sometimes a bug means the popup gets stuck in the middle of your screen
    - To get rid of it, Use Cmd + Space + Flycut to "open" the Flycut app
    - The app won't open, but the popup will go away when you next click on the screen

## Bulk rename utility for Windows

- search terms: bulk file renaming, bulk file naming, filenames
- The Free File Renaming Utility for Windows.
- Rename multiple files with the click of a button.
- [here](https://www.bulkrenameutility.co.uk/)
  - recommended by BillyBum and Duck on forum

## Mastodon

- [Trello card with more Mastodon advice](https://trello.com/c/8wa3z8k1/498-finish-setting-up-mastodon) (accessible to Clare only)
- Linking to Twitter profiles that don't (as far as you know) have associated Mastodon accounts: `@twitterhandle@twitter.com`
- Linking to other Mastodon users within a post: `@woodyzuill@mstdn.social`
- Sharing your Mastodon profile: 
  1. You'll see people doing the same as you would do within a Mastodon post: `@claresudbery@mastodon.social `
  2. Or you can build a normal link to your profile like this: https://mastodon.social/@claresudbery
- Adding alt text to images: See [discussion here](https://mastodon.social/@claresudbery/110146029522676081)

## Powerpoint

### Change background for all powerpoint slides

- View => Slide master => 
  - Background styles => 
  - Format background => 
  - Picture or texture fill
- To just change the background for one slide: Design => Format background 
  - but if you want to, from here, you can select all slides you are interested in on left
- If you have image in clipboard you can click "from clipboard"
- If you click top slide on left, it will be applied to all slides
  - or if you are already on a slide, in the slide master, the relevant template will be selected and will only affect certain slides
- ! To get out of it, click "Close master" on right hand of ribbon at top.

### Change background for individual powerpoint slide

- To create a new theme, View => Slide master
  - You can copy/paste and edit an existing theme by selecting the parent slide at the top of the theme and using copy/paste
- To apply the new theme to specific slide(s):
  - Select the slide(s)
  - Select Design at the top
  - Scroll through the carousel of themes at the top until you see the parent slide for your theme
  - PRESS CTRL, then click on the theme you want, select "Apply to selected slides" it will be applied to the selected slide(s).

### Turn on live subtitles

- You can do this while presenting
- You need an Office 365 subscription
- Click the Slide Show tab
- Check Always Use Subtitles
- Underneath, click Settings:
  - Select the language you're speaking and the language you want the subtitles to be in
  - Choose your microphone
  - Set the position of your subtitles
- When you start the slide show, it will transcribe what you're saying live! Cool!

## Google Slides

### Animations in Google Slides

- Select visual component
    - Insert => animation
    - or right-click => animate
    - or click the 3 dots on the tool bar at the top and you'll see the animate option
    - gives a dialog on the right
- bullet points can have "appear on click"
- select an object and click "add animation"
- each object you want to appear on click has to have an animation added to it
- the order they appear in the list of animations on the right is the order they'll appear in when you click (you can reorder them)
- to animate bullet points...
    - select the containing object, eg textbox containing bullet points, and check "by paragraph" - each bullet point is considered a separate paragraph
- to animate screenshots...
    - could have two screenshots, one highlighted and one not
    - or could have a transparent-filled rectangle which appears on screen in animated fashion and encloses the bit of code you want to highlight

## Demo Pro

- DemoPro
- For drawing on screen during presentations
- Look for the diagonal arrow in the top system menu bar
- Useful shortcuts:
  - REMEMBER YOU HAVE TO HOLD DOWN THE KEY COMBINATION WHILE DRAWING
  - AND SET THE COLOUR BEFORE STARTING
  - Ctrl A - arrow
  - Ctrl Q - rectangle
  - Ctrl Z - undo
  - Ctrl X - erase all

## Booking.com

- To add new hotel booking to calendar - do nothing!
  - There's often a bit of a delay, but you will receive an invite to your Google calendar
  - (not sure if this is a setting somewhere, but you only have to set it up once)

## Canon Scanner / Scanning

- On windows I used the IJ Scan Utility

## HP OfficeJet Pro X551dw HP Printer

- On windows I used the HP Print & Scan Doctor 
- Windows Key + Print

## Get past paywalls

Avoid ads / adverts, turn off paywalls, access content for free, view websites in Chrome without interference.
https://12ft.io/ then enter the url you're trying to view.
You can also turn off javascript for the site you're on
Chrome Extensions that can help: 
More advice here: https://www.wikihow.com/Access-News-Articles-for-Free

## Schedule social media posts

- [OneUp](https://www.oneupapp.io/)
- [Later.com](https://app.later.com/)
- Typefully - [Twitter/X thread writer](https://typefully.com/)
- [Buffer](https://buffer.com/) - used by TWIP

## Neck message roller

- I bought this from Poxdo PTE Ltd on Sat 16/3/24, after seeing an ad on Twitter (I think? Or maybe Insta?)

## Microsoft Office 365

- If any family member needs to [reinstall](<#microsoft office 365>):
- Two options:
  - 1. They sign in to their account and manage from there:
    - That family member simply needs to log into the same MS Account used to accept the original share 
    - Go to Services/Subscriptions: https://account.microsoft.com/services/
    - Download and install
  - 2. Give them a sharing link:
    - Go to the Microsoft Office section in your account: https://account.microsoft.com/services/microsoft365/details
    - Click the Share button (even though it's already shared with them)
    - Copy and share the link it gives you

## Obsidian

- See [Obsidian page](/pages/organising/tools/Obsidian)

## How to oil a lock

- From comvo with mojo on blue pages, #General Questions, p289:
- "Don't use WD40 for anything other than water displacement or penetration, it all but gives up the ghost in in weeks rather than months (its what its designed for, and is in the title - W(ater)D(isplacement)-40) use something like 3in1, chain oil or sewing machine oil for lubrication. Oh and for god sake never oil a sticky or stiff lock use graphite powder (from a pencil) or spray."
- "The stuff I used is `WRX Technical Spray - Penetrating oilk, contains graphite and MoS`. I can't tell from your description whether it's right or wrong. Because it's oil (which you say not to use) and it's penetrating (which you also warn against), but it contains graphite (which you recommend) and it's a spray (which you also recommend)??"
- "So this is entirely to do with what happens after the oil has penetrated (this is a penetrating oil, with graphite and Molybdenum disulfide) - by being light and having the ability to get between seized items it also evaporates rather rapidly leaving a gummy residue which sometimes makes the situation worse - a lock has many small items that are dependant on being able to move smoothly - this is where the Graphite and Molybdenum disulfide come into play - they remain after the oil evaporates leaving a longer and dryer lubrication still in the lock (*locks can get stiff for other reasons other than lubrication)."
- "So... is it the right stuff or not?"
- "Middle of the road - not great, not the worst it could be."

## How to plan journeys across the UK (particularly in Greater Manchester) using public transport

- [Traveline journey planner](https://www.traveline.info/)

## Calendly

- To troubleshoot why slots are not available...
	- Make sure you're signed into your Calendly account
	- Visit the scheduling page as though you were trying to book an appointment
	- Click the troubleshooting button at the bottom
	- Click on a date you're interested in
	- On the right, the various timeslots will be listed, along with reasons they're not available
	- Click on a time you're interested in, and it will give more info as to why it's not available
	- Click done when you're done
## Spotify

### List of Spotify voice commands

- "Hey siri, xxxx on Spotify"
- From here: [https://support.spotify.com/uk/article/siri-and-spotify/](https://support.spotify.com/uk/article/siri-and-spotify/)
- I can't get them to work though!
- Things you should be able to do:
	- Play songs, artists, albums, playlists, podcasts  
	- Like music to save it to Your Library  
	- Tell you what’s currently playing  
	- Change the volume  
	- Skip tracks  
	- Play/pause  
	- And more!
## LinkedIn Pulse

- eg Steve Smith from AOTB published a post about values...
	- The post as it appears on linkedin feed: [Taking the time to examine my personal values has given me a powerful leadership tool. | Steve Smith](https://www.linkedin.com/posts/stevesmithtech_taking-the-time-to-examine-my-personal-values-activity-7352843402419269632-rbjt?utm_source=share&utm_medium=member_ios&rcm=ACoAAAiZYLUBKE3tP8lBfqVfboHdbSUih9-OOXY)
	- The post as it appears standalone: [My personal values](https://www.linkedin.com/pulse/my-personal-values-steve-smith-vxa4e?utm_source=share&utm_medium=member_ios&utm_campaign=share_via)
- LinkedIn Pulse is a publishing platform integrated within LinkedIn that allows users to create and share long-form articles and other content directly on the platform. 
- Originally a separate app, LinkedIn acquired and integrated Pulse, making it a core part of the LinkedIn experience.