const admin = require("firebase-admin");

// Initialize Firebase Admin SDK with the service account
// Since we did not add user details to firestore
// this script takes details from firebase authentication
// and then updates the firestore document with name and profileImage
const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firestore = admin.firestore();
const auth = admin.auth();

async function updateUserProfiles() {
  const usersSnapshot = await firestore.collection("users").get();
  console.log(`Fetched ${usersSnapshot.size} users.`);

  for (const doc of usersSnapshot.docs) {
    const userData = doc.data();
    const uid = doc.id;

    // Check if fields are missing
    if (!userData.name || !userData.profileImage) {
      try {
        // Get user data from Firebase Authentication
        const userRecord = await auth.getUser(uid);
        const updates = {};

        if (!userData.name) {
          updates.name = userRecord.displayName || "Anonymous";
        }
        if (!userData.profileImage) {
          updates.profileImage = userRecord.photoURL || "default_image_url";
        }

        // Update the Firestore document
        await firestore.collection("users").doc(uid).update(updates);
        console.log(`Updated user ${uid} with data:`, updates);
      } catch (error) {
        console.error(`Error updating user ${uid}:`, error);
      }
    } else {
      console.log(`User ${uid} already has name and profile image.`);
    }
  }

  console.log("User profile update process completed.");
}

updateUserProfiles().then(() => console.log("User profiles updated."));
