---
layout: page
location: pages/organising/podcasts/leaf
permalink: /pages/organising/podcasts/Audacity
---


## Tutorials / Guides / Help

- [Audacity wiki](https://wiki.audacityteam.org/w/index.php?title=Special%3ASearch&search=podcast&fulltext=1)
- Detailed [Tutorial for using Audacity to edit podcasts](https://www.buzzsprout.com/blog/audacity-podcast-tutorial)
    - Much more detailed
    - Things in that article that require more explanation:
        - **Time Shift tool**: the button on the tool bar that's a double-headed arrow - also available by pressing F5
- High-level [Tutorial for using Audacity to edit podcasts](https://podcasts.ceu.edu/how-edit-your-podcast-audacity-step-step-guide)
    - Very high level
    - Things in that article that require more explanation:
        - **Creating a new blank track**: Tracks => Add new

## Useful actions

### Actions useful for podcast editing

- See [the podcast editing page](/pages/organising/podcasts/Podcast-Editing).

### Time Shift tool

- Allows you to move clips around - will remove space between clips
- The button on the tool bar that's a double-headed arrow - also available by pressing F5

### Creating a new blank track

- Tracks => Add new

### Adding markers / labels

- Ctrl + B
    - You can label either sections or points in time, depending on whether you've selected a selection or not
    - Labels will appear in their own separate track
- To remove a label: 
    - click in the label text
    - Home
    - Shift + end
    - Delete
    - Delete again

### Zooming in and out

- Zoom tool
    - Click the magnifying glass cursor next to the time shift and selection tools
    - Then click the area you want to zoom - each click zooms you in
        - left click zooms in
        - right click zooms out
        - (it can be slow to respond - so do one click, then wait for a reponse, then another click))
- Ctrl key + mouse wheel
    - !! Watch out! Everything can  disappear or go weird if you don't act carefully
    - (I think this is because when dealing with large files, it's slow to respond - so you overdo an action because you don't see a response)
    - Start by placing the cursor to the left of the area you want to zoom in on
    - Move the mouse wheel very slowly, one click at a time

### Navigating

- [More detail here](https://manual.audacityteam.org/man/navigation_tips.html)
- There's a very faint horizontal scroll bar at the bottom - easy to miss
- You can use the home and end keys to go to start and end of track
- You can use left/right keys to move left and right 
    - the granularity of this can be set up in Edit => Preferences => Playback
    - you want to change the "seek period"
- Alt + left/right moves you between labels
- You can use the selection toolbar at the bottom to go to a particular time stamp
    - Ctrl + F6 takes focus here
        - use tab to move between controls
        - use left/right to move to the value you want to change, then just type
    - !! Watch out! The "Audio position" box doesn't do what you think - even though it seems editable, it's actually for display only
        - If you want to change your position, use "Start and end of selection"
        - If you just want to go to a particular point, set Start and End to the same point or use Start and Length and set length to 0

### Using copy/paste when naming files in Audacity on Macbook

- For some reason I can't use Cmd+C and Cmd+V when naming files in the Export and Save dialogs on the Macbook, but there is a simple workaround: Use right-click => Copy and then right-click => Paste.
- I found others complaining about this on the internet, bit the right-click solution was the only suggestion that worked for me.

## Other Audacity Tips

### Removing pops

- Zoom in (Ctrl + scroll - SLOWLY)
- Highlight the pop (you'll see it stand out)
- Effect => Graphic EQ (or "Equalisation" on other versions of Audacity)
    - Manage => Factory Presets => 100Hz rumble
    - You might have to repeat the same effect several times - you can do this with Ctrl + R

### Removing background noise

- Select a silent bit that's nothing but background noise
- Effects => Noise reduction (or noise removal in older versions)
- Click Get noise profile
- Go back and click the entire selection you want noise removed from
- Effects => Noise reduction again 
- this time you can click OK and it will reduce noise based on profile it collected previously
- More [here](https://filmstro.com/blog/how-to-remove-background-noise-in-audacity)

### Looping 

- During playback:
    - Use Shift + space instead of just space
- For export:
    - Select the bit you want to repeat
    - Effect => Repeat

### Pasting a chunk of audio without shifting other things out of the way

- Apparently it's not recommended, but...
- If you really want to overwite existing content, do it like this:
- Edit > Preferences > Tracks > Tracks Behaviors > Editing a clip can move other clips (turn that off)

### Replacing some content with silence

- Select the content you want to replace
- Edit => Remove Special => Silence Audio

### Inserting silence

- Edit > Preferences > Tracks > Tracks Behaviors > Editing a clip can move other clips
- Generate => Silence

## Record music from internet into Spotify

From Duck:

[How to Record Streaming Audio with Audacity - Windows & Mac](https://www.appgeeker.com/capture/record-streaming-audio-audacity.html)  
- You have to install the Sunflower thing to get decent quality
- You have to hold down control key while clicking - otherwise go to Macbook settings and find Privacy & Security and scroll down to the bottom to see what needs approving.
- Then you have to set computer output (in macbook settings) AND Audacity input to be Sunflower 2ch
  
then, yes, you can add local files to your Spotify library. It varies depending on platform again, but:  
  
[Local files - Spotify](https://support.spotify.com/uk/article/local-files/)

- The "local files" thing is set up as a PLAYLIST called "local files" - that's not obvious!