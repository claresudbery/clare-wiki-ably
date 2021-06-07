---
layout: page
location: pages/coding/tools/testing/leaf
permalink: /pages/coding/tools/testing/Karma
---
## What is karma

  - **Karma** is a tool which lets us spawn browsers and
    run **Jasmine** tests inside of them all from the command line.

## Running Jasmine tests using karma

  - Run these commands:
  - In GitBash:
      - This: **npm install**
      - Then this: **node\_modules/karma/bin/karma start karma.conf.js
        --single-run**
  - **In Windows command prompt:**
      - Install the karma command-line interface like this:
          - This: **npm install -g karma-cli**
      - Run the command
          - This: **node\_modules\\.bin\\karma start karma.conf.js
            --single-run**

## Troubleshooting

  - If any problems…
      - **npm install karma --save**
          - Puts it in node-modules and updates package.json
      - You will also need the command-line interface
          - Run this: **npm install -g karma-cli**
      - …and any other dependent packages
          - Run this: **npm install**
      - To run tests: get yourself into the karma tests folder
          - …and run “**karma start**”
          - This will run all your tests and then leave karma running,
            to automatically pick up any file changes and rerun tests on
            demand.

## Leaving the test runner in the background

  - You can just go to dts-frontend and run **make jstest**
      - This runs tests but doesn’t leave the test runner going
  - To have the test runner running constantly in the background: **make
    jstestrunner**
      - This means that every time you make a change *and save the js*,
        the tests will be automatically rerun.
      - Actually all this does is make sure the right bits are
        installed, then move you to your karmaTests folder and run
        **karma start**
      - It also specifies to use karma.conf.js, but I’m pretty sure that
        if you just navigate to karmaTests and run **karma** **start,**
        it will use that conf.js file anyway.
