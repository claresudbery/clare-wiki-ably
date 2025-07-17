---
layout: page
location: pages/organising/music/leaf
permalink: /pages/organising/music/Garage-Band
---

## Where files are stores

- Home/Music/GarageBand

## Getting started

- New empty project - it gives you a bunch of anoying options, none of which look like what you want - select drum track.
- You'll get a "SoCal" track

## Sequencing notes - getting started

- Right-click in the left part of the "track pad" which is the main bit top right where your "SoCal" track is
    - the left part is where it says SoCal and has mute and headphone buttons
- Select "New Software Instrument Track"

## Sequencing notes - adding notes

- Start with [sequencing start](<#sequencing notes   getting started>)
- Right-click in the right hand section, where the wav form for the SoCal track is
- Select "Create MIDI region"
- Drag right hand edge to the right to fill more bars
    - If you drag from the middle of the right hand edge you just make a larger region
    - If you drag from the top, you create a repeat - so the first part will repeat the same
- Double click in your green midi region, or press P on the keyboard
    - this brings up the piano roll section at the bottom of the screen
- Hit the command key and click to add notes
- every time you add a note it will sound out loud, so keep clicking to find the note you want
- drag edges of notes to make them shorter / longer

## Getting an instrument that sounds like a voice

- Start with [getting started](<#getting started>)
- Then [sequencing start](<#sequencing notes   getting started>)
- Click the Library icon top left - looks a bit like a drawer in a filing cabinet
- Search for "choir" and select one of the options
- To change the instrument, just select the left hand end of the track, click library again, search for a new instrument and click on it / select it

## Merge tracks

- Select all the tracks (easiest way is to drag the mouse across them all, or select individual regions using shift + click)
- Cmd + J will turn them all into one track
- If you're doing this because you want all voices on one score, you probably want to copy them all into four (or however many) new tracks first

## Print score

- Double click on the track to show the piano roll at the bottom
- Click "Score" instead of "piano roll" at the top of the section
- If you want to print, you have to have the cursor in the score region (not piano roll) and then you can select file => Print
- If you want all tracks on one score, start by [merging all tracks into one](<#merge tracks>)
    - or use [special tool for scoring](<#special tool to create better scores>)
- If you want to control whether things live on bass or treble clef, all you can do is set the whole score to be either bass, treble, or a mix of both
    - Click on the clef on the left, and it gives you three options
    - General consensus on the internet seems to be that if you want more control over scores you shuld use a free piece of software called MuseScore - but I couldn't get this to work on my machine
    - So in the end I merged all tracks into one so th bar structure would be the sanme for each voice
    - Then I created four copies
    - in each copy, the voices I wasn't interested in were moved either really high or really low
    - so that for each one, the voice I was interested in would only appear on one clef
    - then printed them all out, literally cut out the clef I wanted, then pasted them all together and hand-wrote words underneath!
    - Might want to try using MPC Beats next time instead of Garage Band!
- To print to a file instead of printer
    - Click pdf, bottom left in the print dialog

### Convert from GarageBand to midi for converting into a scoring tool

- !! None of the tools listed below do a great job of converting to midi, and Sibelius will only show you actual music score
    - you can't see the music as piano roll
    - so it's hard to tell how accurate your midi file is, if you've done a conversion
    - ...so I found it was actually LESS trouble to do the faffy version with printing and literal cut/paste described above
- With a SINGLE-NOTE track (won't work so well with harmonies / polyphonic)
- Highlight the region / regions you want to export
    - This is easier with all midi regions in one single-note track merged into one region
    - easiest way to do this is to copy/paste all regions into a new track, then while it's still highlighted, hit Cmd + J to merge all regions into one
    - !But remember to change the instrument of the track to something like steinway piano!
    - !Also be aware that it doesn't seem capable of overwriting existing files! It'll ask you if you want to replace the existing file but then the file itself won't actually change
        - Even if you delete the original file and create a new one iwth the same name, it still seems to end up with the same content!
        - AHmm ok I thnk the issue here is iwth the MacBook Music app - even when you reopen it, it does this. Like it's  caching a prev version of the same file?
    - !Listen back to the result to check it's done what you expected!
- Garageband => Share => Export song to disk => MP3
    - ! Don't forget to check the check box "Export cycle area..."
- Import mp3 file onto this tool in the browser: https://basicpitch.spotify.com/
    - Or this one: https://evano.com/audio/mp3-to-mid-online-converter
    - Or this one: https://larkob.github.io/GB2MIDI/index.html
- Find the converted midi file and import into [Sibelius](https://www.avid.com/sibelius)
    - or whichever specialised score tool you want to use

### Special tool to create better scores

- ! Sibelius ONLY shows you score view - you can't get piano roll view
- you might first need to [convert to midi](<#convert from garageband to midi for converting into a scoring tool>)
- [Sibelius](https://www.avid.com/sibelius)

## Export to a music file

- Share => Export song to disk