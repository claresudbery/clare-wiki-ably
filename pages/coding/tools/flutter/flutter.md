---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Flutter
---

## Contents of this page:

- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()

## What is Flutter 

Flutter is an open-source software development kit which enables smooth and easy cross-platform mobile app development. You can build high quality natively compiled apps for iOS and Android quickly, without having to write the code for the two apps separately. All you need is one codebase for both platforms.

## Sub-pages

- [Dart language](dart.md)
- [Material components](material.md)
- [Flutter testing](flutter-testing.md)
- [Bloc state management](bloc.md)
- [Dependency Injection](flutter-di.md)
- [Debugging](flutter-debugging.md)
- [Widgets](widgets.md)

## Useful links

- Flutter is the name of the sdk. The _language_ it uses is [Dart](dart.md)
- [Getting started](https://docs.flutter.dev/get-started/install/macos/web)
- [Codelab](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#2)
- [More tutorials and docs](https://flutter.dev/learn)
- Finding useful widgets etc: [Material Design](https://m3.material.io/)

## Installing Flutter

- [Here](https://docs.flutter.dev/get-started/install/macos/web)
- Troubleshooting: 
    - Rosetta 2 is only needed if you have Apple Silicon. It's not needed for - and can't be installed on - a Mac with an Intel processor.
    - In order for flutter to work on command line, you have to add Flutter to your path, but you need to include `/bin` at the end of the path
        - I put this line into `~/.bashrc`: `export PATH=$PATH:[path-to-flutter]/flutter/bin`
            - (replace `[path-to-flutter]` with your flutter location)
        - Then run `source ~/.bashrc`

## Create / run new app

### VS Code

- From instructions [here](https://docs.flutter.dev/get-started/test-drive?tab=vscode)
- Create a project/app:
    - This will create a Flutter project directory that contains a simple demo app that uses [Material Components](#material-components)
    - Cmd + Shift + P (View > Command Palette) => type flutter
    - Flutter: New Project
    - Which Flutter Project => Application
    - Select location
    - Enter project name, press Enter
    - Open the `lib` directory, then `main.dart`
        - The comments explain the different parts of the code
- Run the app:
    - Make sure you start by opening the correct folder 
        - it should be the app folder
        - it won't necessarily be called `app`, but it's the parent that contains the `lib` folder
    - Update dependencies: `flutter pub get`
    - Then you have to open `lib/main.dart`
        - You can tell you've done the right thing, because a play button will appear, top right
    - Cmd + Shift + P (View > Command Palette) => type flutter 
    - Flutter: Select Device
        - Or click bottom right, where it will show you which device is currently selected
        - you can start a new iOS simluator here if you want
    - F5 (Run > Start Debugging)
        - Or click the play button, top right
        - if running in iOS for the first time, it downloads ios tools which takes a while
        - ...but eventually the app will load in the simulator
        - ! If you simultaneously have a project open in IDEA, it will use the SAME ios simulator!
        - But if you then try to go back to the project you originally used to launch the device, it won't be connected to it any more
        - To get control back to IDEA, click the Stop icon (top of screen) in VS Code, and stop the app in IDEA, then run again in IDEA
    - To hot reload: Make a change in main.dart and click the lightning button in the top toolbar
- Navigation
    - Place cursor and right-click
    - For things defined in a library imported at the top of a file, choose right-click => Peek, or Option + F12
- Tutorial
    - run through the codelab [here](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0)
    - Note for Clare: For notes on where I'm up to in the tutorial, see [here](https://github.com/claresudbery/Flutter_codelab_namer_app/blob/main/README.md#where-im-up-to) 
    - See my [list of commits](https://github.com/claresudbery/Flutter_codelab_namer_app/commits/main/) to see how different things can be implemented
    - See [codelab repo](https://github.com/flutter/codelabs/tree/main/namer/step_08) to see sample code generated during codelab
    - See [advanced version](https://dartpad.dev/?id=e7076b40fb17a0fa899f9f7a154a02e8) of the app created during the tutorial
    - [More tutorials and docs](https://flutter.dev/learn)


### IntelliJ IDEA

- From instructions [here](https://docs.flutter.dev/get-started/test-drive?tab=vscode)
- Create a project/app:
    - File => New => Project...
    - Select Flutter on left
        - ! The first path at the top is NOT the location of your new project
        - It's the location of the SDK - it will probably get this right
    - Click Next
    - Enter project name and check location
        - ! If you change the project location after entering project name it won't create a new folder for you, so you probably want to do that yourself and select that as the location    
            - Easiest thing is to enter the new folder name under project location, and if that folder doesn't already exist it will create it for you
            - If you try to move stuff around / rename stuff after it's been created, the IDE doesn't cope well with this
    - Select Project Type => Application
    - Change Organization to `com.example.flutter.testdrive
    - Click Create
    - Open the `lib` directory, then `main.dart`
        - The comments explain the different parts of the code
- Run the app:
    - Select target from dropdown (top right)
    - Ctrl + R, or Click Green play button at top
    - It will spin up the selected device
        - ! If you simultaneously have a project open in VS Code, it will use the SAME ios simulator!
        - But if you then try to go back to the project you originally used to launch the device, it won't be connected to it any more
        - To get control back to VS Code, click the Stop icon (top of screen) in IDEA, and stop the app in VS Code, then run again in VS Code
    - To hot reload: Make a change in main.dart and click the lightning button 
        - It's at the BOTTOM of the screen, at the top of the console panel 
- Tutorial
    - There's a codelab [here](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#2)
    - ...but it assumes you're in VS Code

