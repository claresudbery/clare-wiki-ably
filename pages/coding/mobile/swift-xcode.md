---
layout: page
location: "pages/coding/mobile/leaf"
permalink: /pages/coding/mobile/Swift-and-XCode
---

## GitHub Repos

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [SquareFillXCode (PRIVATE)](https://github.com/claresudbery/SquareFillXCode)
- [ios-app-experiments (PRIVATE)](https://github.com/claresudbery/ios-app-experiments)
    - Can't quite remember what this is, but seems to be me learning about making iOS games?

## Converting from Swift 3.0 to Swift 5.0

- I found this slightly hard but not as bad as I feared. Basically I did the following:
    - Upgraded XCode
    - Manually changed the code from Swift 3.0 to Swift 4.0 by editing `SWIFT_VERSION` in `MyProjectName.xcodeproj/project.pbxproj`
    - Used the migration tool (Edit... Convert... To Current Swift syntax) to convert from Swift 4.0 to Swift 5.0.
- I documented the full process vis a question in Stack Overflow [here](https://stackoverflow.com/questions/69354121/how-do-i-migrate-from-swift-3-using-xcode-12-4/69354203#69354203).

## Deploying to your phone

- Add your apple ID:
    - XCode menu => Preferences => Accounts
    - Click the + button bottom left
    - Add your Apple ID
- Plug your phone to laptop in using lightining cable
- Select your phone as deployment target
    - Product => Destination => select your phone under iOS device
- If you get errors about unsupported iOS version:
    - In Terminal: `cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport`
    - Look for the folder representing the highest version below your actual iOS version
    - duplicate that into a version representing actual iOS version
        - to find your iOS version:
        - on your phone go to Settings => General => Software Version
        - only one decimal point needed - eg if phone is 14.7.1 then folder can be named `14.7`
        - like this: `sudo cp -r 14.5 14.7`
    - Product => Clean build folder
    - Close everything and start up again
    - If it fails while trying to run, instead of just copying what you already have, copy it from the 14.5 folder contained in [this zip file](https://github.com/iGhibli/iOS-DeviceSupport/blob/master/DeviceSupport/14.5(FromXcode_12.5_Release_Candidate_xip).zip)
    - More [here](https://stackoverflow.com/questions/67863355/xcode-12-4-unsupported-os-version-after-iphone-ios-update-14-7)
        - including detailed instructions of what to close and what to open and in what order

## Fixing problems with developer licence / signing certificate apple ID after you reset keychain password

- fix Apple account
    - XCode menu => Preferences => Accounts
    - Re-enter details
- fix signing certificate
    - select project name in left panel
    - in middle panel, click Signing & Capabilities at top of panel
    - select project target on left
    - there will be errors with things you can click to re-enter password - probably in two places

# When it tells you to check Devices & Simulators window

- Go to Windows => Devices and Simulators