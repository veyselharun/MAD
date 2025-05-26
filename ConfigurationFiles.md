# Android and iOS Configuration Files

## Android Configuration Files

### `build.gradle` (Project-level)
- **Path:** `android/build.gradle`
- **Description:** Contains Gradle settings for the entire project, such as plugin versions and repositories.

### `build.gradle` (App-level)
- **Path:** `android/app/build.gradle`
- **Description:** Module-specific configurations: SDK versions, build types, dependencies, signing configs, etc.

### `settings.gradle`
- **Path:** `android/settings.gradle`
- **Description:** Defines which modules are included in the build.

### `gradle.properties`
- **Path:** `android/gradle.properties`
- **Description:** Holds global Gradle properties like Java version or memory settings.

### `local.properties`
- **Path:** `android/local.properties`
- **Description:** Specifies the SDK path on your machine (auto-generated).

### `AndroidManifest.xml`
- **Path:** `android/app/src/main/AndroidManifest.xml`
- **Description:** Core manifest file defining app metadata, permissions, activities, and more.

### `strings.xml`
- **Path:** `android/app/src/main/res/values/strings.xml`
- **Description:** Contains string resources used in the app.

### `colors.xml`
- **Path:** `android/app/src/main/res/values/colors.xml`
- **Description:** Defines color values used across the app.

### `MainActivity.java` / `MainActivity.kt`
- **Path:** `android/app/src/main/java/<package>/MainActivity.java`
- **Description:** Main activity that launches the React Native or Expo app.

### `MainApplication.java` / `MainApplication.kt`
- **Path:** `android/app/src/main/java/<package>/MainApplication.java`
- **Description:** Initializes native modules and connects them to React Native.

---

## iOS Configuration Files

### `Podfile`
- **Path:** `ios/Podfile`
- **Description:** CocoaPods config file listing native dependencies and their settings.

### `Podfile.lock`
- **Path:** `ios/Podfile.lock`
- **Description:** Auto-generated lock file ensuring consistent pod versions.

### `YourProjectName.xcodeproj`
- **Path:** `ios/YourProjectName.xcodeproj`
- **Description:** Xcode project definition containing build targets, settings, and references.

### `project.pbxproj`
- **Path:** `ios/YourProjectName.xcodeproj/project.pbxproj`
- **Description:** Internal Xcode project config file; stores low-level settings and structure.

### `Info.plist`
- **Path:** `ios/YourProjectName/Info.plist`
- **Description:** Property list with essential app metadata: bundle ID, display name, permissions, URL schemes, etc.

### `AppDelegate.m` / `AppDelegate.mm`
- **Path:** `ios/YourProjectName/AppDelegate.m`
- **Description:** Entry point for the iOS app; handles native lifecycle events and React Native setup.

### `main.m`
- **Path:** `ios/YourProjectName/main.m`
- **Description:** Entry point of the app before `AppDelegate` runs. Rarely modified.

### `LaunchScreen.storyboard`
- **Path:** `ios/YourProjectName/LaunchScreen.storyboard`
- **Description:** Default launch screen interface (can be replaced with custom splash).

### `Assets.xcassets`
- **Path:** `ios/YourProjectName/Assets.xcassets/`
- **Description:** Asset catalog containing app icons, launch images, and named colors.

### `.mobileprovision`
- **Path:** `~/Library/MobileDevice/Provisioning Profiles/`
- **Description:** Provisioning profile used for code signing and distribution (not stored directly in repo).

### `YourProjectName.entitlements`
- **Path:** `ios/YourProjectName/YourProjectName.entitlements`
- **Description:** Entitlements file for App Sandbox, Keychain access, Push Notifications, etc.