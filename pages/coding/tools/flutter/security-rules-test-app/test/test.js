const assert = require('assert');
const firebase = require('@firebase/testing');

const MY_PROJECT_ID = "security-rules-test-app-43bc6";

describe("Our security rules test social app", () => {

  it ("Can read items in the read-only collection", async() => {
    const db = firebase.initializeTestApp({projectId: MY_PROJECT_ID}).firestore();
    const testDoc = db.collection("readonly").doc("testDoc");
    await firebase.assertSucceeds(testDoc.get());
  })

  it ("Cannot write items to the read-only collection", async() => {
    const db = firebase.initializeTestApp({projectId: MY_PROJECT_ID}).firestore();
    const testDoc = db.collection("readonly").doc("testDoc2");
    await firebase.assertFails(testDoc.set({foo: "bar"}));
  })
})