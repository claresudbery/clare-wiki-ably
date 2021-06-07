---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/Nightwatch
---
## Intro

  - See
    [articlepage.js](https://d.docs.live.net/resources/files/articlepage.js.md)
    for an example of setting up the stuff you need to run a test
      - …then
        [userjourney.tests.js](https://d.docs.live.net/resources/files/userjourney.tests.js.md)
        for an example of tests that use that stuff
  - If not already done, set yourself up to run nightwatch tests:
      - get yourself into the ui folder – eg
        test/ClarevilleWebappTests/UI
      - **npm install**
          - **\!\! Make sure you are in Git Bash, not command prompt\!**
  - Then get everything running
      - Get into root webapp folder first
      - **make start-proxy**
      - **make build run**
          - …or just run it up in visual studio
  - Then in git bash, in the webapp root (where the makefile is):
      - This: **BUSINESS\_ID=clarevillegov UI\_TEST\_HOST=http://
        clarevillegov.local:5555 Make ui-test**
          - …or run tests in all apps:
          - This: **UI\_TEST\_HOST=http://localhost:5000 Make
            ui-test-all**
          - …or a specific test:
          - This: **BUSINESS\_ID= clarevillegov UI\_TEST\_HOST=http://
            clarevillegov.local:5555 Make ui-test-specific
            testname="Find article for Thingy"**
          - Or this: **make ui-test-specific testname="Navigate to a
            Contact Us form and enter invalid data into the form"**
  - Troubleshooting
      - ?? Global.js – change endpoint to **clarevillegov**.local:5000
          - This endpoint is normally the url of the docker machine
  - Running just one test:
      - I have set things up with a makefile function and a bash alias
        so that you can just type this at the command prompt:
          - This: **iagnws "This is the name of my test from
            userjourney.tests.js** **"**
          - For instance: **iagnws "Finding article for Thingy"**
      - To add what you need to the makefile:
      - Find the relevant makefile (example [here](https://d.docs.live.net/resources/files/makefile01.md))
      - Then create a new **ui-test** command, copied from the original,
        but with this added to the end:
          - `-- test
            test/ClarevilleWebappTests/UI/specs/clarevillegov/\[name of
            test file\] --testcase "\[name of test – you’ll find this in
            the js\]"`
          - Example: `--test test/ClarevilleWebappTests/UI/specs/clarevillegov/userjourney.tests.js --testcase
            "Navigate to a Contact Us form and enter invalid data into
            the form"`
              - Example in situ example [here](https://d.docs.live.net/resources/files/makefile01.md)
          - From command line you just do this:
              - `make ui-test-specific testname="Navigate to a Contact Us
                form and enter invalid data into the form"`
  - See [Samba Useful
    Notes](https://github.com/claresudbery/samba/blob/master/Useful-Notes.docx)
    (accessible to Clare only) for example of headless xunit front end
    tests
  - See ["More notes from a different project"](#more-notes-from-a-different-project) below

## More notes from a different project 

- These are notes I made from another project also using Nightwatch - so there might be some duplication from the notes above.
-	To run the tests locally: `node tests/nightwatch.js tests/uitests/`
-	Make sure you have the relevant apps (potentially front end and back end) running locally (either Docker or Visual Studio) – first you might need to set `TEST_URI` to tell it where the frontend is running
  -	Like this: `export TEST_URI=http://localhost:57726`
    -	This is because of `global.js` (in `xxx-frontend\tests`), which refers to it
  -	This will set a local env var which is not accessible via Windows env var dialog, but can be seen in Git Bash by typing `env`
-	!! If you get the following error: “Error retrieving a new session from the selenium server … Connection refused! Is selenium server started? … Unable to connect to host 127.0.0.1 on port 7055”
  -	This may be because you have the wrong version of Firefox: The Selenium driver we are using can only cope with versions of Firefox that are <= 44
    -	!! after installing, disable automatic updates and install again:
    -	To disable updates, click the menu button (top right), click `Options => Advanced => Updates`
-	If you want to run the tests in a headless browser instead:
  -	Change nightwatch.json:
    -	!Not the version in `node_modules`! It actually lives in the root of the project. 
  -	The `browserName` setting at the end of the file: Here are the two possibilities:
    -	"browserName": "phantomjs",
    -	"browserName": "firefox",
  -	!! If trying to use firefox, you need to have the location of firefox.exe added to your system path. It’s probably here: C:\Program Files\Mozilla Firefox

## Creating your own makefile commands to run nightwatch tests

  - Running individual nightwatch tests:
  - Hard-coded test name:
      - `UI\_TEST\_HOST=[http://stockportgov.local:5555](http://stockportgov.local:5555/) make
        ui-test-specific testname="Navigate to a Contact Us form and
        enter invalid data into the form"`
  - Test name as a parameter: Setup `ui-test-specific` in your
    makefile as demonstrated
    [here](https://d.docs.live.net/resources/files/makefile01.md).
      - From command line you just do this:
          - `make ui-test-specific testname="Navigate to a Contact Us
            form and enter invalid data into the form"`
          - …or something like that!
      - The `--group` bit is referring to the fact that it is possible to
        split your tests into groups, simply by putting them in a
        sub-folder with the name of the group
          - For instance in IAG, there are sub-folders in the specs
            folder called clarevillegov and healthyclareville – these
            are the groups.
          - More here:
            <https://github.com/nightwatchjs/nightwatch-docs/blob/master/guide/running-tests/test-groups.md>
          - ...and here: <http://nightwatchjs.org/guide/#test-settings>
      - The `--env` bit refers to the sub-element within the
        “test\_settings” section of nightwatch.json
          - If you look in the makefile for Samba IAG, you’ll see that
            env is set to TEST\_OS, which is defined elsewhere in the
            makefile as either “default” or “linux”
          - If you look under test\_settings, you’ll see sections for
            default and linux
          - You can create as many of these as you like
