const assert = require('assert');
const firebase = require('@firebase/testing');

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

  it ("Can write to a user doc with the same ID as our user", async() => {
    const db = getFirestore(myAuth);
    const testDoc = db.collection("users").doc(myId);
    await firebase.assertSucceeds(testDoc.set({foo: "bar"}));
  })

  it ("Can't write to a user doc with a different ID to our user", async() => {
    const db = getFirestore(myAuth);
    const testDoc = db.collection("users").doc(theirId);
    await firebase.assertFails(testDoc.set({foo: "bar"}));
  })
})