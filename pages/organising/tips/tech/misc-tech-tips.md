---
layout: page
categories: organising 
location: "pages/organising/tips/tech/leaf"
permalink: /pages/organising/tips/tech/Misc-Tech-Tips
---

## See also

- [Big-Index-Useful-Tools](/pages/organising/bigindex/Big-Index-Useful-Tools)
- [Tech_tips tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=7ae17d68-c956-43fd-841f-a3daba3b85ef&query=tag%1FTech_tips%1FtagGuid%3A08037cff-5a39-2ec3-a52c-2eb07865f253%1Eview%3AVIEW%2FALL_NOTES&)
- [Useful tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=7ae17d68-c956-43fd-841f-a3daba3b85ef&query=tag%1FUseful%1FtagGuid%3A445d553a-0d3d-80ce-5f4e-641a12368bae%1Eview%3AVIEW%2FALL_NOTES&)
- [shortcuts tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=ba3426a1-35e2-47d5-888d-445432271c8c&query=tag%1Fshortcuts%1FtagGuid%3A830603fb-b0ba-403f-9177-3e3ae2b8a9a0%1Eview%3AVIEW%2FALL_NOTES&)
 
## Chrome

### Refresh your cache

- [Refresh your cache - When hitting F5 just isn't enough!](http://refreshyourcache.com/en/cache/)

### Searching Bookmarks and History

- Add Bookmarks and History as separate "search engines"
    - Settings | Manage Search Engines | Add Search Engine
    - Give them a single-letter keyword each
    - Bookmarks: chrome://bookmarks/?#q=%s
    - History: chrome://history/?#q=%s
- Now you can access those from the omnibox
    - The omnibox is the browser search bar
    - On Windows: Ctrl + L
    - On Mac: Cmd(splat) + L
    - Then enter the keyword (configured abnove - I'm using b for bookmarks and h for history) and hit Tab
    - Note that on Mac Catalina I'm finding that any search term you enter directly will get crappy results, so I just enter a random character and then tab inyo the actual search text box

## Gmail / Google Calendar

- Add bullet list: Cmd + Shift + 8
  - Indent a sub item: Ctrl + ] to indent right, Ctrl + [ to indent left
- [Other gmail shortcuts](https://blog.hubspot.com/sales/gmail-keyboard-shortcuts)
- [Stop receiving notifications when people respond to invitations, etc](https://xfanatical.com/blog/how-to-turn-off-the-rsvp-responses-from-google-calendar/#:~:text=In%20the%20left%20panel%20%3E%20Settings,select%20None%20for%20this%20entry.) - note that this is set in the settings for each individual calendar, NOT in the general Google Calendar settings - that's why it's so hard to find!
- [Accept calendar invites that are sent to non-Gmail email addresses, so that the event will appear in an already-existing Google calendar](https://support.google.com/calendar/thread/112993141?hl=en/how-do-i-accept-calendar-invite-sent-to-non-gmail-address-so-event-appears-in-calendar-for-gmail-a-c/how-do-i-accept-calendar-invite-sent-to-non-gmail-address-so-event-appears-in-calendar-for-gmail-a-c#)

## Hangouts

- To avoid playing whackamole with the infuriating toolbar at the bottom...
  - To mute/unmute yourself: Cmd + D (Ctrl + D in Windows)
  - To toggle video: Cmd + E (Ctrl + E in Windows)

## Slack

### Useful Slack shortcuts

- [More here](https://slack.com/intl/en-gb/help/articles/201374536-Slack-keyboard-shortcuts#mac-1)
- Cmd k \[channel name or person name\] to open new channel or direct conversation – eg `Cmd + k +
    nagiosdeploy`
  - Ctrl + K on Windows
- Cmd + Shift + \\ - emoji reactions to someone’s post
- :\[emoji name\] – emojis embedded in posts
- \`\[code\]\` (ie text encased by back ticks) - code
- Cmd + [ - go back to last channel / DM visited
- Cmd + ] - go forward again
  - On Windows: Alt + <- or ->
- Cmd + Shift + T: Open the threads view
- Cmd + Shift + M: Show "activity" / mentions - ie times when you've been @ed (also accessed via @ symbol top right)

### Searching slack

  - If you want to search for a term in a particular channel: in the
    search box (top right):
    
      - Like this: **roadmap in:observability-priv**
    
      - Actually it’s this: **roadmap in:\#observability-priv**
    
      - ...but the hash symbol gets inserted for you if you forget it.

### Scheduling Slack Messages

- I seem to have installed [this](https://slackscheduler.com/blogs/slack-scheduler-blog/how-to-send-a-slack-message-at-a-specific-time), but I think it's a free trial that only lasts 7 days?
- [This](https://slack.com/intl/en-gb/slack-tips/schedule-messages-in-the-future) looks worth looking at.

### Other Slack Stuff

- Common:
  - Cmd: ?command --help - Will give you the options for whatever command is
  - Cmd: ?++ @person - Give thing (ie person) a karma point
  - Cmd: ?m++ @person1 @person2 @person3 Give a point to multiple people
  - Cmd: ?pipe randcase 3 @alex | m++ - effectively give Alex three pluses -   - see section on pipe below
  - Cmd: ?pluses @ClareSuds Find out how many pluses Clare has
  - Cmd: ?pluspref donate From now on, instead of giving brand new karma points,   - when you use ?++ you will be donating one of YOUR points instead.
    - Cmd: ?learn thing otherthing - learn that when ?thing is entered, the response   - should be otherthing.
  - Note that new commands just get added to a list, which is randomly selected   - from when you use the command
  - If you use ?learn on a user name, you need to include the @, like this: ?learn   - @user-name
  - If you want to check the results, in Eritrea it’s ?@user-name, but in   - giftcrabs it’s gimme @user-name
  - Commands I have added:
    - Cmd ?celebrate tons of appropriate emojis
  - Cmd: ?list thing - will tell you what responses have been programmed to thing
  - Cmd: ?list thing -1 just shows you the most recently added thing
  - Cmd: ?whois @ClareSuds - gives you a whole load of useful info about the   - specified user.
  - Cmd: ?weather - gives you the weather
  - Cmd: ?help weather - gives you any help that exists about the specified irccat   - command (note - there might not be any help configured)
  - Cmd: ?ask - Pulls first result from yahoo answers
  - Cmd: ?dig [service url]
  - Cmd: ?spongecase some text - spongecases the text - but will be posted to the   - main channel, so if you’re in a thread you won’t see it!
  - Cmd: ?emojispell some text - spells the text using emojis
  - Cmd ?summon at_least_one_keyword: Gives you an image result or link for   - at_least_one_keyword
  - Cmd ?jira OBSERVE-2222 will show link to Jira ticket
  - Cmd ?jiracreate 
    - Cmd ?jiracomment PROJ-123 The comment to add to the ticket
  - ?gif at_least_one_keyword
    - Gives you a gif result for at_least_one_keyword
  - ?list thing1 
    - Gives you a link to the list of things associated with thing1
  - Cmd ?celebrate-with-pandas - put there by me for celebrations!
  - Pipe command: ?pipe randcase 3 @alexkarp | m++
    - Output: “Pluses are falling like rain! akarPiNskI (200), akarpInsKI (201),   - akarPiNSkI (202).”
    - It takes the user name akarpinski, does random casing on it three times, then   - takes the output and pipes it to m++, which is multi-plussing - ie give pluses   - to multiple users. The numbers in brackets are the numbers of pluses that alex   - has after each operation.
    - (More on pipes here: https://docs.google.com/document/d/  - 1T3ZP3GHCO4vWm1jA441ymIllgLJhuy37oNs8Sa_YWpw/edit)

## Emoticons in the browser (including Google meet chat windows)

- Google docs / Google products only?
- Ctrl + cmd + space to embed emojis
  - Windows key + `;` on Windows
- NB: In google sheets you have to be in the formula input for it to
  work.

## Trello

### Voting functionality

- To add voting functionality to Trello, click the menu top right, then select powerups and search for the Voting powerup to add it.
- Once it's added you can vote on Trello cards by hovering over and pressing on the keyboard, or opening up the card and finding the Vote button on the right.
- You can then order cards in a column by how many votes they have, by clicking the three dots at the top right of the column and selecting "Sort by..." then "votes".

### Other quick shortcuts

- **Copying / pasting cards between boards**: Simply hover over a card and use Ctrl + C / Cmd + C, then go to the destination board and use Ctrl + V / Cmd + V.
- **Adding your name to a card**: Hover over it and press the spacebar (doesn't work if the new card bit at the bottom has focus).

### File Explorer breaks / changes appearance after Windows 10 update.

This fixed my problem:

"I also had a problem with the changed appearance of File explorer.  Turned out the navigation pane had disappeared.   Select View option, select the down arrow at Navigation pane (top left), in the drop down menu tick the box beside Navigation pane.  It's back to the way I like it." From here: https://answers.microsoft.com/en-us/windows/forum/all/file-explorer-changed-appearance-after-update/3306555e-05f6-438c-87de-66ed2b0cae2c

### Show desktop on MacBook

- What I've done is go into system preferences and set up a hot key - if you click the right hand alt / option key, that'll do it.

### If your browser suddenly goes hyper-zoomed-in on Chrome on a Macbook

- Cmd + 0 will fix that.

# How to make greyscale / grayscale / monochrome / b+w / black and white pics with transparent background

- Clare only (google slides): https://docs.google.com/presentation/d/1ffla3m_wi5fDOOnttjP6tDx1UiszsmIs9fqekUEbOsM/edit#slide=id.p
  - Right-click -> replace image
  - Right-click -> Format options -> Re-colour -> Light 4 (or experiment to find out what works best)
  - File -> download -> png, current slide (NOT JPG - you lose the transparency if you do that)