import {
  assertFails,
  assertSucceeds,
  initializeTestEnvironment,
} from "@firebase/rules-unit-testing";
import { ref, uploadBytes } from "firebase/storage";
import { readFileSync } from "fs";
import { afterEach, describe, it } from "mocha";
import { v4 as uuid_v4 } from "uuid";

process.env.STORAGE_EMULATOR_HOST = "127.0.0.1:9199";
const projectId = "app-construct-security-rules-test";
const firebaseStorage = {
  rules: readFileSync("./../storage.rules", "utf8"),
  host: "127.0.0.1",
  port: 9199,
};

const testEnv = await initializeTestEnvironment({
  projectId: projectId,
  storage: firebaseStorage,
});

const image_for_deletion = "./image-for-deletion.png";
const deletingUserID = uuid_v4();

function userImagePath(myUserID) {
  return `images/${myUserID}`;
}

async function uploadImage(context, imagePath) {
  const imageRef = ref(context.storage(), imagePath);
  await uploadBytes(imageRef, readFileSync(image_for_deletion), {
    contentType: "image/png",
  });
}

afterEach(async () => {
  await testEnv.clearStorage();
});

describe("firebase storage security rules unit tests", () => {
  const userEmail = "jane.doe@gmail.com";
  const tokenOptions = {
    email: userEmail,
  };
  const dummy_image = "./dummy-image.png";
  const uploadingUserID = uuid_v4();

  describe("********** User `images` storage **********", () => {

    it("users can only create images stored against their own user ID", async () => {
      const storage = testEnv
        .authenticatedContext(uploadingUserID, tokenOptions)
        .storage();
      const new_image = readFileSync(dummy_image);
      const storagePath = userImagePath(uploadingUserID);
      const userImageRef = storage.ref(storagePath);

      await assertSucceeds(
        userImageRef.put(new_image, { contentType: "image/png" })
      );
    });

    it("users cannot create images stored against another user ID", async () => {
      const storage = testEnv
        .authenticatedContext(uploadingUserID, tokenOptions)
        .storage();
      const new_image = readFileSync(dummy_image);
      const otherUserID = uuid_v4();
      const storagePath = userImagePath(otherUserID);
      const userImageRef = storage.ref(storagePath);

      await assertFails(
        userImageRef.put(new_image, { contentType: "image/png" })
      );
    });

    describe("********** User image deletion **********", () => {
      beforeEach(async () => {
        return testEnv.withSecurityRulesDisabled(async (context) => {
          await uploadImage(context, userImagePath(deletingUserID));
        });
      });

      it("users can delete images stored against their user ID", async () => {
        const storage = testEnv
          .authenticatedContext(deletingUserID, tokenOptions)
          .storage();
        const storagePath = userImagePath(deletingUserID);
        const userImageRef = storage.ref(storagePath);
  
        await assertSucceeds(userImageRef.delete());
      });
  
      it("users cannot delete images stored against another user ID", async () => {
        const otherUserID = uuid_v4();
        const storage = testEnv
          .authenticatedContext(otherUserID, tokenOptions)
          .storage();
        const storagePath = userImagePath(deletingUserID);
        const userImageRef = storage.ref(storagePath);
  
        await assertFails(userImageRef.delete());
      });
    });
  });
});
