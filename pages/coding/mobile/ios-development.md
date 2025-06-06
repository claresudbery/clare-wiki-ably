---
layout: page
location: pages/coding/mobile/leaf
permalink: /pages/coding/mobile/iOS-Development
---

## Swift & XCode

See [separate page](/pages/coding/mobile/swift-xcode.md) - there is bound to be other iOS development stuff in there too.

## Creating icons

- If you get an "invalid binary" error when trying to deploy, this might be because you haven't created assets / icons yet. 
- [SquareFillXCode](https://github.com/claresudbery/SquareFillXCode) (accessibile to Clare only) has icons for all contexts in SquareFillXCode\Assets.xcassets\
- You can use [Icon Set Creator](https://apps.apple.com/de/app/icon-set-creator/id939343785?l=en&mt=12) to create icons.
    - Upload a 1024x1024 version of your icon
    - Select target (eg iOS)
    - Click Go and select a location
        - probably best to put it somewhere other than the target project, then copy over what you need - see below
    - It will create a folder containing an appropriate set of icons for you
        - Note that if you've selected "ios", it will probably create a folder called ios
        - Within that will probably be a sub-folder called `AppIcon.appiconset`
        - That will contain a file, `Contents.json`, which maps each of the files to a context
        - That's why the icon file names can all be based on your original file name (ie you don't have to give the icon file a special name)
        - What you actually want is for the entire `AppIcon.appiconset` folder to go into your `Assets.xcassets` folder
        - If you already have an `AppIcon.appiconset` folder in there, just replace it with the new one.
- I think [this page](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/app-icon/) is kept up to date with current icon guidelines
- On 27/9/21 it states the following: 

| Device or context	| Icon size |
| ----------------- | ---------------------- |
| iPhone	| 60x60 pt (180x180 px @3x) |
|	| 60x60 pt (120x120 px @2x) |
| iPad Pro	| 83.5x83.5 pt (167x167 px @2x) |
| iPad, iPad mini	| 76x76 pt (152x152 px @2x) |
| App Store	| 1024x1024 pt (1024x1024 px @1x) |

## Launching on the app store

- Follow the [review guidelines](https://developer.apple.com/app-store/review/)
- [How to launch (2022)](https://instabug.com/blog/how-to-submit-app-to-app-store/)
- [How to submit an updated app version](https://help.swiftic.com/hc/en-us/articles/201701881-Update-Your-App-on-the-Apple-App-Store)
- In-app purchases:
    - [Official Apple help](https://help.apple.com/app-store-connect/#/devae49fb316) 
    - [Ray Wenderlich Tutorial](https://www.raywenderlich.com/5456-in-app-purchase-tutorial-getting-started)
    - [My notes](/pages/coding/mobile/iOS-Development#in-app-purchases)

## Troubleshooting app crash / crashing on phone on startup

- See [here](/pages/coding/mobile/swift-xcode.md#troubleshooting-app-crash--crashing-on-phone-on-startup)