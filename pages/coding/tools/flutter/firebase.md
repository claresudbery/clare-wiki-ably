---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Firebase
---

# Firebase

## Contents of this page

- [Tutorial](#tutorial)
- [Editing database - gotchas](#editing-database---gotchas)
- [How to export / import data?](#how-to-export--import-data)
- [Troubleshooting lost data from emulator](#troubleshooting-lost-data-from-emulator)
- [Troubleshooting "permission denied"](#troubleshooting-permission-denied)
- [Troubleshooting emulator failing on startup](#troubleshooting-emulator-failing-on-startup)
- [Collection groups / Collection group queries](#collection-group-queries)
- [Upload an image to local emulator storage](#upload-an-image-to-local-emulator-storage)
- [How to verify a new user without actually having to literally click a link in an email](#how-to-verify-a-new-user-without-actually-having-to-literally-click-a-link-in-an-email)

## Tutorial

- [Here](https://firebase.google.com/docs/guides)

## Editing database - gotchas

- When you add a collection, it might seem to disappear immediately after being added
  - This happens when it appears in the existing list but there's a scrollbar and you have to scroll down to see it
  - Even more confusing, sometimes you don't even get a scrollbar, but if you use the scroll wheel in the relevant area, more collections will scroll into view

## How to export / import data? 

- [Reference](https://firebase.google.com/docs/firestore/manage-data/export-import)
- emulator can store snapshot of data
  - This can also work as a backup / back up
- there are json files in a hidden `.firebase` directory (Cm + shift + `.` to show hidden files)
- should be able to create a zip file of that whole folder
- can zip the `.firebase` folder, send it to someone, then they can start their emulator with your `.firebase` folder
- we started doing it in Git but it became too much - tracking all the changes
    - nice for getting started with a seed but then becomes pain in the butt
- but if you look at the emulator script you'll see it does export the `.firebase` folder by default
    - This means that as long as emulator is closed down properly, it will save all current data into the `.firebase` folder and everything gets saved
    - When you close down the emulators, then the files in `.firebase` are updated with exported data: 
        - `auth_export/accounts.json` contains user logins
        - `firestore_export/all_namespaces/all_kinds/output-0` contains ring, matchbox and user data
- If your laptop closes down while emulator running, it automatically creates an export folder
    - This happened when my laptop ran out of juice while the emulator was running
    - it was in a folder `firebase-export-1713563491656PMDLEW` 
    - I could then see all my data in `firestore_export/all_namespaces/all_kinds/output-0` (opened in a text editor)
    - You can stop the emulator, then grab that export and replace the current `.firebase/firestore_export` folder with the one in `firebase-export-1713563491656PMDLEW`, then restart the emulator
    - but sadly you only get firestore_export - no auth_export or database_export
        - If you don't have an `auth_export` folder to go with your `firestore_export`, although you can see all your users in Firestore, none of them will have any logins so you can't log in with them.
    - although you can manually add auth users into `auth_export/accounts.json`
        - see a sample version [here](/flutter-construct/construct-accounts-test.json)
        - This worked well! The top user in the file was copied from the second one down
        - I had to change the following:
            - Change `localId` to be same ID as that stored in firestore (from `firestore_export`)
            - Tweak the dates
            - Change the email (several places)
            - Change the pw
            - Tweak the fake salt to be different from the second one
            - Make sure the `passwordHash` referenced the fake salt

## Troubleshooting lost data from emulator

- ! Sometimes the Firebase emulator gets confused and data in the browser doesn't seem to match what's in the app
  - Try closing it down / kill the process before starting it up again:
    - Ctrl + C, 
    - then run `pkill -f "firebase/emulators"` 
      - I have this set up as an alias called `killf`
  - We also had to edit emulator.sh at one point to change the `--project` flag from `default` to `--project dev`

## Troubleshooting "permission denied"

- If you try to do various database actions before the user has logged in, you'll get this error
- eg fetching user info
- or trying to update matchboxes
- looks like this: `cloud_firestore/permission-denied`

## Troubleshooting emulator failing on startup

- I got this error: `Fatal error occurred:  Emulator UI has exited with code: 1,  stopping all running emulators`

![/resources/images/firebase-emulator-error-01.png](/resources/images/firebase-emulator-error-01.png)

- The previous lines in the console feedback (see screenshot above) suggested I run `firebase login`, but when I did that I got the message `already logged in`
- I checked `ui-debug.log` (which I found in the top level `[named-after-project]` folder of the code base) and found this:

```js
node:internal/modules/cjs/loader:986
    throw new ERR_REQUIRE_ESM(filename, true);
    ^

Error [ERR_REQUIRE_ESM]: require() of ES Module /Users/claresudbery/.cache/firebase/emulators/ui-v1.11.8/server/server.mjs not supported.
Instead change the require of /Users/claresudbery/.cache/firebase/emulators/ui-v1.11.8/server/server.mjs to a dynamic import() which is available in all CommonJS modules.
    at Function.runMain (pkg/prelude/bootstrap.js:1979:12) {
  code: 'ERR_REQUIRE_ESM'
}

Node.js v18.5.0
```

- I found [this link](https://github.com/firebase/firebase-tools/issues/6931) complaining of same problem
- I ran this: `npm i firebase-tools -g` to install `firebase-tools` as a global npm package, as suggested by the link above
- ...but got this error:

```js
npm warn EBADENGINE Unsupported engine {
npm warn EBADENGINE   package: 'superstatic@9.2.0',
npm warn EBADENGINE   required: { node: '18 || 20 || 22' },
npm warn EBADENGINE   current: { node: 'v23.8.0', npm: '10.9.2' }
npm warn EBADENGINE }
```

- As with the complainant in that link, the error file was reporting the wrong version of node
  - `node -v` told me I was on v `23.8.0`, as installed via `nvm install 22.14.0`
  - But the error above, and the link, state that only even versions of node are supported
  - So I went back down to latest stable version of node 22, which is currently (18/3/25) `22.14.0`
  - I did this via `nvm install 22.14.0`
- then I ran `npm i firebase-tools -g` again
- After that, the emulators started successfully.

## Collection Group Queries

- A collection group happens when several collections have sub-collections of the same name
- eg `collection(citiesRef, 'SF', 'landmarks')` and `collection(citiesRef, 'DC', 'landmarks')`
- so both SF and DC have a `landmarks` sub-collection
- We can use the simple and compound query described earlier to query a single city's landmarks subcollection, but you might also want to retrieve results from every city's landmarks subcollection at once.
  - This is what collection group queries are for
- More [here](https://firebase.google.com/docs/firestore/query-data/queries#collection-group-query)

## Upload an image to local emulator storage

- Use a url like this: http://127.0.0.1:4000/storage/project-id.appspot.com/avatars
- ...where `avatars` is the name of the place where you're storing your images
- ...and `project-id` is the project ID for your Firebase - will be set as `projectId` in firebase.json and maybe `PROJECT_ID` in various bits of config - might look something like `app-xxxxxxx-dv-123456`

- That url will take you to a page with an "Upload file" button

## How to verify a new user without actually having to literally click a link in an email

- Go to your [local Firebase emulator suite](http://127.0.0.1:4000/)
- Click on Authentication at the top
- Find the relevant email address
- Click the three dots on the right => Edit user
- Move the slider to change on the right under "Verified email?" to be `Verified` rather than `Not verified`
- Scroll down and click Save
- Back in the app, refresh the browser and then sign in 
  - (clicking "I have verified my email" probably won't work)