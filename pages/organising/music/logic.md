---
layout: page
location: pages/organising/music/leaf
permalink: /pages/organising/music/Logic
---

## Simple notes on getting started in Logic 

### Brand new song

- click on Logic Pro X on desktop
- nothing happens but you get new system bar at the top: use File | New

### Adding a new track 

- Main view - click the plus button, top left, to add new track 
- `Software instrument` is for sequencing
- `Audio` is to record new stuff using mic
- `Drummer` is clever drummer AI

### Sequencing notes

- Track | New Software instrument track is what you want
- Click Synthesizer bottom left to get you off sythesizer
- Most reliable instruments are in legacy | Logic
- It's very hit and miss
- good guitar: Legacy | Logic | World | Mexican Guitarron
- Select your track in main view, then click the dropdown in top menu bar and select pencil tool instead of pointer tool
- Then click in the main grid to create a new section for that track. 
    - You can drag it at the edge to make it bigger.
        - ! If you find it's repeating it instead of making it bigger, this is because you're clicing the pale green section at the top instead of the dark green section at the bottom. Basically, where you click before yuou drag changes the effect the drag has.
    - Double-click it to open the piano roll if it's not already open (or click the scissor icon, top left).
- To copy/paste to repeat it, use alt click and drag in main grid
- To add notes, in the piano roll view, switch to pencil tool, then use command + click to add notes.
- In the piano roll view, you can switch to pointer tool and select multiple notes to drag them around in the grid
- If you lose your piano roll, just double-click the section in the main grid to get it back again.
- To repeat a section, in the main view you can drag from the top right corner of the section and it will create repeating blocks
- You can also switch to pointer view in the main grid, select a bunch of stuff across tracks and then use alt drag to copy it elsewhere in the grid
- Tempo is number at top of window in blue. 
- To change instrument: Select a track in left panel, then library can be used to change instrument
- Repeat playback:
    - If you want to listen to one section repeatedly, drag the sections at the top of the main view, they will highlight in orange, then click the recycle button, top left main window.
- If you accidentally zoom in or out either horizontally or vertically (easily done iwth the wrong key combinations), you can fix it with the sliders top right in the piano roll.

### Playing back

There's this v annoying thing where if you move the playback marker (yellow vertical line - can be placed and dragged around just under the bar numbers at the top) and hit Play, although it will start playing there, when it stops it will go back to somewhere else entirely. The "somewhere else" seems to generally be at the beginning of whatever "cycle range" you have defined. To change this, click in the bar numbers and drag the beginning and the end of the resulting yellow strip - this will define the start and end of the default playback region.

### Drum tracks without sequencing individual notes:

- Create new track, select Drummer - it's an AI that will automate a drum sequence in the style you want
- You can select a drummer in the library
- Then in the drummer view,
    - change the presets on the left
    - Move the yellow dot around in the left panel
    - Click on drums / percussion to add things
    - Use the sliders on the right
    - Use the Fills knob to add more fills

### Drum tracks where you sequence individual notes:

- new track, software instrument, drum kit sounds like real drums, electronic drum kit doesn't

### Recording a new vocal

- Click + to add new track, select audio, click the R button, wait for it to flash red, then click the big red button at the top of the app.
- Click track:
    - There's a purple metronome icon at the top for a click track, and click the numbers to the left of the icon get a count in.
- Use the main vertical line indicator to show whereabouts in the track it will start recording.
- See [separate page](/pages/organising/music/Recording#recording-vocals-guitar-using-our-pa) on how to record vocals using our PA setup

### Working with samples

**Snipping / Copying / pasting:**

- You can copy a chunk from the middle of a sample by holding down command then clicking and dragging. Then use Cmd+C and Cmd+V to paste elsewhere.
- Markers should be useful for this, but although I worked out how to add them where you want them, I couldn't work out how to use them for editing usefulness. But anyway, you can add markers by... 
    - moving the playhead thumb to where you want it,
    - showing the global area (I think that's what it's called) by clicking the little blue arrow underneathe the blue waveform symbol,
    - right-clicking the area and ticking Marker
    - clicking the + symbo;l to the right of the word Marker
    - The markers then appear above the tracks
    - You can also view / edit them via View | Show List Editors and clicking MArker at the top.

**Using samples as your basic building blocks**

I really struggled at first with getting them to snap to grid, and I'm sure there are better ways of doing it, but I found the following helpful:

- Work out (via trial and error) what your tempo is, and change it at the top of the screen so that each bar is the same size as your sample building block.
- When you double-click on your sample track to get your sample editor, then select "track", you can select Snap to Bar or Snap to Samples, both of which are useful in different circumstances. You can fiddle around with other Snap setitngs here too.

### Distortion / FX

- You can distort a whole track by clicking in the region view to the left of the main view, then select a plugin in the Audio FX section on the left. 
    - Amps and pedals | pedal board are particularly good. 
        - Click Play before you add the effect, then you'll hear it be applied in real time.
- Fiddle around with the velocity in the piano roll to change how things sound.

### Bass / EQ

- To increase the bass, use the EQ button in the left panel. Felix uses Channel EQ - a plugin.
- Channel EQ:
    - drag regions around in the graph to change bass
    - There is a purple dot, a green dot and a yellow dot (and some other colours too) that you can click and drag around to change things.
    - Or you can click a dot, then it will create a region that you can expand or contract. Then drag the dot around to warp it.

## Printing / Saving a Score / Sheet Music (pdf)

- Double-click on a track to get it visible in the bottom half of the screen
- Click on Score to see the score / sheet music
- Scroll up to the top of the score and double-click the background (black strip at top) to get all tracks on one score
    - So far I haven't found a way of just selecting two tracks (eg right and left hand piano) to get them on one score
    - Instead, I saved a version of the project with just two tracks, then double-clicked the background to get them both on one score (but there must be a better way)
- File | Print to send to printer or save as PDF
    - If printing, click Show Details to select two-sided and other settings
    - If saving as pdf, click the down arrow next to PDF (bottom left) and select Save as PDF.

## Exporting / coverting to an audio file (wav, mp3)

- You can save individual tracks using File | Export | All tracks as audio files 
- If you want to save all tracks combined as one audio file:
    - First make sure you have all the tracks you care about selected in the main window (you can omit tracks you don't want)
    - Also make sure you have a loop cycle range defined (click the bar numbers at the top, and drag to create a yellow section that covers all the bars you want to export)
    - Now select File | Bounce | Project or Section
    - ! Make sure you pay attention to where the file is saved to! It might not default to where you think.
