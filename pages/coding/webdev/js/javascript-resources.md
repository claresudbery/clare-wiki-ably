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
- msFill - HTML javascript thing?: Dropbox\IT Training\JS Stuff\canvasfill.html
- Javascript examples from Helix: Dropbox\IT Training\JS Stuff\Javascript examples.js
- JS Dictionary: Learnt at WebApps?: Dropbox\IT Training\JS Stuff\JSDictionary
- JS stuff from Weeble: Dropbox\IT Training\JS Stuff\MvcApplication1.zip
- JS tests from Helix: Dropbox\IT Training\JS Stuff\Sample Code\JS Tests
- Ext JS stuff: Dropbox\IT Training\JS Stuff\SampleExtJSApp.zip
- More sample javascript from Helix: Dropbox\IT Training\JS Stuff\SampleJavaScript.js
- Helix general JS stuff: Helix folder in contracting folder in ClareWorking email
- [That funny article about javascript frameworks and libraries](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f) 
- [Quickly create sandboxes for react/vue/angular etc](https://twitter.com/CompuIves/status/1291020566221205511) - eg Type http://react.new in the address bar of your browser, and it will open @codesandbox with a new React project.
- Some useful stuff about the spread function, currying, and javascript fundamentals are [here](https://www.the-blue-pages.net/board/index.php?/topic/39979-ducks-tiresome-thread-of-web-questions/page/2/#comments) (accessible to Clare only)
- Use [jsfiddle code playground](https://jsfiddle.net/) to write test Javascript in the browser.
- Play with css animation using Javascript expressions with [tixy.land](/pages/coding/webdev/js/tixy-land)
- [wtfjs](https://wtfjs.com/) - a place where people post examples of Javascript behaving weirdly. "JavaScript is a language we love despite it giving us so much to hate. This is a collection of those very special irregularities, inconsistencies and just plain painfully unintuitive moments for the language of the web."
- Chris Young(@WorldOfChris)'s city-building Bezier project - [the tests behind it](https://github.com/peckhamdata/bc-map/blob/master/test/city_builder.test.js)

## Elsewhere on this site

- [MVC4](/pages/coding/dotnet/MVC4)

## Use Javascript in Chrome Bookmarks

Enter Number in input: Put this js into the url field in a Chrome bookmark:

```
(javascript:(function(){var firstInput = $('form').find('input[type=text],input[type=password],input[type=radio],input[type=checkbox],textarea,select').filter(':visible:first'); if (firstInput != null) { firstInput.val('99999');}})()))
```
## js optimisation

  - See \`jsoptimise.build.js\` in Samba (although when I searched for
    it, it wasn’t there…)
  - To optimise automatically:
      - cmd: \`gulp watch\` from the following path:
        \`C:\\samba\\dts\\dts-frontend\\src\\dts\_frontend\`
      - or Task Runner Explorer - double-click watch
      - BUT none of this should be necessary because of bindings: See
        the top line in \`gulpfile.js \`
          - Like this: /// \<binding BeforeBuild='css, min:js'
            Clean='clean' ProjectOpened='watch' /\>
          - To see bindings, just click Bindings tab in Task Runner
            Explorer
  - gulpfile.js:
      - \`paths\` command means you can create aliases then refer to
        them later
      - You can add new gulp commands
