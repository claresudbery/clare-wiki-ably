
---
layout: page
location: pages/organising/tools/leaf
permalink: /pages/organising/tools/OBS
---

# Checklist when filming

- Check lighting
    - I found this worked best:
        - no glasses 
        - blackout shade (arch-shaped piece of hardboard) on arched window 
        - all Other Shades And Doors Closed
        - main Light On
        - two other side Lights on
- Make sure you're using the mic you want in system settings
- Make sure mic is as close as poss to mouth
- Check sound levels in OBS - need to be close to the top of the green
    - Can adjust input levels in system settings
- Make sure the AI noise-reducing mic is on / enabled
    - You have to open it manually - Cmd + Space + Krisp app
    - Log in (I use Google a/c)
    - Select microphone (this will also help you to discover whether your favourite mic is currently enabled in your system)
    - To close it down again, the only way I've found so far is via Activity Monitor and Force Quit! 
- Remember my default setup for O'Reilly videos was to capture the screen in front of me
    - This means front screen has full-screen slides
    - ...and slide notes are on side screen
    - ...which means I'm not looking straight ahead, but this is fine because my face won't be on screen!
- Do a short test video
    - Is there sound? Is it good quality?
    - Is anything crucial disappearing off the bottom / sides of the screen because aspect ratio?

# Getting started

- Download and install from obsproject.com
- First time in:
    - Click through the differrent settings
    - Don't need to do "quit & reopen" can just hit later
    - Set up all the system permissions it prompts you for
    - Optimise just for recording
    - Base canvas resolution = 1920 x 1080 for O'Reilly
        - standard 16:9 1080p blah
    - FPS = Frames per second, smaller means smlaler file sizes, O'Reilly want 30
- Go to Setitngs, lower right
    - Select output on left
        - output mode: advanced
            - select recording tab
                - recording format: MP4
                - video encoder: apple vt H264 hardware encoder
                - encoder settings 
                    - bitrate: 5000
                    - keyframe interval: 0s
                        - it either records a full frame or a differential from the last keyframe
                        - the interval makes the difference to how often it stores keyframes
                        - how many keyframes there are also affects editing - are you editing a keyframe? Better if you are.
        - Video bit rate = 5000
        - Audio bit rate = 320
            - O'Reilly spec says 32kbps for audio qualoity but shgould prob be 320!
        - Recording - recording path - this is where recordings will go
            - this should be local not in cloud!
        - Recording quality: high quality, medium file size
        - Audio encoder: AAC
    - Select Audio on left
        - Enable push-to-mute if youu want
            - can set up hot keys so you can mute quickly if you're coughing or whatever
    - Select hotkeys on left
        - Most useful is probably pause / unpause
            - This is where you would set up the equivalent of push button to record 
            - can set it up so that spacebar starts recording
            - but I found when I had this set up, every time I had OBS open I kept inadvertently startong recordings without realising!
        - Split recording file
            - Allows you to stop recording in current file and start a new file, eg if you istake and want to do over
    - Select advanced on left
        - recording filename formatting is here
- Top tips
    - Clap hands or use dog clicker to make large noise that will be easy to find in the audio to go back and find a particular spot
- Recording
    - Scene
        - a screen is basically a screen layout
        - you get one by default - can rename to Desktop
        - hit plus button at bottom of Scenes pane - can call ClareCam to represent face on screen
        - Select a scene
            - Go to sources section, hit plus to add a source
            - Then select the source to change settings (might have to restart OBS if you changed other stuff previously)
            - Avoid echoes - see [below](<#avoid echoes>)
            - Select the right display
            - Check "Hide OBS from capture"
            - while the source is selected, hit Cmd + F to fit the capture to your screen
            - If you get black bars on left and right that's because the aspect ratio of your screen resolution does not match your target (eg 16:9)
            - you can drag things around to get rid of black bars - tradeoff is that you might lose the top or bottom of your screen to get rid of black bars on left or right
                - the red box is not the thing that will show up on the video
                - the green box is the same, just indicates you're not editing it any more
                - the area you can see if the area that will show up on video
            - Set up second scene
                - Source = Vdieo capture device
                - Cmd + F to fill screen
                - Hit lock icon on source to lock it
                - Drag things around as before
- Performance
    - Bottom right you can see CPU and FPS
    - you don't want FPS to go down 
    - Docks => Stats - select to toggle on 
    - Frames missed due to redenring lag will show in red
        - ideally you want that as close to 0 as poss
        - more of a concern for face than for code
        - To fix, change stuff 
            - settings (bottom right)
                - output on left - recording tab 
                    - change video encoder to x264
                        - ! This might reset your encoder settings at the bottom!
                    - change bitrate to 4000
                    - change profile to main
            - then hit OK then hit Reset button mid right
            - laptop system settings
                - display resolution - make smaller
- Set up audio to use correct mic input
    - Settings (bottom right) 
    - select Audio on left
    - under Mic / Auxiliary Audio (third dropdown), select your input
    - The first two dropdowns ("desktop audio") refer to the sound that comes from your system - eg sounds from apps - you probably want to set these to disabled    
- [Filter out](<#filter out background noise>) background noise, otherwise you'll prob get noise from mouse and keyboard

## Avoid echoes

- Disable sound source from "MacOS screen capture"
    - do this by selecting MacOS screen capture under sources (bottom half of screen)
    - then click the microphone icon on the right hand panel under "audio mixer", to mute
    - otherwise you get echoes if using Krisp microphone (see [below](<#filter out background noise>))
    
## Filter out background noise

- Try filters...
    - Audio Mixer section is in the middle of the bottom half of the screen
    - Click the three dots on right hand side of Mic/Aux
    - click filters
    - click "+" button bottom left, and add a Noise Suppression filter
    - If that doesn't do the job, try adding noise gate as well
    - !!!! You have to do it on ALL scenes (select them one by one bottom left)
        - !!!! ...and maybe on both Desktop Audio and macOS Screen Capture and Mic/Aux?
            - (you'll see different ones in the Audio Mixer, depending on which scene you have selected)
        - ...otherwise you get a weird ehoc for some scenes but not others
- ...but that didn't work for me to get rid of noise from mouse and keyboard
- ...so I installed Krisp, and that worked
    - Download installer: https://app.krisp.ai/setup
    - Install
    - When it insists you set up calendar, click through to Google calendar, but then just click Continue without selecting anything
    - After it's installed, even though it says it's made background changes, you have to actually run the Krisp software
        - !!! This is true every time you use it I think
        - You have to start up Krisp
        - You also have to configure it (on main startup screen) to use your preferred mic for sound input
    - then you can go into OBS => Settings => Audio => Mic/Auxiliary and select "krisp microphone"
        - You might have to do this every time you run OBS, and make sure Krisp is running (see above) and using correct input source
        - !!!! Initially for any scenes that shared my screen, I got echo on audio! See [above](<#avoid echoes>) for how to fix this.
    - To close Krisp down again, the only way I've found so far is via Activity Monitor and Force Quit! 
        - It can be quite intrusive and annoying but it does do the job.
- [More here](https://krisp.ai/blog/obs-remove-background-noise/)

