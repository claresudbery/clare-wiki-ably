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

## Tutorial

- [Here](https://firebase.google.com/docs/guides)

## Editing database - gotchas

- When you add a collection, it might seem to disappear immediately after being added
  - This happens when it appears in the existing list but there's a scrollbar and you have to scroll down to see it
  - Even more confusing, sometimes you don't even get a scrollbar, but if you use the scroll wheel in the relevant area, more collections will scroll into view

## How to export / import data? 

- [Reference](https://firebase.google.com/docs/firestore/manage-data/export-import)
- emulator can store snapshot of data
- there are json files in a hidden `.firebase` directory (Cm + shift + `.` to show hidden files)
- should be able to create a zip file of that whole folder
- can zip the `.firebase` folder, send it to someone, then they can start their emulator with your `.firebase` folder
- we started doing it in Git but it became too much - tracking all the changes
    - nice for getting started with a seed but then becomes pain in the butt
- but if you look at the emulator script you'll see it does export the `.firebase` folder by default
    - This means that as long as emulator is closed down properly, it will save all current data into the `.firebase` folder and everything gets saved
    - When you close down the emulators, then the files in `.firebase` are updated with exported data: 
        - `auth_export/acounts.json` contains user logins
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
  - Try closing it down with Ctrl + C, then running `pkill -f "firebase/emulators"` before starting it up again
  - We also had to edit emulator.sh at one point to change the `--project` flag from `default` to `--project dev`

## Troubleshooting "permission denied"

- If you try to do various database actions before the user has logged in, you'll get this error
- eg fetching user info
- or trying to update matchboxes
- looks like this: `cloud_firestore/permission-denied`


    