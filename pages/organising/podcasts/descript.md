---
layout: page
location: pages/organising/podcasts/leaf
permalink: /pages/organising/podcasts/Descript
---

## Overview

Allows you to edit a transcript and then apply the changes to the audio / video

## Recommendations

"I was interviewing a new guest yesterday and she told me about a tool she uses which sounds fascinating and I thought I'd tell you about it in case you'd like to try it out and see if you can make use of it.

This was Aino Vonge Corry, who does a lot of writing, and the way she does it is by transcribing audio files - I think she must use something like a dictaphone.

Anyway, she told me about a site called descript.com (https://www.descript.com/). The way it works is that you give it an audio recording, and like the service I use, temi.com, it converts it into a transcript. But this goes one step further: If you then edit the transcript, it will apply your edits back onto the actual audio file! So if you cross out a bunch of text, it will remove that section of audio for you."

Ted Young also swears by it for video editing.

## Finding projects that have been shared with you

- Go Home
- click Projects on the left
- Click Shared With me near the top of the screen

## Downloading transcript

- Click the Publish button, top right
- A little popup window appears, top right
- At the top of that window, click Export
- Click Transcript at the top
- Select settings
- click Export at the bottom

## Copying clip into new project

- Select text
- Right click: Duplicate into new composition
- !! The new project will then be nested under the parent one and will NOT be visible in the main project window. you have to open the original and then there will be a path a t the top - click on the final file name and you'll get a down error allowing you to select other compositions in this project

## Cutting content using the waveform at the bottom

- Click the "Range" button, which looks like an old fashioned magnetic tape
- Then click and drag WITHIN THE WAVEFORM ITSELF to select a bit of wav
- Then click Delete to delete. 

## Inserting subtitles for transcript on video

- ! It's better to add images first! Otherwise the images will land on top of the captions and you'll hve to keep changing layer order to get captions back on top again!
- They're called "captions"
- Click Captions in the right-hand sidebar
- Apply to either "All scenes" or "this scene" at the top
- Select the style you like
  - I prefer "classic"
  - Don't click the button in the very middle of the style - that just opens a preview and doesn't actually select it
  - ! It's not obvious when you've selected a style. Nothing changes on the right-hand side, and it'll keep scrolling back up to the top
    - ...but it should say "applying captions"
    - ...and it will be added to the main screen in the middle (after a short delay)
  - If you select a style more than once, you'll end up with several captions on top of each other
  - ...and most infuriatingly of all, in order to delete what you've added you'll have to delete them all on each individual scene
    - a better approach is to use Cmd + Z / Ctrl + Z to undo
    - you'll probably have to undo several steps, but a little thing will pop up in the middle of the screen to say what you're undoing
    - there'll be a lot of odd things to do with the color of stuff, but you'll be abnle to see the subtitles gradually disappearing
- Change the size and position of the caption 
  - It seems like by default, changes you make only get made on whatever scene is selected
  - So you have to click the three dots on the right and check the "Size and position" section 
  - Then click All scenes at the top
  - Or maybe just select "all scenes" under the image while you're manually dragging the size / position of the subtitles?
    - This doesn't seem to work though, I think you have to do it on the right instead
  - Then copy the values you like into the "Size and position" section 
  - I like these settings:
    - Landscape: X: 1935, Y:1873, W: 3522, H: 282
    - Portrait: X: 1080, Y:3024, W: 1476, H: 159
    - Sometimes it keeps changing the width back again every time you change the height 
      - If that happens, click the button that looks a bit like a link icon - a kind of broken oval shape
      - You want it NOT to be highlighted - ie turned off
    - Otherwise...
      - Change the size to fill more of the screen (not all the way to the egdes)
      - Change the position so it's not too close to the bottom
      - Change the height so there's only one line of text at a time
  - Check that it's worked, by clicking on different scenes in the middle of text and playing it a little
    - All scenes should have the same size / position of subtitle
- Save in Descript:
  - Click Publish, top right
  - Make sure Publish is selected at the top (rather than Export)
  - Click Update

## Remove ums and ers and ahs 

- Click Underlord
- Choose or type "remove filler words"

## Get scene rail back (on left) when it disappears

- View => Move Canvas will move canvas to top of screen but will also bring scene rail back if it has disappeared.
- View => Move Canvas again will move canvas back to right hand side.

## Add images

- You can highlight a portion of the transcript and choose "Add Layer"
- You can highlight a portion of the transcript and choose "Ask Underlord"
- You can select the whole transcript using Cmd + A and then cick Add Layer, but it seems to add it nly to the current scene. Then you can select the image and use Cmd + C and Cmd + V to copy to other scenes.
- You can right-click on the image and choose Layer Order => Send backward to get captions back on top.
- You can drag and drop image files onto scenes, but sometimes this doesn't work and I don't know why.

## Add scenes

- Place cursor where you want it
- Press forward slash on the keyboard

## Insert new audio files

- [add a scene](#add-scenes)
- Place your cursor just after the slash in the trsnacript
- You should see an Add File button in the transcript - use that to choose an audio file

## Loudness / LUFS

- To edit loudness:
- Click Projects on the right
- Select the audio file you're interested in
  - I found not audio files appeared, but when I clicked into the transcript of the audio I was interested in, it appeared on the right
- Click the three dots to the right
- Select loudness => normalize audio => loudness
- To change the LUFS number, go Publish => Export => Audio => Normalize volume

## Scratch

Hi, I have two questions. The first is, why does my recording still have lots of "er"s in it despite removing filler words? It seems like the app can detect they are filler words because they are greyed out inn the waveform.
The second question is, this is a good example of when I want to use the waveform to identify chunks of audio to remove, instead of using the transcript. How do I do this? In the screenshot you'll see the transcript says "But I met this young guy" but the wave form has some grey areas where the it just says "...". In fact when you listen to the audio you can very clearly here "Er, but I met this, er, young guy". I want to remove those greyed-out sections by deleting them from the wav file. But every time I try to click and drag to select a part of the waveform, things behave really weirdly and I don't get the behaviour I want. How do I highlight a section of the waveform and delete it?

h