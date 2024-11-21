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

// !! Both these values will need changing to get things working!! 
//    See firebase-security-rules.md#how-to-start-with-more-up-to-date-approach
const projectId = "security-rules-test-app-43bc6";
var serviceAccount = require("/Users/claresudbery/development/_keys/serviceAccountKey.json");

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

const myId = "user_abc";
const theirId = "user_xyz";
const modId = "user_mod";

beforeEach(async() => {
  // await testEnv.clearFirestore();
});

describe("Our security rules test social app", () => {

  it ("Can read items in the read-only collection", async() => {
    const db = testEnv.unauthenticatedContext().firestore();
    const testDoc = db.collection("readonly").doc("testDoc");
    await assertSucceeds(testDoc.get());
  })

  it ("Cannot write items to the read-only collection", async() => {
    const db = testEnv.unauthenticatedContext().firestore();
    const testDoc = db.collection("readonly").doc("testDoc2");
    await assertFails(testDoc.set({foo: "bar"}));
  })

  it ("Can write to a user doc with the same ID as our user", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.collection("users").doc(myId);
    await assertSucceeds(testDoc.set({foo: "bar"}));
  })

  it ("Can't write to a user doc with a different ID to our user", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.collection("users").doc(theirId);
    await assertFails(testDoc.set({foo: "bar"}));
  })

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

  it ("Can read a single public post", async() => {
    const postId = "public_post";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({authorId: theirId, visibility: "public"});

    const db = testEnv.unauthenticatedContext().firestore();
    const testRead = db.collection("posts").doc(postId);
    await assertSucceeds(testRead.get());
  })

  it ("Can read a private post belonging to the user", async() => {
    const postId = "my_private_post";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({authorId: myId, visibility: "private"});

    const db = testEnv.authenticatedContext(myId).firestore();
    const testRead = db.collection("posts").doc(postId);
    await assertSucceeds(testRead.get());
  })

  it ("Can't read a private post belonging to another user", async() => {
    const postId = "their_private_post";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({authorId: theirId, visibility: "private"});

    const db = testEnv.authenticatedContext(myId).firestore();
    const testRead = db.collection("posts").doc(postId);
    await assertFails(testRead.get());
  })

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

  it ("Doesn't allow a user to edit somebody else's post", async() => {
    const postId = "post_124";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({
      content: "before",
      authorId: theirId
    });

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.collection("posts").doc(postId);
    await assertFails(testDoc.update({content: "after"}));
  })

  it ("Allows a moderator to edit somebody else's post", async() => {
    const postId = "post_125";
    const setupDoc = adminDB.collection("posts").doc(postId);
    await setupDoc.set({
      content: "before",
      authorId: theirId
    });

    const db = testEnv.authenticatedContext(modId, moderatorToken).firestore();
    const testDoc = db.collection("posts").doc(postId);
    await assertSucceeds(testDoc.update({content: "after"}));
  })

  it ("Allows a user to edit their own room post", async() => {
    const postPath = "rooms/room_abc/posts/post_126";
    const setupDoc = adminDB.doc(postPath);
    await setupDoc.set({
      content: "before",
      authorId: myId
    });

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.update({content: "after"}));
  })

  it ("Allows a room mod to edit another person's room post", async() => {
    const roomPath = "rooms/room_abc";
    const postPath = `${roomPath}/posts/post_127`;
    await adminDB.doc(roomPath).set({topic: "Unit testers", roomMods: [myId, "dummy_user"]});
    await adminDB.doc(postPath).set({content: "before", authorId: theirId});

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.update({content: "after"}));
  })

  it ("Allows a user to create a post when they set themselves as the author", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_128";
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.set({
      authorId: myId, 
      content: "lorem ipsum",
      visibility: "public",
      headline: "Post headline"
    }));
  })

  it ("Doesn't allow a user to create a post when they set someone else as the author", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_129";
    const testDoc = db.doc(postPath);
    await assertFails(testDoc.set({
      authorId: theirId, 
      content: "lorem ipsum",
      visibility: "public",
      headline: "Post headline"
    }));
  })

  it ("Can't create a post with missing fields", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_130";
    const testDoc = db.doc(postPath);
    await assertFails(testDoc.set({
      authorId: theirId, 
      content: "lorem ipsum"}));
  })

  it ("Can create a post with all required and optional fields", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_131";
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.set({
      authorId: myId, 
      content: "lorem ipsum",
      visibility: "public",
      headline: "Post headline",
      location: "Manchester",
      tags: ["screenshot", "firebase"],
      photo: "photo_url"
    }));
  })

  it ("Can't create a post with unapproved fields", async() => {
    const db = testEnv.authenticatedContext(myId).firestore();
    const postPath = "posts/post_132";
    const testDoc = db.doc(postPath);
    await assertFails(testDoc.set({
      authorId: theirId, 
      content: "lorem ipsum",
      visibility: "public",
      headline: "Post headline",
      not_allowed: true
    }));
  })

  it ("Can edit a post with allowed fields", async() => {
    const postPath = "posts/post_133";
    await adminDB.doc(postPath).set({
      authorId: myId, 
      content: "before_content",
      visibility: "public",
      headline: "before_headline"
    });

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.doc(postPath);
    await assertSucceeds(testDoc.update({
      content: "after_content",
      visibility: "private",
    }));
  })

  it ("Can't edit a post with unallowed fields", async() => {
    const postPath = "posts/post_134";
    await adminDB.doc(postPath).set({
      authorId: myId, 
      content: "before_content",
      visibility: "public",
      headline: "before_headline"
    });

    const db = testEnv.authenticatedContext(myId).firestore();
    const testDoc = db.doc(postPath);
    await assertFails(testDoc.update({
      authorId: theirId, 
      content: "after_content",
      visibility: "private",
      headline: "ater_headline"
    }));
  })
});

after(async() => {
  // await testEnv.clearFirestore();
});