---
layout: page
location: pages/organising/podcasts/leaf
permalink: /pages/organising/podcasts/Rode-Mics
---

## Wireless GO II

Manual: https://rode.com/en/user-guides/wireless-go-ii

### Use with iphone 

- You either need SC15 or SC19 cable (SC19 is same but longer)
- or connect to AI micro using 3.5mm jack cable from Go receiver 
    - Use split jack cable (one jack one end, two jacks the other end) to split the signal into two channels, one for each input on the AI micro
    - or if using merged mode on receiver, can just use single jack cable and put it into just one of the AI micro inputs
    - but I had a bug where in split mode, receiver was only sending one channel
    - so I had to use merged mode (see below)
- then you can use any recording software
    - eg Rode Rporter
    - or Garage Band
    - because the receiver is just acting like any other microphone - it's just a hardware input into whichever recording software you choose to use

### Accessing recordings

- Your best bet is to connect the receiver to recording software
    - then capture the output live and record it yourself
    - see above for how to do this with iphone
    - or you could use a 3.5mm jack to attach it to a recording device
        - eg the Zoom h5
    - remember this whole setup is just a glorified microphone so you wouldn't expect it to record its own output - that's up to you to do
- Each individual transmitter has onboard recording
    - This is most useful as a backup though
    - because it won't be mixed or synced in any other way with the recording from the other mic
    - so if you want to combine the two you have to find your own way to sync them up
    - best thing to do is make a loud sharp noise (eg clap or click) at the start of the recording so you can easily sync the two parts up
- To access onboard recordings
    - have to attach transmitter to laptop using USB-C cable
    - then open Rode Central
    - select the transmitter on the left
    - click the settings icon
    - click the Export button
    - then delete from device, via separate dialog - click settings icon top right (I think - anyway it's in a separate dialog altogether, not in same place as recordings, and you have to delete all content all at once)

### Troubleshooting

- If both lights are solid blue on transmitter and you can't get it to work
    - Hold down power button for 60 seconds
- If receiver is not picking up a transmitter
    - Make sure it's not attached to the RODE Central Macbook app
- To delete recordings from transmitter
    - attach to Macbook RODE Central app
    - Click the settings cog
    - Click the delete button - will delete ALL recordings
- To pair initially
    - Hold down power button on transmitter for 3 secs and wait a few seconds
- To pair after initial pairing
    - Click pairing button on receiver to select a transmitter
    - Hold down pairing button for 3 secs on receiver
    - Click power button on transmitter briefly
- to configure recording mode and make sure recordings will be backed up on transmitter
    - attach transmitter to RODE Central app on Macbook
    - select the transmitter in the app
    - the settings cog will appear on the device listed on the left in the app - click this
    - there's a "Record" button you cna click on top at left - this will allow you to toggle recording modes
- to record
    - assuming you've used RODE Central app to configure "button" recording mode
    - click power button once on transmitter
    - receiver will indicate that the transmitter is recording
- If split mode doesn't work because yoou only get output from one mic
    - the only way you can get output fromr second mic is to use merged mode
    - try factory reset on all devices 
        - Rode Central on laptop
        - click the settings icon top right
        - choose factory reset
    - and then pair again by 
        - turning receiver on
        - holding power button for 3 seconds one by one on transmitters
    - !! This didn't actually work for me when I tried it!!

## Issues I had

- Lights staying solid blue and transmitter not working
- Lavalier mics not producing any oinput when attached to AI micro
- Receiver not working in split mode - only outputting one channel
- Not knowing how to merge backed up audio from individual transmitters
- Not knowing what cable to use when attaching receiver to iphone


