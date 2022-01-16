---
layout: page
location: pages/coding/mobile/leaf
permalink: /pages/coding/mobile/iOS-Development
---

## Swift & XCode

See [separate page](/pages/coding/mobile/iOS-Development) - there is bound to be other iOS development stuff in there too.

## Creating icons

- If you get an "invalid binary" error when trying to deploy, this might be because you haven't created assets / icons yet. 
- [SquareFillXCode](https://github.com/claresudbery/SquareFillXCode) (accessibile to Clare only) has icons for all contexts in SquareFillXCode\Assets.xcassets\
- You can use [Icon Set Creator](https://apps.apple.com/de/app/icon-set-creator/id939343785?l=en&mt=12) to create icons.
    - Upload a 1024x1024 version of your icon
    - Select target (eg iOS)
    - Click Go and select a location
    - It will create a folder containing an appropriate set of icons for you
- I think [this page](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/app-icon/) is kept up to date with current icon guidelines
- On 27/9/21 it states the following: 

| Device or context	| Icon size |
| ----------------- | ---------------------- |
| iPhone	| 60x60 pt (180x180 px @3x) |
|	| 60x60 pt (120x120 px @2x) |
| iPad Pro	| 83.5x83.5 pt (167x167 px @2x) |
| iPad, iPad mini	| 76x76 pt (152x152 px @2x) |
| App Store	| 1024x1024 pt (1024x1024 px @1x) |
