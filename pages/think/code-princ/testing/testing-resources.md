---
layout: page
location: pages/think/code-princ/testing/leaf
permalink: /pages/think/code-princ/testing/Testing-Resources
---


## Misc

- [Testing tag in private Evernote](https://www.evernote.com/client/web?login=true#?an=true&n=dbccb66e-f286-40ac-a13e-93848ca66909&query=tag%1FTesting%1FtagGuid%3A31868955-6c21-4f59-9749-45e9c1edde67%1Eview%3AVIEW%2FALL_NOTES&)
- Great article by Emily Bache [here](http://coding-is-like-cooking.info/2013/03/principles-for-agile-test-automation-2nd-edition/) about the four principles of agile test automation - which are readability, robustness, speed and updatability. If you have all four of those, then you have maintainability.
    - [Video of Emily discussing the principles](https://vimeo.com/channels/tga12/53829152)

## In memory tests

- Allows you to test the full journey end to end, including all the hooking up re REST, http headers etc… but by holding various key pieces in memory 
- Basically you create a copy of IIS that will run in memory instead of having to hit an actual external web server. So you're testing the entire application. 
- We used this in [Samba](https://github.com/claresudbery/samba), but I'm not sure I have an example.

