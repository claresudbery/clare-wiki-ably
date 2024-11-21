---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Firebase-Security-Rules
---

# Firebase Security Rules

## Contents of this page:

- [Overview](#overview)
- [Getting started](#getting-started)
- [Creating a test app](#creating-a-test-app)
- [Writing unit tests](#writing-unit-tests)
- [Working with test data](#working-with-test-data)
- [Different types of database action](#different-types-of-database-action)
- [Custom auth claims](#custom-auth-claims)
- [Store custom auth stuff in your database](#store-custom-auth-stuff-in-your-database)
- [Functions in rules](#functions-in-rules)
- [Accessing the new data rather than the existing data](#accessing-the-new-data-rather-than-the-existing-data)
- [Accessing / checking specific fields](#accessing--checking-specific-fields)
- [Checking which fields have been changed on update](#checking-which-fields-have-been-changed-on-update)
- [Good practice](#good-practice)
- [Experimenting with security rules](#experimenting-with-security-rules)
- [Debugging](#debugging)
- [Troubleshooting](#troubleshooting)
- [Running emulator on another port](#running-emulator-on-another-port)
  - [1. Edit firebase.json](#1-edit-firebasejson)
  - [2. Edit your test file](#2-edit-your-test-file)
  - [3. Remove calls to clearFirestoreData](#3-remove-calls-to-clearfirestoredata)
- [My questions to the firebase community](#my-questions-to-the-firebase-community)
  - [Difference between firebase testing node modules](#difference-between-firebase-testing-node-modules)

## Overview

- [Useful reference](https://firebase.google.com/docs/reference/rules/rules)
- Firestore has its own DSL
- there are some good videos 
  - unit testing: https://www.youtube.com/watch?v=VDulvfBpzZE
  - more advanced unit testing: https://www.youtube.com/watch?v=8Mzb9zmnbJs
  - Documentation: https://firebase.google.com/docs/rules and https://firebase.google.com/docs/firestore/security/get-started
- The emulator listens for changes to `infra/firestore.rules`
- by default all access is turned off (`false`) unless specified
- by default there are two commands - `read` and `write`
  - both have 2 commands under the hood
  - write = update and create
    - can disallow write to disallow both, or be more granular by disallowing one or the other
  - read = list and get
    - can disallow read to disallow both, or be more granular by disallowing one or the other
    - `list` refers to reading a whole collection rather than an individual document
    - `get` means reading just one doc
    - The docs admit it's unlikely you'd want someone to `list` but not `get` - it's more likely to be the other way round
    - Note there is no `list` command per se - it's just if you perform a `get` on a whole collection
    - More [here](https://www.fullstackfirebase.com/cloud-firestore/security-rules#read-rules)

## Getting started

- Install toba security rules syntax highlighting extension: toba.vsfire, v1.4.1: https://marketplace.visualstudio.com/items?itemName=toba.vsfire
- Install node and npm
- Get a recent version of Java
- Make sure you have most up to date version of Firebase tools
  - Note that the video suggests `npm -i -g firebase-tools`
    - This didn't work on my machine
    - neither did `firebase-tools -v`
    - when I ran `firebase login` it said I was already logged in, but also suggested I upgrade from 13.7.0 to 13.25.0 via `npm install -g firebase-tools`, which I did
    - I think the problem is that it should be `npm -i -g firebase-tools`, not `npm i -g firebase-tools`
      - (`npm i` is equivalent to `npm install`)
    - and once it's installed it's called `firebase`, not `firebase-tools`
    - also just for the laughs, if you want to know version you have to use `-V` not `-v`
    - so, to check version, use `firebase -V`
- You'll also need to [create a test app](#creating-a-test-app)
- ...and get yourself set up to [write unit tests](#writing-unit-tests)

## Creating a test app

- First create an empty project in Firebase console
  - The video says "enable Firebase Cloud store in production mode"
    - click through to Cloud Firestore on home page of new app
    - click Create database
    - select "start in production mode" when prompted
- Now run the following:

```bash
# DON'T DO THIS UNTIL YOU'VE CREATED EMPTY APP IN FIREBASE CONSOLE - SEE ABOVE
mkdir security-rules-test-app
cd security-rules-test-app
firebase login
firebase init
```

- There'll be various prompts when running init:
  - Select CLI features:
    - Firestore
    - Emulators
  - Use existing project
    - The one you ceated above
  - Use default file names for rules and indexes
  - When it asks which emulators to setup, select Firestore
    - Pick default port if asked
- Now you'll have a `firestore.rules` file

## Getting started with unit tests

- First [create test app](#creating-a-test-app)
- Now, create a folder called test:

```bash
mkdir test
cd test
npm init # or npm install if this was already done
```

- `npm init` will get your `package.json` file set up for the tests
  - !Remember if you're working with an existing project, you'll need to run `npm install` if you've never run the tests before
- Accept defaults for `npm init`
  - Add your own description
  - Main entry point = `test.js`
  - Test command = `mocha --exit`
  - Enter your name for author
  - You can ignore Git repo for now, and also leave licence blank
  - Press Enter to continue
- I originally did all this after watching [this video]()
  - But that video was 4 years old and things have moved on.
  - So I've documented here 
    - [what I originally did](#what-i-originally-did)
    - [how I converted to a more up to date approach](#how-i-converted-to-a-more-up-to-date-approach)
    - [how to start with more up to date approach](#how-to-start-with-more-up-to-date-approach)

### What I originally did

- Install a couple of libraries:

```bash
npm install mocha --save-dev #save-dev means only save this for dev purposes, don't deploy it with my code
npm install @firebase/testing --save-dev
```

- Create new file called `test.js` in `test` folder.
- Put what's shown below at the top of your file.
- See [sample code](security-rules-test-app/test/test.js#L1) for example
- Quick example:

```js
const assert = require('assert');
const firebase = require('@firebase/testing');

const MY_PROJECT_ID = "security-rules-test-app-43bc6"; // see below
```

- Project ID (`MY_PROJECT_ID`) comes from Firebase console: Click Settings cog in your project, top left
  - Select Project settings
  - Copy Project ID (something like `security-rules-test-app-43bc6`)

### How I converted to a more up to date approach

- You can see the commits where I did all of this 
  - [here](https://github.com/claresudbery/clare-wiki-ably/commit/2331b4a0ab9e3d35e0469916056faa43e6af863d)
  - and [here](https://github.com/claresudbery/clare-wiki-ably/commit/3e554c2b8e2473de7bcb0caf3d610e6f9290238f)
  - and [here](https://github.com/claresudbery/clare-wiki-ably/commit/abbdc197d63a14f8b3f47fa04e9798f0183c62ab)
- Installed some new libraries:

```bash
npm install firebase-admin --save-dev #save-dev means only save this for dev purposes, don't deploy it with my code
npm install firebase-tools --save-dev
npm install @firebase/rules-unit-testing --save-dev
```

- In `test.js`, replaced this...

```js
const assert = require('assert');
const firebase = require('@firebase/testing');

const MY_PROJECT_ID = "security-rules-test-app-43bc6";
```

- ... with this:

```js
import { createRequire } from "module";
const require = createRequire(import.meta.url);
var assert = require('assert');
var admin = require("firebase-admin");

import { describe, it, afterEach } from "mocha";
import {
  initializeTestEnvironment,
  assertFails,
  assertSucceeds,
} from "@firebase/rules-unit-testing";
import { readFileSync } from "fs";
import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";

const projectId = "security-rules-test-app-43bc6";
```

- Set up admin access:
  - In Firebase console, select your test project
  - Click Settings cog, top left => Project settings => Service accounts (tab at top) 
  - click Generate new private key
  - Take the generated json file and rename it `serviceAccountKey.json`
  - Put it somewhere secure - NOT in your repo
  - There's a snippet of code provided in Firebase console which should be equivalent to the relevant below
- Replaced this...

```js
const myAuth = {uid: myId, email: "user_abc@gmail.com"};
const modAuth = {uid: modId, email: "mod@gmail.com", isModerator: true};

function getFirestore(auth){
  const db = firebase.initializeTestApp({
    projectId: MY_PROJECT_ID,
    auth: auth,
  }).firestore();
  // db.settings({ host: "localhost:4401", ssl: false });
  return db;
};

function getAdminFirestore(){
  const db = firebase.initializeAdminApp({
    projectId: MY_PROJECT_ID,
  }).firestore();
  // db.settings({ host: "localhost:4401", ssl: false });
  return db;
};
```

- ... with this 
  - (note you need to change the path to wherever you have stored `serviceAccountKey.json`):

```js
var serviceAccount = require("/path/to/serviceAccountKey.json");
const adminApp = initializeApp({
  projectId,
  credential: admin.credential.cert(serviceAccount),
});
const adminDB = getFirestore(adminApp);

const firestore = {
  rules: readFileSync("./../firestore.rules", "utf8"),
  host: "localhost",
  port: 8080,
};
const testEnv = await initializeTestEnvironment({
  projectId,
  firestore,
});
const moderatorToken = {
  isModerator: true,
};
```

- Throughout the code, make the following replacements:
  - Replace `getFirestore(null);` with `testEnv.unauthenticatedContext().firestore();`
  - Replace `getFirestore(myAuth);` with `testEnv.authenticatedContext(myId).firestore();`
  - Replace `getFirestore(modAuth);` with `testEnv.authenticatedContext(modId, moderatorToken).firestore();`
  - Replace `firebase.assertFails` with `assertFails`
  - Replace `firebase.assertSucceeds` with `assertSucceeds`
  - Replace `firebase.clearFirestoreData({projectId: MY_PROJECT_ID});` with `testEnv.clearFirestore();`
- Remove all calls to `getAdminFirestore()` (eg `const admin = getAdminFirestore();`)
  - ...and replace `admin.collection` with `adminDB.collection`

### How to start with more up to date approach

- Install some libraries:

```bash
npm install mocha --save-dev #save-dev means only save this for dev purposes, don't deploy it with my code
npm install @firebase/rules-unit-testing --save-dev
npm install firebase-admin --save-dev
npm install firebase-tools --save-dev
```

- Create new file called `test.js` in `test` folder.
- Put what's shown below at the top of your file.
- See [sample code](security-rules-test-app/test/test.js#L1) for example
- Quick example:

```js
const assert = require('assert');
const firebase = require('@firebase/testing');

const MY_PROJECT_ID = "security-rules-test-app-43bc6"; // see below
```

- Project ID (`MY_PROJECT_ID`) comes from Firebase console: Click Settings cog in your project, top left
  - Select Project settings
  - Copy Project ID (something like `security-rules-test-app-43bc6`)

## Writing unit tests

- Edit `test.js` to add your first test(s)
- See [sample code](security-rules-test-app/test/test.js#L1) for example of a test
- Quick example:

```js
describe("Our security rules test social app", () => {

  it ("Can read items in the read-only collection", async() => {
    const db = firebase.initializeTestApp({projectId: MY_PROJECT_ID}).firestore();
    const testDoc = db.collection("readonly").doc("testDoc");
    await assertSucceeds(testDoc.get());
  })

  it ("Cannot write items to the read-only collection", async() => {
    const db = firebase.initializeTestApp({projectId: MY_PROJECT_ID}).firestore();
    const testDoc = db.collection("readonly").doc("testDoc2");
    await assertFails(testDoc.set({foo: "bar"}));
  })
})
```

- Run `npm test` on command line from within `test` folder
  - You may get the error `FirebaseError: No matching allow statements`
    - This is either because you haven't added anything to `firestore.rules` yet, or because you already have an emulator running on a different database, in which case you need to start up the emulator on this database (see below)
    - If it talks about matching allow statements, that's probably because it's looking at the Construct database.
  - You may get the error `FirebaseError: Failed to get document because the client is offline.`
    - This is because the emulator is not running
  - Start up the emulator: 
    - Make sure you're in your project folder
    - Run `firebase emulators:start`
    - You may get an error about ports if you already have an emulator running
      - You can edit port in `firebase.json` as per instructions, or you can close down the other emulator first
      - !Editing port can be problematic! See [below](#running-emulator-on-another-port)
    - You may have to wait for emulator to be downloaded
- Run `npm test` again
  - You should get the error `FirebaseError: false for 'get'`
- To make the test pass, edit `firestore.rules` 
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /readonly/{docID} {
      allow read: if true;
      allow write: if false;
    }
  }
}
```

- On the document collection called `readonly`... 
  - we are always allowing reads but never allowing writes
- Note that the first match, on `document=**`...
  - ...is saying that the default for all docs is no read and no write
  - using the principle of least privilege
  - default to a whitelist instead of a blacklist
- Now the test passes even though there is no actual data in the database
  - An empty record is returned, but the point is that the user has permission to read that data, 
  - so even though it's an empty document snapshot, it's still returned with no error.
- You can capture data from the auth object and use that to verify
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /users/{userId} {
      allow write: if (request.auth.uid == userId);
    }
  }
}
```

- The `{userId}` bit is called a capture  
  - it means we can capture a piece of data from the query path
  - in this case the Id of the doc that's being queried
  - this is a common pattern - to say the user can only write to a doc whose Id is also the user's Id
  - so we have a users collection where each doc has the user id as its id
- Then in our test, we can create a dummy auth object so it seems like we are signed in as a particular user
  - again, notice that we're writing to a doc which doesn't actually exist
  - ...but that doesn't matter, the point is that we have permission to do it
- See [sample code](security-rules-test-app/test/test.js#L1) for example
- Quick example:

```js
const assert = require('assert');
const firebase = require('@firebase/testing');

const MY_PROJECT_ID = "security-rules-test-app-43bc6";

describe("Our security rules test social app", () => {

  it ("Can write to a user doc with the same ID as our user", async() => {
    const myAuth = {uid: "user_abc", email: "user_abc@gmail.com"}
    const db = firebase.initializeTestApp({
      projectId: MY_PROJECT_ID,
      auth: myAuth,
    }).firestore();
    const testDoc = db.collection("users").doc("user_abc");
    await assertSucceeds(testDoc.set({foo: "bar"}));
  })

  it ("Can't write to a user doc with a different ID to our user", async() => {
    const myAuth = {uid: "user_abc", email: "user_abc@gmail.com"}
    const db = firebase.initializeTestApp({
      projectId: MY_PROJECT_ID,
      auth: myAuth,
    }).firestore();
    const testDoc = db.collection("users").doc("user_xyz");
    await assertFails(testDoc.set({foo: "bar"}));
  })
})
```

- So far we've looked at the auth object, but there is also a resource object
  - This is the current thing in the database that the user is trying to access
  - returns all of the fields in the doc as a map (set of key-value pairs), which is in `resource.data`
- You can use the resource object to look at particular fields in a document
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      allow read: if (resource.data.visibility == "public") ||
        (resource.data.authorId == request.auth.uid);
    }
  }
}
```

- And below are some tests.
- Note that in these tests, the underlying data does not exist.
- This is because it doesn't need to: We can see from the query which data will be fetched, and the rules dictate whether that data is accessible or not.
  - The rules engine will not look at data unless it absolutely has to - making it more performant.
- See [sample code](security-rules-test-app/test/test.js#L1) for example
- Quick example:

```js
const assert = require('assert');
const firebase = require('@firebase/testing');

const MY_PROJECT_ID = "security-rules-test-app-43bc6";

function getFirestore(auth){
  return firebase.initializeTestApp({
      projectId: MY_PROJECT_ID,
      auth: auth,
    }).firestore();
}

describe("Our security rules test social app", () => {

  it ("Can read posts marked public", async() => {
    const db = testEnv.unauthenticatedContext().firestore();
    const testQuery = db.collection("posts").where("visibility", "==", "public");
    await assertSucceeds(testQuery.get());
  })

  it ("Can query personal posts", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const testQuery = db.collection("posts").where("authorId", "==", myId);
    await assertSucceeds(testQuery.get());
  })

  it ("Can't query all posts", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const testQuery = db.collection("posts");
    await assertFails(testQuery.get());
  })
})
```

## Working with test data

- You can manually go into the emulator UI and create collections and documents
  - but obvs this not great for test data
- You can't do things like this:

```js
  const db = testEnv.unauthenticatedContext().firestore();
  const testDoc = db.collection("posts").doc("public_post");
  await testDoc.set({authorId: theirId, visibility: "public"});
```

- ...because the rules say we don't have permission to create docs.
- Instead, use `firebase.initializeAdminApp` alongside `firebase.initializeTestApp` 
  - This allows us to bypass all the client security rules.
- You'll also need to clear up all that data at the end of the test
  - Use `firebase.clearFirestoreData({projectId: MY_PROJECT_ID})`
  - You can do it in a `beforeEach` and in an `after` (which runs after ALL tests have run) to make sure each test is working with a clean slate.
- See [sample code](security-rules-test-app/test/test.js#L1) for example
- Quick example:

```js
const MY_PROJECT_ID = "security-rules-test-app-43bc6";
const myId = "user_abc";
const theirId = "user_xyz";
const myAuth = {uid: myId, email: "user_abc@gmail.com"}

function getFirestore(auth){
  return firebase.initializeTestApp({
      projectId: MY_PROJECT_ID,
      auth: auth,
    }).firestore();
}

function getAdminFirestore(){
  return firebase.initializeAdminApp({projectId: MY_PROJECT_ID}).firestore();
}

beforeEach(async() => {
  await firebase.clearFirestoreData({projectId: MY_PROJECT_ID});
});

describe("Our security rules test social app", () => {
  it ("Can read a single public post", async() => {
    const postId = "public_post";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({authorId: theirId, visibility: "public"});

    const db = testEnv.unauthenticatedContext().firestore();
    const testRead = db.collection("posts").doc(postId);
    await assertSucceeds(testRead.get());
  })
});

after(async() => {
  await firebase.clearFirestoreData({projectId: MY_PROJECT_ID});
});
```

## Different types of database action

- There is `read` and `write` covered in examples above
- Then there is `update`
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      allow update: if (resource.data.authorId == request.auth.uid);
    }
  }
}
```

```js
  it ("Allows a user to edit their own post", async() => {
    const postId = "post_123";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({
      content: "before",
      authorId: myId
    });

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.collection("posts").doc(postId);
    await assertSucceeds(testDoc.update({content: "after"}));
  })
```

## Custom auth claims

- You can add custom fields to the auth object
- ...but accessing anything other than `uid` on the auth object requires you to use `auth.token`, which is slightly confusing.
- Structure of auth object looks like this (see below)...
  - Note the use of attributes
    - this is sometimes referred to as Attribute Based Access Control, or ABAC
  - ...and roles
    - this is sometimes referred to as Role Based Access Control, or RBAC

```js
const myAuth = {
  uid: myId, 
  email: "user_abc@gmail.com"
  isModerator: true // This is known as an attribute
  role: "Moderator" // This is known as a role
}
```

- ...but fields are accessed like this:

```js
if (request.auth.uid == userId)
if (request.auth.token.email == email)
if (request.auth.token.isModerator == true)
if (request.auth.token.role == "Moderator")
```

- Limitations:
  - Has to be configured server side
  - There's a size limit to how much data you can add (is pretty big though)
  - There's a delay before updates will materialise - updates only happen once an hour
    - So use it for stuff that will change infrequently
- Alternative is to [store custom auth stuff in your database](#store-custom-auth-stuff-in-your-database)
- See [sample code](security-rules-test-app/test/test.js#L1) for example of test
- Quick example of test:

```js
const modAuth = {uid: modId, email: "mod@gmail.com", isModerator: true};

function getFirestore(auth){
  return firebase.initializeTestApp({projectId: MY_ID, auth: auth}).firestore();
};

it ("Allows a moderator to edit somebody else's post", async() => {
  await getAdminFirestore().doc("posts/post_127").set({content: "before"});

  const db = testEnv.authenticatedContext(modId, moderatorToken).firestore();
  const testDoc = db.doc("posts/post_127");
  await assertSucceeds(testDoc.update({content: "after"}));
})
```

## Store custom auth stuff in your database

- In this case you have to do an actual database fetch in the middle of the rule config
- So you have to call `get` to fetch the field that gives you access control info
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /rooms/{roomId} {
      function userIsRoomMod() {
        return request.auth.uid in 
          (get(/databases/$(database)/documents/rooms/$(roomId)).data.roomMods)
      }
      match /posts/{postId} {
        allow update: if (resource.data.authorId == request.auth.uid) ||
          userIsRoomMod();
      }
    }
  }
}
```

- See [sample code](security-rules-test-app/test/test.js#L1) for example of a test
- Quick example:

```js
  it ("Allows a room mod to edit another person's room post", async() => {
    const roomPath = "rooms/room_abc";
    const postPath = `${roomPath}/posts/post_123`;
    await adminDB.doc(roomPath).set({topic: "Unit testers", roomMods: [myId, "dummy_user"]});
    await adminDB.doc(postPath).set({content: "before", authorId: theirId});

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.update({content: "after"}));
  })
```

## Functions in rules

- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    function userIsModerator() {
      return request.auth.token.isModerator == true;
    }

    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      allow update: if userIsModerator();
    }
  }
}
```

- They can also go inside a `match` block
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      function userIsModerator() {
        return request.auth.token.isModerator == true;
      }
      allow update: if userIsModerator();
    }
  }
}
```

- ...but you can't add extra code inside a match block
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      let thing = true; // Will cause an error
      allow update: if thing;
    }
  }
}
```

- Any extra code must always go inside a function.
- This also applies to global constants. If you want them, you have to put them in a function (ie create a function which returns the data you want in the const)

## Accessing the new data rather than the existing data

- So far, we've seen `resource.data` be used to refer to data that already exists in the database
- But sometimes we want to access new data - whether it's a new doc being inserted or new data that will be updated on an existing doc
- We do this via `request.resource.data`
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      allow update: if (resource.data.authorId == request.auth.uid);
      allow create: if (request.resource.data.authorId == request.auth.uid);
    }
  }
}
```


- See [sample code](security-rules-test-app/test/test.js#L1) for example of a test
- Quick example:


```js
  it ("Allows a user to create a post when they set themselves as the author", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_124";
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.set({authorId: myId, content: "lorem ipsum"}));
  })
```

## Accessing / checking specific fields

- If you want to look at the list of fields in a request, you can use `keys()`:
  - `request.resource.data.keys()` for the field names of the newly updated or inserted doc
  - `resource.data.keys()` for the field names of the original doc before any change
- Note that `hasOnly` checks that it only contains a subset of the supplied list, and nothing else. This method is available on lists and sets (in this case it's a list).
  - `hasAll` checks that all specified values are there
  - (there's also a `hasAny` function)
  - (and you can use `in` to check whether a particular value is in a list or a set)
  - More [here](https://firebase.google.com/docs/reference/rules/rules.List)
  - and [here](https://firebase.google.com/docs/reference/rules/rules.Set)
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    function documentHasCorrectFields(requiredFields, optionalFields) {
      let requiredAndOptionalFields = requiredFields().concat(optionalFields());
      return (request.resource.data.keys().hasAll(requiredFields))
        && (request.resource.data.keys().hasOnly(requiredAndOptionalFields));
    }

    function postHasCorrectFields() {
      let requiredFields = ["authorId", "visibility", "content", "headline"];
      let optionalFields = ["location", "photo", "tags"];
      return documentHasCorrectFields(requiredFields, optionalFields);
    }

    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      allow create: if postHasCorrectFields();
    }
  }
}
```


- See [sample code](security-rules-test-app/test/test.js#L1) for example of a test
- Quick example:

```js
  it ("Can't create a post with unapproved fields", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_132";
    const testDoc = db.doc(postPath);
    await assertFails(testDoc.set({
      authorId: theirId, 
      visibility: "public",
      content: "lorem ipsum",
      headline: "Post headline",
      location: "Manchester",
      not_allowed: true
    }));
  })
```

## Checking which fields have been changed on update

- You can't look at the fields in the changed data (`request.resource.data.keys()`), because it will list all fields whether they've been changed or not
- ...but `resource.data` is a map (ie has the structure `{foo: "bar", goo: "gar"}`)
- ...so to compare the previous data with the new data and see what's changed, you can use [mapDiff functionality](https://firebase.google.com/docs/reference/rules/rules.MapDiff):
  - `data.diff` gives us the difference between the two maps
  - `affectedKeys()` gives us the names of all the fields that have changed in any way
  - `hasOnly` checks that it only contains a subset of the supplied set, and nothing else. This method is available on lists and sets (in this case it's a set).
- See [sample code](security-rules-test-app/firestore.rules#L1) for example
- Quick example:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    function editOnlyChangesFields(allowedFields) {
      let affectedKeys = request.resource.data.diff(resource.data).affectedKeys();
      return affectedKeys.hasOnly(allowedFields);
    }

    match /{document=**} {
      allow read, write: if false;
    }
    match /posts/{postId} {
      allow update: if editOnlyChangesFields(["visibility", "content"]);
    }
  }
}
```


- See [sample code](security-rules-test-app/test/test.js#L1) for example of a test
- Quick example:

```js
  it ("Can't create a post with unapproved fields", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_132";
    const testDoc = db.doc(postPath);
    await assertFails(testDoc.set({
      authorId: theirId, 
      visibility: "public",
      content: "lorem ipsum",
      headline: "Post headline",
      location: "Manchester",
      not_allowed: true
    }));
  })
```

## Good practice

- Edit `firestore.rules` locally and use `firebase deploy` to upload to server
  - instead of editing in console

## Experimenting with security rules

- There is a security rules playground in Firebase console
  - select database on left
  - select Rules at top
  - click Rules playground, bottom left
- In emulator, you can experiment with security rules by other means: https://firebase.google.com/docs/emulator-suite/connect_firestore#visualize_security_rules_activity
- ...but the best way is to write unit tests, and then you can [debug](#debugging) if necessary

## Debugging

- [More here](https://firebase.google.com/docs/reference/rules/rules.debug)
- If you wrap the `debug` function around the thing you want to debug, it will execute as normal but also output its value to the debug log - then you'll see it after running tests. 
- To access the debug log, open `firestore-debug.log`, which lives in same folder as `firebase.json` (possibly one level up from your tests)
  - You'll need to scroll to the end
  - These commands will get you there: `cd..`, `less firestore-debug.log`
    - ! For us, it's `cd ../..`
    - but actually `tail -f firestore-debug.log` is even better cos then it'll keep showing you new entries
    - I have an alias `fdebug` that stands for `tail -f firestore-debug.log`
  - Remember that in `vim` and `less`, Shift G will take you to the end of the file
  - Even though the file will likely contain a lot of noise, it's generally easy to find debug output because it's surrounded by blank lines.
- You can also nest `debug` calls:

```js
var myBool = (5+5 == 10)
var myBool = (debug(5+5) == 10) // myBool stays same. "10" is output to console.
var myBool = debug(debug(5+5) == 10) // "10" and "true" go to console.
```

- Sadly you can't add your own custom strings to help you identify which debug output is which.
- ...BUT there is a nice little hack to get around this - just create a debug string and put a `debug` on it:

```js
let debugString = debug("******* Diff of changed fields ******");
let affectedKeys = debug(request.resource.data.diff(resource.data)).affectedKeys();
```

## Troubleshooting

- If you get the error `Property auth is undefined on object` this could be because you accidentally wrote `if (resource.data.authorId == resource.auth.uid)`
  - it should be `request`, not `resource`
  - so it should be `if (resource.data.authorId == request.auth.uid)`
  - Also, if your rules contain a logical OR, eg `if (resource.data.authorId == resource.auth.uid) || (resource.data.visibility == "public")` 
    - then you might get an error based on some other part of the OR statement not working
    - With this example, the error could be `Property visibility is undefined on object` because it can't find either `visibility` OR `auth`, so the first thing it errors on is `visibility`
- If you get the error `ECONNREFUSED ::1:8080` while trying to run tests
  - This started happening to me randomly when previously it hadn't been happening
  - I was running my local emulator from iTerm, it was running correctly, but when I tried to run tests I just got the error `ECONNREFUSED ::1:8080` and no other feedback
    - There was nothing in `firestore-debug.log` and nothing on the command line in the emulator
  - I tried stopping the emulator, killing the process and restarting the emulator, but still had same problem
  - I tried restarting laptop, but still had same problem
  - But then I ran the emulator from within the VS Code terminal instead of in iTerm, and that seemed to fix it.
    - Note that after I'd done that, I could stop it in VS Code (Ctrl + C) and then start it again in iTerm and it worked fine. V odd.
  - See also [Running emulator on another port](#running-emulator-on-another-port)

## Running emulator on another port

- I found myself experimenting with security rules in a separate project - with its own Firebase emulator - while also running a local version of Construct on its own emulator
  - My test emulator was running on a separate port
- This IS possible, but it's quite difficult to get your tests to attach to the correct emulator
  - (You might get `ECONNREFUSED` errors)
- I achieved it by doing three things, all illustrated below:
  - 1. Edit `firebase.json` to indicate emulator should run on a different port
    - See [below](#1-edit-firebasejson)
  - 2. Edit your test file to indicate emulator is running on a different port
    - See [below](#2-edit-your-test-file)
  - 3. Remove any calls in your tests to `clearFirestoreData`
    - See [below](#3-remove-calls-to-clearfirestoredata)

### 1. Edit firebase.json

- Add a firestore section with host and port:

```js
{
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  },
  "emulators": {
    "singleProjectMode": true,
    "firestore": {
      "host": "127.0.0.1",
      "port": "4401"
    }
  }
}
```

### 2. Edit your test file

- Add a call to `db.settings` to specify the port. The `ssl` part is also important:

```js
function getFirestore(auth){
  const db = firebase.initializeTestApp({
    projectId: MY_PROJECT_ID,
    auth: auth,
  }).firestore();
  db.settings({ host: "localhost:4401", ssl: false });
  return db;
}
```

### 3. Remove calls to clearFirestoreData

- I tried many many things to get calls to `clearFirestoreData` working on an emulator on a different port
- None of them worked
- I found the following links:
  - https://stackoverflow.com/questions/74821542/why-an-error-connect-econnrefused-127-0-0-18080-occurs-when-testing-firestore
  - https://github.com/firebase/firebase-js-sdk/issues/3355
  - https://stackoverflow.com/questions/72749391/firebase-admin-gives-error-econnrefused-on-connecting-to-auth-emulator/73179684#73179684
  - https://github.com/firebase/firebase-functions-test/blob/master/src/providers/firestore.ts#L280C18-L280C27
  - https://github.com/firebase/firebase-functions-test/issues/193
- As a result, I tried all of the following, in various combinations and in various places in the code

```js
  process.env.FIRESTORE_EMULATOR_HOST = 'localhost:4401';
  process.env.FIREBASE_AUTH_EMULATOR_HOST = 'localhost:4401';
  process.env.FIRESTORE_EMULATOR_HOST = '127.0.0.1:4401';
  process.env.FIREBASE_AUTH_EMULATOR_HOST = '127.0.0.1:4401';
  process.env.FIRESTORE_PORT = 4401;
  process.env.NODE_OPTIONS='--dns-result-order=ipv4first';
```

- I couldn't get it to work no matter what I did
- In the end I just resigned to not clearing my test data down when I was working with multiple emulators
- In the process of the above, I discovered that even if you go back to the default port, calls to `clearFirestoreData` might still be messed up
  - In this case, some or all of the following will fix it:
  - Restart the emulator
    - You might also need to kill it with `pkill -f "firebase/emulators"`
  - Run the tests without any calls to `clearFirestoreData`
  - Run the tests with calls to `clearFirestoreData` in `after` only (not in `beforeEach`)

## My questions to the firebase community

### Difference between firebase testing node modules

Hi
Not sure if this is the right channel but…

I’m writing some unit tests for firebase security rules, in a code base that’s already been created. I’ve watched some great firecast videos from @toddkerpelman that talk about using `firebase.initializeAdminApp` for admin access so you can (for instance) create test data.

Like this:

```js
const firebase = require('@firebase/testing');
const db = firebase.initializeAdminApp({
    projectId: MY_PROJECT_ID,
  }).firestore();
```

But in the code I'm editing, it looks like this:

```js
import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
const adminApp = initializeApp({
  projectId,
});
const adminDB = getFirestore(adminApp);
```

Are these two things basically the same thing? If not, what's the difference?

I guess really I'm interested in the difference between the `@firebase/testing` and `firebase-admin` node modules, and where’s the best place to go to find documentation.

```js
it("can't create matchboxes if fields are not valid", async () => {
    const db = testEnv.authenticatedContext(userID).firestore();
    const query = db.collection("matchboxes").doc(userID);
    await assertFails(query.set(user));
  });
```

- I got the following answer in Firebase Community Slack from `Greg Fenton (GDE for Firebase)` on 17/11/24:

"The API syntax has evolved since Todd’s videos.  So yes, the two are the same thing.  We no longer import firebase as a single thing (that included every single component that is under the Firebase umbrella whether you used it or not).  Now we import from the only modules that we use such as `firebase-admin/app` and `firebase-admin/firestore`."

- My follow-up:

"OK, thank you.
But `@firebase/testing` is still available and still works? Is that for backwards compatibility?
Also it looks like the actual functions available have changed, eg `initializeApp` instead of `initializeAdminApp`. Is this documented somewhere?"