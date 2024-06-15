---
layout: page
location: pages/organising/podcasts/leaf
permalink: /pages/organising/podcasts/Podcast-Editing
---

## Editing tools

- [My notes on Audacity](/pages/organising/podcasts/Audacity)
- Other useful tools:
    - [Temi](#create-a-transcript)
    - [Descript](/pages/organising/podcasts/Audacity)

## Recording

* See [here](/pages/organising/podcasts/Podcast-Recording)

## Interview editing steps

### Create a transcript

- Start with a recording that has both voices on at once
    - You get this by default with a Zoom recording
    - in [Squadcast](https://app.squadcast.fm/sessions), they're separate by default, but you can get both voices in one recording like this:
        - Click the down arrow to the right of your session (default is Reusable session)
        - Select the two you're interested in (using checkboxes on left)
        - Click Mix Recordings
- Upload the mixed recording to [Temi](https://www.temi.com/) (use the big button on the home page)
    - Create a transcript

### Create first pass of section headings

- First get a feel for the broad outline
    - SKIM the transcript
    - Quickly insert headings broadly describing each section - these will have descriptive titles rather than the T001, etc you'll be using later.
    - Use heading 2 (so it doesn't conflict with all the heading 3s you're going to use later on)
    - Keyboard shortcut in Word to create heading 2 is Ctrl + Alt + 2
    - Think about which sections you want to cut
        - This way you won't waste ages listening to those sections in detail - you can just ignore them from the start
        - You can use Ctrl + Alt + S in Word to strikethrough the sections you want to lose (In Google docs, it's Alt + Shift + 5).
        - It's also worth suffixing headings with y, n and m for Yes, No and Maybe to indicate whether sections will be kept or not.

### Make a note of timestamps

- Now start inserting timestamped labels in Audacity and Word
    - Have Audacity and the transcript open side by side
    - Do two passes:
        - On the first, just create an Audacity label + timestamp for each of your broad headings that you inserted before. 
            - Go all the way to the end of the process - ie calculate total timings in the spreadsheet. 
            - That way you can get a pretty good idea of what you want to keep / discard.
            - When you number the labels, leave gaps because you will be adding more granular labels later
            - For instance, T10, T20 etc (use your judgement re how big the gaps should be - leave bigger gaps than you think you'll need)
        - On the second, add more granular timestamps, but only in the sections you're keeping 
    - Whenever you reach a point that may mark the start or end of a clip, give it a label (I just give them labels like T002, T003)
        - In Audacity:
            - Use Ctrl + mouse wheel to zoom in/out - but only one scroll click at a time! Otherwise it goes haywire.
            - click X to pause the recording there (means it will resume at the same point, which it wouldn't if you used spacebar)
            - Ctrl + B to add a label
                - To remove a label: 
                - click in the label text
                - Home
                - Shift + end
                - Delete
                - Delete again
            - Alt left/right to move between labels
        - In Word:
            - Insert the Audacity label text at the correct place in the transcription text (create a new line)
            - Add a space, and then the timestamp 
                - Not in brackets
                - Include the hour even if the recording is not over an hour long (So 3m 21s would be 00:03:21)
                - Don't include fractions of seconds
            - Add a space, and "y" for keep (= yes) or "m" if you're not sure (= maybe), or "no" for don't keep (= no) (followed by strikethrough)
            - It should look like this (the formatting matters for the spreadsheet later on): `T020 00:03:21 y`
            - Ctrl + Alt + 3 to highlight the label using heading 3 (makes it easier to find later)
                - !! Watch out though! Somehow all my text ended up being in Heading mode, even though it looked "normal" - and I have no idea how it happened. It seemed to happen after I was using Outline mode. I think maybe it happened because I started editing when I was still in Outline mode? Anyway, keep an eye out for this. The quickest way to check whether it's happened is View => Navigation pane and check that all your label headings are appearing separately.
            - Ctrl + Alt + S to strikethrough passages you want cut from the recording
                - This is my custom shortcut for strikethrough in Microsoft Word - you can create your own [following these instructions](https://word.tips.net/T000418_Strikethrough_Shortcut_Key.html)
            - Ctrl + Shift + N to undo the heading style (goes back to "normal")
- Make sure you create one last label which marks the end of the recording.

### Use timestamps to calculate rough episode length(s)

- When you're done, transfer timestamps to a spreadsheet to get an idea of length:
    - In Word:
        - Click View => Outline
        - Make sure that "all levels" is selected from the "Show level" dropdown
        - Use Ctrl + Alt + Shift + S to bring up styles dialog
        - Click the dropdown next to Heading 3 and choose "Select All XX Instance(s)"
        - Ctrl + C to copy them all into clipboard
    - In Excel or Google sheets:
        - Have headings Label, Timestamp, Include? and duration
        - Format the duration column as a time (select col, Format => Number => Time)
        - Paste clipboard
        - Data => Split text to columns => choose Space
        - Now in the fourth column ("duration"), use the formula `=B3-B2` in the top non-heading cell, then drag down into all cells in this column (except the last, which should mark the end of the recording)
        - Now create min and max time totals (wherever you like), with the following formulas:
            - Min: `=SUMIF(C2:C300, "=y", D2:D300)`
            - Max: `=SUMIF(C2:C300, "=m", D2:D300)+[cell containing min total]`
            - (you'll have to format those cells as times too - Format => Number => Time)

### Audacity: Pull snippets / audiograms / teasers out into a new track

In Audacity...

- Use File => Import to load your wav or mp3 file into Audacity.
- Top tip before you start: Hold the Ctrl key down and use the scroll wheel on your mouse to zoom in on the waveform
    - But it's slow to react, so don't scroll quickly like you normally would
    - Instead, scroll ve-ery slowly - just one notch at a time - and wait for it to react after each notch
    - There are a few other useful Audacity tips [here](/pages/organising/podcasts/Audacity)
- Highlight the relevant section manually, or use start and end times:
    - Note start and end time
    - Place your cursor in the source track
    - Select "Start and end of selection" from the dropdown at the bottom
    - Enter start and end time
        - I do it like this:
        - Place cursor at the start of the snippet
        - Use Ctrl + B to add a bookmark at that point (labelled something like "B start")
        - Place cursor at the end of the snippet
        - Use Ctrl + B to add another bookmark at that point (labelled something like "B end")
        - Make a note of the time stamp (you can see it at the bottom, under "Start and end of selection")
        - Use Alt + left to move back to the previous bookmark
        - Now the timestamp of the first bookmark will be in both boxes under "Start and end of selection"
        - Edit the numbers in the second box (the end of the selection) to match the timestamp you just made a note of 
        - Now the selection will match the two bookmarks (it will be highlighted in white)
    - Press play (spacebar) to check it worked
- Use Ctrl + D to copy the selection out into a new track
- Do NOT use Effect => Truncate Silence to move the snippet back to the start of its new track
    - Instead, just zoom in and highlight the empty section before the snippet... and use Ctrl + X to delete it.
- Press Solo on the new snippet track
- File => Export => Export as mp3

## Removing background noise

- Descript has its "studio sound" option
- [Uniconverter](https://videoconverter.wondershare.net/) is another option
    - bit suspicious of this though - seems extremely spammy
- [Veed.io](https://www.veed.io/) is another
- [Audostudio](https://app.audostudio.com/)
- HitPaw 
- CapCut
- https://podcastpontifications.com/background-audio-remover/
- Adobe Podcast Enhance
- Audacity: Noise Gate and Noise Reduction