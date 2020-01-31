---
layout: page
location: pages/coding/webdev/js/leaf
permalink: /pages/coding/webdev/js/Javascript-Resources
---

([Main Javascript directory is here](/pages/coding/webdev/Javascript))

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [codefirstgirls-bootstrap-exercise](https://github.com/claresudbery/codefirstgirls-bootstrap-exercise)

## General Javascript Stuff

- External hard disk has stuff from previous projects in F:\2014_OldHardDisk\Git

## Elsewhere on this site

- [MVC4](/pages/coding/dotnet/MVC4)

## Javascript in Chrome Bookmarks

Enter Number in input: Put this js into the url field in a Chrome bookmark:

```
(javascript:(function(){var firstInput = $('form').find('input[type=text],input[type=password],input[type=radio],input[type=checkbox],textarea,select').filter(':visible:first'); if (firstInput != null) { firstInput.val('99999');}})()))
```
