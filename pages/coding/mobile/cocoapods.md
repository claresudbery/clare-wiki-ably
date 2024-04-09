---
layout: page
location: pages/coding/mobile/leaf
permalink: /pages/coding/mobile/Cocoapods
---

## Intro

- Cocoapods is a package management system for ios development
- When you run commands like `pod install` on the command line, you're using cocoapods

## Useful links

- [documentation here](https://cocoapods.org/)

## Basics

- You list the pods (packages) you want in your `podfile`
- `pod install` when anything changes in your podfile. Will install any new pods
- `pod update` to update your pods to their newest versions

## In XCode

- If you click the file icon, top left, you should see a folder for pods
    - If it's not there yet, that's because you haven't run `pod install` yet
- This is basically a project file: `Pods.xcodeproj`
- By default this will list the pods as targets within the project
- As far as I can tell, although it seems like you can edit details for each pod, this is sort of a read-only view
    - For instance, if you change iOS deployment target for any of the pods, although it does have an impact on the next build, there doesn't seem to be any way of persisting it?
