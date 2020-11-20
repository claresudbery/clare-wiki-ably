---
layout: page
location: pages/think/agile-princ/leaf
permalink: /pages/think/agile-princ/Remote-Working-Tools-And-Tips
---

## Elsewhere

I have other pages in this wiki that follow similar themes and also contain useful content: [Remote Workshops](/pages/think/events/workshops/Remote-Workshops), and [Remote Working](/pages/think/agile-princ/Remote-Working).

## Intro
This was originally put together as an internal doc by my @ThoughtWorks colleagues (thank you), but I've removed all the ThoughtWorks-specific stuff to make it useful for a wider audience.

**Note:** many of the tools on this list operate on a free/freemium
model. Where your organisation doesn’t have an official relationship with the
vendor, you should be wary of storing any information that could be
considered even remotely sensitive. As a rule, for any data you store in
tools you don’t have licenses for:

  - don't treat it as secure

  - back it up, at least with a screenshot

  - delete it when you are done

## Meetings/Workshops

### Retro/Workshop Tools

  - [funretro.io](https://funretro.io/)

  - [Ideaboardz](http://ideaboardz.com/)

  - [Storiesonboard.com](http://storiesonboard.com)
    for user story boards and release planning. Not sure how secure it is. For fee product.

  - ~~[Miro (used to be realtimeboard)](https://miro.com/)
    — “we've enjoyed realtimeboard because it's rather more free-form,
    easier to do things like scribble circles around groups of
    stickies and similar.”  

  - [Mural](https://mural.co/) — “We're
    moving away from Real Time Board due to some security concerns - and we're using Mural.ly instead - license needed”

  - Google Docs/Sheets (“We also tried Google Draw and it was too
    clunky to be useful really”)

  - Online warm-ups and energisers:
    [https://blog.mural.co/online-warm-ups-energizers](https://blog.mural.co/online-warm-ups-energizers)

### Diagramming

  - Zoom lets you draw on shared screens for quick collaboration

  - Sharing Omnigraffle has worked for remote whiteboarding (it’s not
    collaborative though)

  - You should be able to collaborate on text-based diagrams -
    PlantUML, graphviz, and similar - using code-sharing tools.

## Tools

See [here](/pages/think/events/workshops/Remote-Workshops#tools-others-have-recommended).

## A/V

### Accessibility

  - Don’t allow more than one person to talk at once

  - Encourage people to screen share and use diagrams, charts,
    documents etc to back up what they are saying.

  - Ask people to send links to supporting materials (diagrams, docs,
    etc) in advance of the meeting and then refer to them during the
    call.

  - [Ava](https://www.ava.me/),
    [Google Docs
    text-to-speech](https://support.google.com/docs/answer/4492226?hl=en)
    for doing text-to-speech in real-time,
    [Zoom closed
    captioning](https://support.zoom.us/hc/en-us/articles/207279736-Getting-Started-with-Closed-Captioning)
    for inputting text, [Zoom recording
    transcription](https://support.zoom.us/hc/en-us/articles/115004794983-Automatically-Transcribe-Cloud-Recordings-)
    
      - “So far, google voice notes isn't ideal as it requires spoken
        punctuation breaks”
    
      - “Ava and Zoom captioning/transcripts tech isn't super useful
        for me, I find it’s so wrong it’s misleading and confusing.”

  - Take minutes for meetings (using a Google Doc means it can be
    real-time and people can follow along)

### Audio

Universally agreed that good headsets are a must. “I think having a boom
mic is quite critical - no amount of smart technology can quite compare
with just putting a small microphone quite close to your mouth”

  - [Jabra UC Voice 550
    Duo](https://www.amazon.co.uk/gp/product/B005NPHQ04/ref=oh_aui_search_asin_title?ie=UTF8&psc=1)

  - Gaming headsets have been recommended e.g.
    [HyperX
    HX-HSCS-BK/EM](https://www.amazon.co.uk/HyperX-HX-HSCS-BK-EM-Stinger-Headset/dp/B01LRX2DSA/)
    
      - “I saw that some of the gaming headsets had really good
        physical mute options- swivel to mute, or raising the mic to
        mute - that seems so much easier than a button to toggle -
        you're very clear when it's mute and when it's not”

  - [Jabra
    speakers](https://www.jabra.co.uk/business/speakerphones/jabra-speak-series) — good
    for when some team members are clustered around the same laptop,
    but only when you’re in a quiet room

  - Karaoke style mic
    
      - If the "main" (in office) group is going to not be on separate
        mics (preferred, I feel) then I highly suggest a high quality
        karaoke-style mic. The suggestion has ALWAYS been laughed off
        whenever I bring it up in other projects, but it works. When I
        was abroad the offshore clients would complain
        endlessly about sound quality. We bought a good Samson mic and
        it was night and day difference. Also, because only one person
        can speak into it at any one time, you don't have that
        situation where the remote person can't hear a thing because
        the speaker is far from the mic. If you aren't holding it, you
        don't get to speak, simple.
    
      - If facilitating a workshop or Inception, consider using
        two Karaoke mics. One for
        whoever is leading the session and the other for asking or
        answering questions. This will speed up Q\&A sessions also.
        One mic for questions while the other is for answers. While
        the question is being asked, the other mic can be moved to who
        is answering the question.

  - [krisp.ai](https://krisp.ai/) — Some
    reported installing this improved sound quality, but someone else
    found they experienced a lot of cut-outs when they did and had to
    revert

  - Push-to-talk in Zoom

  ![Audio settings](/resources/images/audio-settings.png)

### Pairing

  - Slack and Zoom have good screen sharing capabilities and allow
    others to control/draw on your screen

  - For remote pairing in a terminal environment,
    [tmux](https://github.com/tmux/tmux/)
    can be used to allow two or more people to connect to the same
    session.
    [tmate](https://github.com/tmate-io/tmate)
    helps with the setup of this.

  - Visual Studio LiveShare
    ([https://www.thoughtworks.com/radar/tools/visual-studio-live-share](https://www.thoughtworks.com/radar/tools/visual-studio-live-share))
    reduces typing lag. I found it much faster than typing on an IDE
    shared via Slack or Zoom.

#### Pair Stairs

  - Use Pair Stairs to keep track of who has paired with who. In the below example, we were working remotely across three geographical areas, and we wanted to encourage people to pair across areas - so we used the colour coding for that (I've changed the names to protect privacy):

  ![Pair Stairs](/resources/images/pair-stairs.png)

### Dealing with problems

  - Be aware that people will just put up with remote communication
    problems when they shouldn't, so anticipate that and be deliberate
    and proactive about addressing issues with hardware, software and
    connectivity. Put time aside to triage any problems as a matter of
    urgency and be prepared to be quite pushy about demanding
    investment and support in decent tools to facilitate remote
    meetings.

  - Do a dress rehearsal before the workshop. Find and solve problems
    before showtime.

  - “One thing I've tried to do on some projects - have a well
    understood alternative comms channel. Ask everyone to open the
    "chat" window in Zoom, or the team Slack channel, or similar - so
    at least people with bad comms can type out questions.”

## Culture

  - If even one person is remote, everyone should be remote (use
    headsets, even be in separate rooms)

  - Invest in building relationships with remote team members
    
      - Make sure that the team meets regularly in person
    
      - Try and also meet in person when new people join/at the start
        of the project
    
      - ‘Water-cooler’ conversations have to happen intentionally. You
        could e.g. have a rule where the first ten minutes of every
        meeting is officially set aside for non-meeting-related chat
    
      - Check in and out in your team chat when you arrive/leave work

  - Where a significant part of the team is co-located, or there are
    multiple teams in different locations, you could try having big
    TVs set up by the team(s) with webcams and mics. This allows you
    to see the other groups of people working, and if you have an
    impromptu question you can walk up and use the mic to get the
    other location's attention.

  - “Coffee and cake”: Every week, a different set of pairs are
    assigned a coffee-and-cake pairing, which means they must find
    half an hour during their week to set up a remote meeting with
    each other and just shoot the breeze (chat). Ideally with actual
    coffee and cake\! You can set up a spreadsheet in the same way as
    [Pair Stairs](#pair-stairs):
    
      - ![Pair stairs](/resources/images/pair-stairs-cake.png) 

  - 18f's remote-first principles:
    [https://18f.gsa.gov/2015/10/15/best-practices-for-distributed-teams/](https://18f.gsa.gov/2015/10/15/best-practices-for-distributed-teams/)

  - Google’s distributed work playbooks:
    [http://services.google.com/fh/files/blogs/distributedworkplaybooks.pdf](http://services.google.com/fh/files/blogs/distributedworkplaybooks.pdf)

## Security and longevity

Many of these tools are free to use, or have a free tier for limited
usage - this is very appealing for ad-hoc tool use, but can involve
risks as without a commercial agreement, you often have little control
over the product - how secure it is, what the licensing agreement signs
you up for, what changes might happen in the product or the licensing.

Also, as collaboration tools, it’s often easy for people doing the
collaboration to forget that they are using an externally hosted and
managed tool, and post risky content - client privileged information,
for example, or even worse, use them to share security credentials.

  - It’s worth clearly communicating with all users:
    
      - The tool may be insecure - Don’t share passwords\! Don’t share
        client confidential information - even sharing an architecture
        diagram might be risky
    
      - The tool may have deliberately insecure setups - such as
        Realtimeboard’s default “share to anyone without a login URL”
        - don’t use these if you can possibly avoid them\!
    
      - The tool may not be around forever - license policies change,
        small companies go under or pivot or get bought.

  - Make sure whatever you create gets backed up regularly - even via
    screenshots if that’s the only option - to somewhere secure

  - Delete your boards/retros/diagrams when you are done. It’s easy to
    forget and leave client information strewn across multiple
    services.

## Remote Meeting Fatigue Breakers:

This blog has a collection of cool ideas for the remote meeting fatigue
breakers ie icebreakers, energisers.

[https://blog.mural.co/online-warm-ups-energizers](https://blog.mural.co/online-warm-ups-energizers)

## Articles

- [The Five Levels of Remote Work — and why you’re probably at Level 2](https://medium.com/swlh/the-five-levels-of-remote-work-and-why-youre-probably-at-level-2-ccaf05a25b9c)
- [Why Zoom calls are exhausting](https://www.fastcompany.com/90502253/why-you-feel-exhausted-from-endless-zoom-calls)