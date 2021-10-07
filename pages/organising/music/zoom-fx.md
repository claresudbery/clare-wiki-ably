---
layout: page
location: pages/organising/music/leaf
permalink: /pages/organising/music/Zoom-FX
---

## Interesting sounds and effects I have made / found

- See separate page

## When sound isn't coming through either from mic or FX

- Check all settings on mixer
- Check input and output dials on Zoom
- Check you're in the correct mode in Zoom
    - Either manual (making your own fx) or memory (using presets)
    - To switch mode, click the higher black button to the left of the digital display - if the light is on, you're on manual
    - If in memory mode, you also need to have the Bank button the left on the correct setting
- Try clicking the Bank button on the left in Zoom
- Check input and output settings in your recording software
    - Also check levels
    - Remember in Audacity, if you've unplugged any input or output, you have to restart Audacity before it'll pick it up again
- Check your headphones are plugged into the correct socket for what you want
- Check your input cable is plugged into teh back of Zoom (if you want input from something other than mic)
- Check mic is plugged into Zoom
- Check mic is turned on (Note that my Shure XLR mic has no on switch - it's just on by default)
- Check you don't have Mix set all the way to Wet but Effects turned off.
- Check Troubleshooting section in Zoom manual (I have photos of this, in case it gets lost)

## Inputs

- There's the main mic input on the front
- But there's also two inputs round the back
    - These will get added to the main mic input, but how that works varies
    - For instance they are somehow used to make the vocoder function work (eg presets 51 and 52)
    - But they also work as extra inputs for some effects, eg preset 58
    - But sometimes they seem to be ignored altogether?
    - I had some luck playing instruments [sequenced through Logic](/pages/organising/music/Logic#sequencing-notes) on a laptop, and then using the headphones socket from the laptop (with a conversin jack and a guitar lead) to turn that into a Zoom input.
- Note that if the Mix dial is set all the way up to Wet..  
    - ... this means that if you turn Effects off, you will hear no input.

## Effects stored in memory

- When you switch to memory mode (click top black button to left of digital display), you can use the up / down buttons to select a preset
    - you can speed this up via a slightly counter-intuitive process:
    - if you want to go down quickly to a lower number, click the down key and then hold down the up key: the process of going down will speed up. 
        - Do the opposite if you want to go up quickly.
    - sometimes it will look like a decimal number - eg "5.6" rather than "56"
        - what's actually happening here is that the "bank" light is on. When it's on, it means that this stored setting came from an effect in Bank A. When off, it's Bank B.
        - if you want to know exactly what settings were used to create this stored effect, the only way to do it is 
            - look at the factory presets (if that's what it is, but there's no easy way to know if it's been overridden) but that will only tell you SOME of the settings
            - select the stored setting and then change all the storable settings (effect, pattern, edit 1 and 2, low and high EQ, mix level) one by one. When you reach the stored setting, the category light to the right of the digital display will flash.
- Factory presets can be overridden
- If you want to restore some or all of them, check p22 in the manual
- To override a factory preset, either 
    - create an effect in manual mode, then click the Store button, select a number and click Store again (or Cancel)
        - Note that this will switch you to memoty mode
    - or select an already-existing effect from memory, make changes to the dials (effect, pattern, edit 1 and 2, low and high EQ, mix level) click Store, select a number (can be existing number or separate number), click Store again (or cancel)
        - if you select whatever setting was already stored in memory, the category light to the right of the digital display will flash.
        - you can tell when you've made changes to a stored effect, because a little dot lights up next to "edit", in the bottom right of the digital display
        - you can make changes to a stored effect without saving those changes - they'll only be saved if you click Store, select an umber and then click Store again.
- When in memory mode, all the edit dials (effect, pattern, edit 1 and 2, low and high EQ, mix level) are not operating at the levels they look like they are
    - But if you change them during memory mode, the changed settings will be paplied to the current effect
- When in memory mode, the following settings still have an effect:
    - input level, output level, effects on/off