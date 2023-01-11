---
layout: page
location: pages/think/events/workshops/leaf
permalink: /pages/think/events/workshops/Remote-Coding-Tools
---

## Intro

- This page has a list of tools you can use when running remote coding workshops

## Quick List

- Visual Studio Code LiveShare extension
- Dedicated Driver 
    - LF says easy to set up but a lot of disadvantages
- [Anydesk](#anydesk)  
    - LF says has best advantages
- Git Handoff  
    - LF says not great
        - hard to get consistent experience on everyone's machine
    - make a branch, pull/push, one person shares their machine
- VNC
    - used by Emily
- CyberDojo 

## AnyDesk Plus EC2 Instance

- [AnyDesk](https://anydesk.com/gb/features/screen-sharing)

Quick setup guide - see headings below.

### Go to Amazon instances

- Login to Amazon (root user) and go to Instances
- [Here](https://eu-west-1.console.aws.amazon.com/ec2/home?region=eu-west-1#Instances:)
- Or select Services (top left) => Compute => EC2
- then click Instances under the Instances heading on the left

### Create an EC2 instance

- Click big Launch Instance button
- Give it a name
- Select OS 
    - I used Windows last time I did it
    - Used the default - Microsoft Windows Server 2022 Base
- Instance type
    - I used t2.xlarge
- Key pair
    - Remember this is specific to the region
    - If you have one already you can reuse it
    - I clicked Create new key pair
    - gave it a name (eg iconics.learninghour)
    - Used .pem
    - Then stored it securely in 1password
- Configure storage
    - 60 GiB, gp2
- Launch instance (big button at bottom)

### Connect to the instance

- If it's an existing one, right-click the instance and select Connect
- If you've just created it, click Connect to instance
    - Initially it'll say "weren't able to connect" because it'll still be setting it up
    - But you can probably still access RDP client
- Click RDP client
    - Click "download remote desktop file"
    - Get the password from the pem
        - Click "upload private key file" and upload the pem file you created or selected earlier
        - Click decrypt password
        - Click the copy button next to the password (NOT the public DNS - the thing below that)
        - Store it somewhere so you don't have to do this again!
- If you don't have it already, download Windows RDP client [("Microsoft Remote Desktop")](https://apps.apple.com/gb/app/microsoft-remote-desktop/id1295203466?mt=12)
    - Either double-click the rdp file you downloaded from Amazon, or...
        - Click the three dots and select "Import from RDP file"
        - Select the rdp file you downloaded from Amazon
        - Double-click the desktop once it's created
    - Use the password you copied above from the RDP client page on the Amazon instance
    - Click Continue on the security warning ("certificate couldn't be verified")
    - Note that on MacBook, it will place the desktop in a new space
        - This can be confusing because if you click the RDP icon or use alt-tab to reach it, it might look like you have no desktop running
        - It will show the desktop with a green dot to show it's running IF you used the "import from rdp file" approach, but it won't if you just double-clicked the rdp file
        - You can use Ctrl + right/left arrow to access the desktop

### Set up the instance

- While in RDP and in the Windows instance you just connected to...
- Use [this script here](https://github.com/approvals/ApprovalTests.Net.StarterProject/blob/master/install.windows.ps1)
- This means copying the commented out line at the top and running it in an elevated PowerShell 
    - (right-click Windows key and select "Windows Powershell (Admin)")
- This will set up a Windows machine from scratch
- It will also install AnyDesk, thereby allowing others to login to this instance
- This will all take a while - approx half an hour
    - but you can set up anydesk (below) as soon as it's installed, which should be early on

### Set up AnyDesk

- AnyDesk is installed early on in the process
- As soon as you see the AnyDesk icon in the system tray, click it to launch Anydesk
- Click the burger menu, top right, and Set password to get a password your users can use
- When the machine is finished setting up, you need to restart the machine in order for Anydesk to work 
    - This will mean closing down AnyDesk. Do NOT click Yes when it asks if you want to install it as a service (not that exact wording but something like that - just click No instead of Yes)
    - (right-click Windows icon => Power => Restart)

### Give your ID and Anydesk pw to AnyDesk users

- This is how they will connect
    - Because they have the pw, you can ignore the popup that asks you to accept their connection
- You'll need a separate machine for each set of users (eg if running a workshop with pairs, a separate machine for each pair or mob - if only one mob, only one machine needed)
- It won't work unless you're attached to the instance via RDP and you've launched AnyDesk
- I found the Invite button didn't work - it was just always disabled no matter what
    - but it's fine, you don't need it
    - just give users your ID and they can use that to connect
    - they can either enter it in the "Enter remote address" field at the top of the anydesk app, or they can use the following url - `https://go.anydesk.com/abcdefghi`, where `abcdefghi` is the 9-digit ID you have given them.

### Shut down or terminate your instance to save money

- If you choose shut down (NOT restart) (right-click Windows icon => Power), you will not be charged by Amazon for ongoing compute time
    - you will still be charged (not much) for some storage
    - but it will be available to restart at any time: Instances => right-click => start instance
    - it's really just gone into hibernation - everything you installed will still be there, but it is equivalent to shutting down a Windows machine
- If you terminate the instance, it's gone forever but you won't be charged anything

### Gotchas

- The AnyDesk invite button doesn't seem to work - see above
- AnyDesk won't work unless you're attached to the instance via RDP and you've launched AnyDesk
- While the instance is running, you will be charged for it - see above to see how to either shut it down or terminate it
- If you close down an instance rather than restart (right-click Windows icon => Power => and then shut down instead of Restart), you have to download a new rdp
    - You will get a connection error if you try to connect from RDP using the previous RDP file
        - you only need a new RDP file, not a new admin pw
    - Amazon => Instances => right-click the instance and select Connect
    - Click RDP client
        - you might need to refresh this page to get updated rdp
    - Click "download remote desktop file"
- If you have multiple pairs you will need one machine per pair
- EC2 Windows machines are not really designed to be used in this way, hence odd things like having to keep creating a new RDP file