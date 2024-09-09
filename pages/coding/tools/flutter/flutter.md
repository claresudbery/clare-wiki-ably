---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Flutter
---

# Flutter

## Contents of this page:

- [What is Flutter](#what-is-flutter)
- [Sub-pages](#sub-pages)
- [Useful links](#useful-links)
- [Installing Flutter](#installing-flutter)
- [Create / run new app](#create--run-new-app)
    - [Command line](#command-line)
    - [VS Code](#vs-code)
    - [Getting started in iOS](#getting-started-in-ios)
    - [IntelliJ IDEA](#intellij-idea)
- [Dependencies](#dependencies)
- [Troubleshooting](#troubleshooting)
- [Hot reload](#hot-reload)
- [Widgets](#widgets)
  - [App state](#app-state)
  - [Stateless vs Stateful widgets](#stateless-vs-stateful-widgets)
- [Refactoring in VS Code](#refactoring-in-vs-code)
- [Seeing possible arguments to a method](#seeing-possible-arguments-to-a-method)
- [Visual styling and layout](#visual-styling-and-layout)
  - [Themes](#themes)
  - [Styling](#styling)
  - [Centring widgets on the screen](#centring-widgets-on-the-screen)
  - [Creating space between elements on the screen](#creating-space-between-elements-on-the-screen)
  - [Preventing visual clashes with OS features](#preventing-visual-clashes-with-os-features)
  - [Giving a button an icon](#giving-a-button-an-icon)
  - [Other components helpful for layout](#other-components-helpful-for-layout)
- [Accessibility](#accessibility)

## What is Flutter

Flutter is an open-source software development kit which enables smooth and easy cross-platform mobile app development. You can build high quality natively compiled apps for iOS and Android quickly, without having to write the code for the two apps separately. All you need is one codebase for both platforms.

## Sub-pages

- [Construct hacks](flutter-construct/construct-hacks.md)
- [Construct debugging](flutter-construct/construct-debugging.md)
- [Construct infra](flutter-construct/construct-infra.md)
- [Construct examples](flutter-construct/construct-examples.md)
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

### Command line

- This is from [this tutorial](https://codelabs.developers.google.com/codelabs/flutter-app-testing?hl=en#2) to create an app for the purpose of exploring the test framework
- Run these commands:

```bash
flutter create --empty testing_app
cd testing_app
flutter pub add provider go_router dev:test 'dev:flutter_driver:{"sdk":"flutter"}' 'dev:integration_test:{"sdk":"flutter"}'
flutter run
```

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
        - but generally VS Code should do this for you, whenever it detects that pubspec.yaml has changed
    - Then you have to open `lib/main.dart`
        - You can tell you've done the right thing, because a play button will appear, top right
    - Cmd + Shift + P (View > Command Palette) => type flutter 
    - Flutter: Select Device (to select Chrome / browser or ios)
        - Or click bottom right, where it will show you which device is currently selected
        - you can start a new iOS simulator here if you want (see [iOS notes](#getting-started-in-ios))
    - F5 (Run > Start Debugging)
        - Or click the play button, top right
        - if running in iOS for the first time, it downloads ios tools which takes a while
        - ...but eventually the app will load in the simulator
        - ! If you simultaneously have a project open in IDEA, it will use the SAME ios simulator!
        - But if you then try to go back to the project you originally used to launch the device, it won't be connected to it any more
        - To get control back to IDEA, click the Stop icon (top of screen) in VS Code, and stop the app in IDEA, then run again in IDEA
    - To hot reload: Make a change in main.dart and click the lightning button in the top toolbar
      - More on this [below](#hot-reload)
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

### Getting started in iOS

- Flutter iOS Tutorial 
    - I tried the ios one: https://firebase.google.com/codelabs/firebase-ios-swift#2
    - Do not do this! It's out of date and none of it works as stated!
- Running in ios simulator
    - When I (Clare) did this, it updated a bunch of stuff - see my `ios-update` branch
    - ...then it seemed like nothing happened - it just said "Flutter: Launching..." for ages - not sure how long - 1 or 2 mins maybe?
    - ...but then it started up

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

## Dependencies

- Dependencies are configured in `pubspec.yaml`
- Update dependencies: `flutter pub get`
    - but generally VS Code should do this for you, whenever it detects that pubspec.yaml has changed

## Troubleshooting

- See also [Debugging](flutter-debugging.md)

## Hot reload

- Some things will become visible in an already-running app if you simply make changes in a file and save that file
  - Saving that file will automatically trigger a hot reload
- The following things will become visible in an already-running app if you simply make changes in a file and save that file:
  - Change some text in a widget, eg "A random silly idea:" in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/3a66e0d844a787c968ea6dc7a07de47d9ec692e0)
  - Add a button to a widget, eg `ElevatedButton` in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/3a66e0d844a787c968ea6dc7a07de47d9ec692e0)
  - Refactor some code to extract a new widget class
- I found some things did not work for hot reload, but I'm not sure if that was because I was checking out different commits, which might have been interpreted differently than saving the contents of a file

## Widgets

- Widgets are the elements from which you build every Flutter app. 
- Even the app itself is a widget 
  - Typically in `main.dart`, you'll see a call to `runApp` with a class passed in
  - That class typically extends `StatelessWidget`
    - see [below](#stateless-vs-stateful-widgets) for a discussion of stateless vs stateful widgets
  - In the class definition, you'll see an overridden definition for `Widget build` which returns a `provider` which has a `child` that represents either a page, or a router allowing different pages to be shown for different routes
  - See `main.dart` in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/3a66e0d844a787c968ea6dc7a07de47d9ec692e0) for a simple example
- A nice way to see a very simple widget is to extract a widget
  - eg if you check out the code at [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/3a66e0d844a787c968ea6dc7a07de47d9ec692e0)
  - then place the cursor in the word `Text` on line 46 and right-click => Refactor (or Ctrl _ Shift + R) and select Extract Widget
    - (in the below example I've called the widget `SillyText`)
  - You'll see the line of code is replaced with `SillyText()` and the following class is created:

```dart
class SillyText extends StatelessWidget {
  const SillyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('A random silly idea:');
  }
}
```

### App state

- (NB: We have started to use [blocs](bloc.md) to manage state)
- In the tutorial, a simple example is created with an app state that extends `ChangeNotifier` 
  - (See `main.dart` in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/3a66e0d844a787c968ea6dc7a07de47d9ec692e0))
  - This means that `MyAppState` can notify others about its own changes.
  - Because `MyAppState` extends `ChangeNotifier`, others (eg in this case `MyHomePage`) can watch it to be notified when its data changes
  - Like this: `var appState = context.watch<MyAppState>();`
    - The code in the app state can then call `notifyListeners()` to telegraph changes to state
  - The `MyAppState` change notifier is served up to the app by a `ChangeNotifierProvider` which is returned by the `Widget build` method in the `MyApp` widget
- Every widget defines a `build()` method that's automatically called every time the widget's circumstances change so that the widget is always up to date.
  - The app widget returns a provider from its build method, but the widgets used to represent pages or screens will typically return a widget or a nested tree of widgets (eg a `Scaffold`)
- Nested trees of widgets
  - Most widgets have a `child` attribute, and this shows you the parent-child relationship for that part of the widget tree
- See [below](#stateless-vs-stateful-widgets) for a discussion of stateless vs stateful widgets

### Stateless vs Stateful widgets

- In [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/3a66e0d844a787c968ea6dc7a07de47d9ec692e0), `MyAppState` is used to manage all state, and the widgets don't have any state of their own
- If you want a widget to manage its own state, use `StatefuWidget`
- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/161dbb89bcf7d0ea0e4a3ea52049cb85fcd7437b) where a `StatelessWidget` is converted to a `StatefulWidget`
- You can use the refactoring "Convert to StatefulWidget" to do this 
  - (right-click => Refactor or Ctrl + Shift + R)
- The big difference is that a class which extends `StatefulWidget` will override `createState()`
- but the other change you get when you use the refactoring is that the code which would have previously lived in the extension of `StatelessWidget` is now moved into a specially-created extension of the `State` class
  - The underscore at the start of `_MyHomePageState` in the above commit makes that class private and is enforced by the compiler.

## Refactoring in VS Code

- Access refactoring menu: Highlight relevant text, then...
  - Right-click => Refactor
  - Ctrl + Shift + R
  - ...Or F2 if you want to rename
- Different refactorings available:
  - Rename (F2)
  - Extract variable
  - Extract method
  - Extract widget
  - Wrap with widget
    - This allows you to specify a parent widget for an existing widget
    - This basically allows you to insert another widget into the widget tree hierarchy
    - It will insert the widget you want (you have to type in its name) and place the existing widget in the new widget's `child` attribute
  - Wrap with...
    - Many possible other things: Builder, Center, container, Padding, SizedBox, Row, Column etc
  - Convert to StatefulWidget (from StatelessWidget)

## Seeing possible arguments to a method

- place cursor just inside brackets and hit Cmd + Shift + Space. 
  - Might have to close down 1Password though! (Right click => quit on top system tray)
- eg `copyWith` on line 76 in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/9da9c43d8ca0b512b4ce905c6feaee98042d10bb)

## Visual styling and layout

### Themes

- You can use the app theme to have consistent styling across the app
- eg in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/18ede7853d03a217d7432c0b89ff16dfb10df7a7)
  - you see this in `MyApp` in `main.dart`, setting up the theme for the app:

```dart
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
```

  - ...and this in the `BigCard` widget, using the theme to style a card widget:

```dart
@override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asSnakeCase),
      ),
    );
  }
```

### Styling

- You can do a lot with styling (colours, themes etc)
- For more, see [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/aceb3f4d3ba266490848a2019c768bb0a789ae79) and the ones immediately preceding it
  - and [this part of the associated codelab](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#4), which explains the changes made in this series of commits

### Centring widgets on the screen

- You can arrange many things vertically on the screen by placing them inside a `Column` widget
  - One simple way to do this is to start with one widget, then wrap it in a `Column`, then add more widgets to the column
    - Place your cursor on your first item, bring up refactor menu (right-click => Refactor or Ctrl + Shift + R) and choose Wrap with Column
  - Rows work the same way as columns, except the main axis of a row is horizontal
- There are a few ways of centring things:
  - Using `mainAxisAlignment`:
    - Vertical alignment in columns:
    - By default, columns glue their children to the top of the screen
    - ...but you can centre vertically, which means things appear halfway down the screen instead
    - Do this using the `mainAxisAlignment` property: `mainAxisAlignment: MainAxisAlignment.center`
    - Note that the main axis of a column is vertical
    - See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/1a636aefbe71338ed1d9aa7979f1fe2791ed0c57)
  - Using the `Center` widget:
    - Horizontal alignment of columns:
    - To centre a column horizontally on the screen, wrap the whole thing with `Center`
    - Place your cursor on `Column`, bring up refactor menu (right-click => Refactor or Ctrl + Shift + R) and choose Wrap with Center
    - See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/07d2122cebadeef53df4a69554792f0f80093528)
  - Using `mainAxisSize`:
    - Horizontal centring of items in a row that's already wrapped in a `Center` widget:
    - The default is for items in a row to be glued to the left of the screen
    - If the row is already wrapped in a parent `Center` widget, you can set `mainAxisSize: MainAxisSize.min`
    - This tells the row not to take all available horizontal space, so it ends up with everything centred
    - See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/881ec63d550c06ab85598baa6065de50ebb66006)

### Creating space between elements on the screen

- Add a `SizedBox` widget beetween other elements - often used to create visual gaps
- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/4af6787861a2ff1593f87fc4a2f485a8874f9261)

### Preventing visual clashes with OS features 

- Use `SafeArea` to ensure that a widget is not obscured by a hardware notch or a status bar
- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/2bb70dbc783563ba598347c7ce9507ec701aa76f)

### Giving a button an icon

- Use `ElevatedButton.icon`
- See the sample code in [this codelab](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#5)
- See also [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/1c4ebf290d36aaad02058cb808f27b22015d11f7)

### Other components helpful for layout

- See the following:
  - [Navigation Rails](/pages/coding/tools/flutter/material.md#navigation-rails)
  - [Expanded](/pages/coding/tools/flutter/material.md#the-expanded-widget)
  - [Placeholder](/pages/coding/tools/flutter/material.md#placeholder)
  - [Wrap](/pages/coding/tools/flutter/material.md#wrap)
  - [FittedBox](/pages/coding/tools/flutter/material.md#fittedbox)
  - [LayoutBuilder](/pages/coding/tools/flutter/material.md#layoutbuilder)
  - [ListView](/pages/coding/tools/flutter/material.md#listview)

## Accessibility

- Flutter makes apps accessible by default. 
  - For example, every Flutter app correctly surfaces all text and interactive elements in the app to screen readers such as TalkBack and VoiceOver.
- But you can also use `Text`'s `semanticsLabel` property to override the visual content of the text widget with a semantic content that is more appropriate for screen readers
  - eg see [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/7e4d1165b59a75b6e3d42fe1ea3216d3188811fb)
  - [More on this here](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#4)
