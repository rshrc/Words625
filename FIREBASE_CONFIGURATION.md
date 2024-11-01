### Firebase Configuration

To enable Firebase features in this app, you need to include Firebase configuration files, which are not tracked in the repository for security reasons. This guide will show you how to get the files you need.

#### Option 1: Request Firebase Configuration Files from Our Discord Server

If you'd like to get these configuration files from our development team, please follow these steps:

1. **Join Our Discord Server**: 
   - Click on this link to join: [![Join our Discord](https://img.shields.io/discord/your_discord_server_id.svg?label=Join%20our%20Discord&logo=discord)](https://discord.gg/HqwnSZUmsz).
   
2. **Navigate to the #firebase-requests Channel**:
   - Once you’ve joined the server, locate the `#firebase-requests` channel. This channel is dedicated to handling Firebase configuration requests.

3. **Request Access to Firebase Config Files**:
   - Post a message in the `#firebase-requests` channel asking for access to the `google-services.json` file (for Android) and the `GoogleService-Info.plist` file (for iOS).
   - Mention that you’re working on the **Kannada Learning App** to help team members respond to your request faster.
   
4. **Receive and Place the Files**:
   - Once provided, download the files to your local machine.
   - Place `google-services.json` in the `android/app` directory.
   - Place `GoogleService-Info.plist` in the `ios/Runner` directory.

After placing the files, continue with the setup steps under **Run the App** below to ensure the app can find these Firebase resources.

---

#### Option 2: Generate Your Own Firebase Configuration Files

If you prefer to set up your own Firebase project, follow these steps to create and configure your own `google-services.json` and `GoogleService-Info.plist` files.

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/) and sign in with your Google account.
   - Click on **Add Project** and follow the on-screen instructions to create a new Firebase project for your Kannada Learning App.

2. **Add Android and iOS Apps to Your Firebase Project**:
   - In your Firebase project dashboard, click on the Android icon to add an Android app.

##### Configuring Firebase for Android

   1. **Register Your Android App**:
      - You’ll need the Android package name, which can be found in `android/app/src/main/AndroidManifest.xml`. Look for the `package` attribute at the top.
      - Enter the package name, give your app a nickname, and optionally provide a debug signing certificate (optional for development).

   2. **Download `google-services.json`**:
      - After registering the app, Firebase will prompt you to download the `google-services.json` file.
      - Save this file and place it in the `android/app` directory of your Flutter project.

   3. **Add Firebase SDK**:
      - Open your `android/build.gradle` (Project-level) file and add the Google services classpath:

        ```gradle
        dependencies {
            classpath 'com.google.gms:google-services:4.3.10' // Check for latest version
        }
        ```

      - Then, open `android/app/build.gradle` (App-level) and apply the `google-services` plugin at the bottom of the file:

        ```gradle
        apply plugin: 'com.google.gms.google-services'
        ```

##### Configuring Firebase for iOS

   1. **Register Your iOS App**:
      - Back in the Firebase console, click the iOS icon to add an iOS app.
      - For the **iOS bundle ID**, use the bundle identifier found in `ios/Runner.xcodeproj/project.pbxproj` (it should look something like `com.example.words625`).
      - Complete the registration and download the `GoogleService-Info.plist` file.

   2. **Download `GoogleService-Info.plist`**:
      - Place this file in the `ios/Runner` directory of your Flutter project.

   3. **Add Firebase SDK to iOS**:
      - Open your `ios/Runner.xcworkspace` in Xcode.
      - In the project navigator, select the `Runner` project and go to **Build Phases**.
      - Ensure the `GoogleService-Info.plist` file is included in the app’s resources.

#### Enabling Firebase Services in the Console

Once both Android and iOS apps are configured, enable any services you need (such as Firestore, Authentication, Analytics) from the Firebase Console. Here’s a quick overview of enabling some common services:

- **Authentication**: Go to **Authentication > Sign-in method** and enable email/password or other sign-in providers as needed.
- **Firestore**: Go to **Firestore Database** and click on **Create database** to start using Firestore.
- **Analytics**: Analytics is enabled by default, so no additional setup is required.

---

### Run the App

After adding the configuration files and enabling Firebase services:

1. Run the following commands to install dependencies and generate code:
   
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. Then, start the app:

   ```bash
   flutter run
   ```

The app should now be able to connect to Firebase for authentication, analytics, and other services.

For additional questions, join our [Discord community](https://discord.gg/HqwnSZUmsz) where we’re happy to help troubleshoot and answer questions about setup and development.