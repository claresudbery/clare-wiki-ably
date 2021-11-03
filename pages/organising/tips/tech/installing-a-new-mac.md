---
layout: page
location: pages/organising/tips/tech/leaf
permalink: /pages/organising/tips/tech/Installing-A-New-Mac
---

This is a slightly abbreviated version for public consumption - the full [Clare version is here](https://github.com/claresudbery/clare-tech/blob/master/organising/private/reinstalling-new-mac.md) (only accessible to Clare).

Note that this was created purely for me. I'm not suggesting these are sensible defaults for anyone else setting up a new Mac / Macbook.

I've created a [brew script for some of it](#automating-the-installation) but sadly a lot of it is still manual.

## See also

See also the following resources from others who have done similar but with more sophistication:

- [Chezmoi](https://github.com/twpayne/chezmoi), for managing personal configuration files (dotfiles, like ~/.bashrc) across multiple machines
- [Mac Dev Anxible Playbook](https://github.com/geerlingguy/mac-dev-playbook)
- My Made Tech colleague Will Gibson's [idempotent laptop brew script](https://github.com/WillGibson/laptop-setup)

## Stuff to do manually as soon as I open my new laptop:

(I've recorded every step here and elsewhere in case I ever get this configured in something more powerful than a bash script.)

* Change user password
    * System Preferences => Users & Groups => Change Password
* If it's already been set up with a user name that you don't like:
    * Change user name to **Your name** and home folder name to **yourname**
        * Home folder name is important to me because my scripts will break if I don't use that folder name
        * Instructions here: https://support.apple.com/en-us/HT201548 
    * You have to create a separate admin account to do this!
* Give it your fingerprint (System Preferences => Touch ID)
* Connect to Wifi (pw needed)
* Download / Install 1password app on laptop (pw needed), 
    * Use Safari for now - Chrome will be installed by the script (below)
    * Sign in via the website - account details are in 1Password (via another device), under Account
    * Then download the app in the app store (or just start with this?)
        * If you get errors, try quitting Safari
        * Also try installing [in safe mode](https://support.apple.com/en-gb/guide/mac-help/mh21245/mac)
    * to make it work in browser - add all your accounts (eg home and work) 
        * actually I'm not sure about this - you might have to have separate logins for separate google accounts?
        * Anyway it will prompt you to add multiple accounts in the desktop app
    * (if you get problems in the browser, you might have to remove the extension (Settings => More Tools => Extensions
        * ...and then add it again - https://1password.com/downloads/mac/#browsers)
    * Note that you won't have to add the Chrome extension 
        * because Chrome gets installed by the script
        * and later on you'll sync your profiles in Chrome and they'll pick up the 1Password extension automatically
* Set up 1password to use fingerprint
    * Main 1password menu => Preferences => Security => Unlock using touch ID
* Set up Apple ID (pw needed)
    * Go to system preferences and click the Sign in button, top right
* Use iCloud
    * Sync iCloud Drive
    * Sync Photos with iCloud
    * Sync Contacts with iCloud
    * Sync Calendars with iCloud
    * Sync Notes with iCloud
    * Sync Find My Mac with iCloud
    * Sync Home with iCloud
* Let Calendar use my location
* Add your own Google account and turn on (pw needed)
    * This might partially happen as a result of setting up Apple ID, but you still need to do the following:
    * System Preferences => Internet Accounts 
    * Select Google on the left
    * Sync Mail
    * Sync Contacts
    * Sync Calendars
    * Sync Notes
* Set up Meraki: go here https://m.meraki.com/mdm/ - and enter network id [get this from your system admin]
* Enable FileVault (this should have already happened when you installed the OS)
    * Encrypt disk (should have come for free when you enabled fileVault) 
    * (basically System Prefs - Security and Privacy - FileVault - unlock the padlock - Turn FileVault on) (but maybe you have to then wait in that dialog, with the padlock unlocked, while encryption happens, otherwise it seems to pause until you return?)
* Amend security preferences to allow Avast system extension to be loaded
* Install any OS updates - might need to agree terms and conditions for OS upgrade?

## Stuff I have put in a script
* To run the brew script, see [Automating the installation](#automating-the-installation) below.
    * !! You have to install brew and cask first before running script - notes are [below](#automating-the-installation)
    * Once you're done, see [Stuff that would have to be done after script has run](#stuff-that-would-have-to-be-done-after-script-has-run) below.

## Stuff that would have to be done after script has run

(I've recorded every step here and elsewhere in case I ever get this configured in something more powerful than a bash script.)

* Start iTerm2
    * Then restart iTerm2 (this will ask you if you want to install updates automatically - say yes)
* Customise Finder to have home folder and development folder in favourites
    * Open Finder
    * Use Cmd+Shift+h to see Home folder
    * Use Cmd+Up-arrow to go one level up
    * Drag Home folder into favourites
* Set Chrome up
    * Pin Chrome to Dock
    * Sync Chrome with Made Tech gmail account (pw needed)
    * Sync Chrome with personal gmail account (pw needed)
* Set Slack up
    * Start the Slack app and you'll be redirected to the browser
    * Add Slack to Login (so it starts every time you start laptop):
        * System prefs
        * Users & groups
        * unlock the padlock
        * select your user
        * Select Login Items, top right
        * Click the + button to add a new login item
* Check that the jekyll setup stuff in the script worked:
    * Go to your website folder
    * Start up jekyll server: **jekyll serve**
    * Visit [localhost wiki](http://127.0.0.1:4000)
* Set Dropbox up
    * Open the app and ctrl+click on Open
    * You'll have to set a few things up - follow prompts
* Set Google FileStream up
    * Open system prefs to give permission
    * Click Google Drive icon at top of screen and sign in with email
* Add volume control to top bar
    * System Preferences
    * Sound
    * Show volume in menu bar
* Change touchbar so it has a sleep key on it
    * System Preferences
    * Keyboard
    * Customise Control Strip
    * Drag what you want into the touchbar
* Set sourcetree up
    * Just start the app and connect to GitHub account
* Set Visual Studio Code Insiders up
    * Open the app and ctrl+click on Open
* Set Spotify up
    * Open the app and ctrl+click on Open
    * Login 
    * Allow Spotify to access files in Download folder
    * Download the playlists you want to download 
* Set OneDrive up
    * Open the app and ctrl+click on Open
    * Follow prompts
 
# Automating the installation

## How to automate?

I used [a brew script](#using-the-script), which will make my life easier but is till not ideal. There are still a lot of manual steps which you could probably avoid if you used a tool more fit for the purpose. One of the problems is how many times I need to enter passwords or use 2FA - both in the manual part of the process and while running the script - but any automation of this side of things opens up a million attack vectors unless you're very very careful, and I didn't have time to set it all up and test it for security.

I could have used something like Ansible - but that would have required me to learn Ansible and spend even more time on a thing that was already sucking time out of my week. 

Or I could have just copied the whole thing to a VM and stuck it in the cloud - but then everything would have quickly gone out of date, and it would have been a hell of a lot bigger to store than just a simple script.

## Using the script

- The script is [here](/resources/scripts/installing-new-mac).
- You have to install brew and cask manually first - I couldn't get it to work in a script (dunno why) - see [below](#install-brew).
- The script requires some user input - keep an eye on it.
- Get the script
    - Put it in home folder 
    - Edit it to your tastes / with your details
    - Make the script runnable: **chmod a+x installing-new-mac**
    - Run the script: **sh installing-new-mac**

### Install brew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install cask:
!! Might not be needed!
When I ran this script I got lots of git permission errors for this step which I couldn't resolve, but in the end it seemed I didn't need to do this anyway - because cask had already been installed with brew?

```
brew tap caskroom/cask
brew install caskroom/cask/brew-cask
```