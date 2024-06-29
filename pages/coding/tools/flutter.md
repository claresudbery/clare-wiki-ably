---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Flutter
---

# What is Flutter 

Flutter is an open-source software development kit which enables smooth and easy cross-platform mobile app development. You can build high quality natively compiled apps for iOS and Android quickly, without having to write the code for the two apps separately. All you need is one codebase for both platforms.

# Useful links

- Flutter is the name of the sdk. The _language_ it uses is [Dart](/pages/coding/lang/func/Dart)
- [Getting started](https://docs.flutter.dev/get-started/install/macos/web)
- [Codelab](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#2)
- [More tutorials and docs](https://flutter.dev/learn)

# Installing Flutter

- [Here](https://docs.flutter.dev/get-started/install/macos/web)
- Troubleshooting: 
    - Rosetta 2 is only needed if you have Apple Silicon. It's not needed for - and can't be installed on - a Mac with an Intel processor.
    - In order for flutter to work on command line, you have to add Flutter to your path, but you need to include `/bin` at the end of the path
        - I put this line into `~/.bashrc`: `export PATH=$PATH:[path-to-flutter]/flutter/bin`
            - (replace `[path-to-flutter]` with your flutter location)
        - Then run `source ~/.bashrc`

# Create / run new app

## VS Code

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


## IntelliJ IDEA

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

# Material Components

- [More here](https://m3.material.io/components)
- Seems to be a similar concept to Bootstrap UI templates
- based on Material Design
    - Material Design is an adaptable system of guidelines, components, and tools that support the best practices of user interface design.
- Components are interactive building blocks for creating a user interface. They can be organized into categories based on their purpose: Action, containment, communication, navigation, selection, and text input.

# Run tests

To run all tests in one file:

- In Visual Studio: Open test file and click run button top right (or use the Run menu, or F5)
- On command line: `flutter test path/to/test_file_test.dart`

To run all tests:

- In VS Code: Select the whole test folder in the explorer, right-click and choose Run tests
- On command line (from the folder which contains the tests): `flutter test .`

More info on Flutter tests [here](https://docs.flutter.dev/cookbook/testing/unit/introduction).

# Testing navigation / routing

- ! I think navigation and routing are two separate things?
  - Routing is about urls, but navigation is about popping and pushing screens from the navigation stack?
- See [here for some suggestions](https://stackoverflow.com/questions/50704647/how-to-test-navigation-via-navigator-in-flutter)
- See [here for some sample code](https://github.com/flutter/flutter/blob/0aadb89764611741a84465bacd90ef1eecfd3efc/packages/flutter/test/widgets/navigator_test.dart#L277C5-L279C48)
  - In our code, I coded someting similar in `display_name_test.dart` (circa 14/6/24)
    - see [sample hand-cranked code v1](#sample-hand-cranked-navigation-testing-code-v1) below
  - From same place:
  - [Flutter source code for Navigator?](https://github.com/flutter/flutter/blob/0aadb89764611741a84465bacd90ef1eecfd3efc/packages/flutter/lib/src/widgets/navigator.dart#L3453)
- See [here for a tutorial using MockNavigatorObserver](https://iiro.dev/writing-widget-tests-for-navigation-events/)
  - In our code, I coded someting similar in `display_name_test.dart` (circa 14/6/24)
    - see [sample hand-cranked code v2](#sample-hand-cranked-navigation-testing-code-v2) below
- See [here for more on navigator observers](https://medium.com/@sumit.ghoshqa/understanding-routeobserver-in-flutter-309ce2997c27)
- How to do it if you're using GoRouter / MaterialApp.router:
  - Brief notes [here](https://github.com/flutter/flutter/issues/134239)
  - [How to test GoRouter](https://guillaume.bernos.dev/testing-go-router/)
  - [More on testing GoRouter](https://stackoverflow.com/questions/77703670/unable-to-test-navigation-using-gorouter-in-my-flutter-app)
  - [A cheatsheet on routing in flutter](https://medium.com/flutter-community/flutter-navigation-cheatsheet-a-guide-to-named-routing-dc642702b98c)

## Sample hand-cranked navigation testing code v1

- See [here for some sample code](https://github.com/flutter/flutter/blob/0aadb89764611741a84465bacd90ef1eecfd3efc/packages/flutter/test/widgets/navigator_test.dart#L277C5-L279C48)
- Notes:
  - I'm testing for TWO observations because there's a push first and THEN a pop
- In the test:
- This import:

```dart
import '../helpers/observer_tester.dart';
```

- ...and then this:

```dart
    final List<NavigatorObservation> observations = <NavigatorObservation>[];

    final TestObserver navigatorObserver = TestObserver()
      ..onPopped = (Route<dynamic>? route, Route<dynamic>? previousRoute) {
        observations.add(
          NavigatorObservation(
            current: route?.settings.name,
            previous: previousRoute?.settings.name,
            operation: 'pop',
          ),
        );
      }
      ..onPushed = (Route<dynamic>? route, Route<dynamic>? previousRoute) {
        observations.add(
          NavigatorObservation(
            current: route?.settings.name,
            previous: previousRoute?.settings.name,
            operation: 'push',
          ),
        );
      };

      await tester.pumpWidget(
      ListenableProvider(
        create: (_) => authProvider,
        child: MaterialApp(
          home: const DisplayNameScreen(),
          navigatorObservers: [navigatorObserver],
        ),
      ),
    );

    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'test name');

    final joinButton = find.text('Join');
    await tester.tap(joinButton);

    expect(observations.length, 2);
    expect(observations[1].operation, 'pop');
```

- Elsewhere, in `observer_tester.dart` (which I put in a `helpers` folder in our code):

```dart
// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

typedef OnObservation = void Function(Route<dynamic>? route, Route<dynamic>? previousRoute);

class NavigatorObservation {
  const NavigatorObservation({this.previous, this.current, required this.operation});
  final String? previous;
  final String? current;
  final String operation;

  @override
  String toString() => 'NavigatorObservation($operation, $current, $previous)';
}

/// A trivial observer for testing the navigator.
class TestObserver extends NavigatorObserver {
  OnObservation? onPushed;
  OnObservation? onPopped;
  OnObservation? onRemoved;
  OnObservation? onReplaced;
  OnObservation? onStartUserGesture;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPushed?.call(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPopped?.call(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onRemoved?.call(route, previousRoute);
  }

  @override
  void didReplace({ Route<dynamic>? oldRoute, Route<dynamic>? newRoute }) {
    onReplaced?.call(newRoute, oldRoute);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onStartUserGesture?.call(route, previousRoute);
  }
}
```

## Sample hand-cranked navigation testing code v2

- See [here for a tutorial using MockNavigatorObserver](https://iiro.dev/writing-widget-tests-for-navigation-events/)
- My test code using `MockNavigatorObserver`:

```dart
class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class MockRoute extends Mock implements Route {}

void main() {

  setUpAll(() {
    registerFallbackValue(MockRoute());
  });

  testWidgets('My test',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      ListenableProvider(
        create: (_) => authProvider,
        child: MaterialApp(
          home: MyScreen(),
          navigatorObservers: [mockObserver],
        ),
      ),
    );

    final submitButton = find.text('Submit');
    await tester.tap(submitButton);

    // Verify that a pop event happened
    verify(() => mockObserver.didPop(any(), any()));
  });
}
```

# Testing the return value of a dialog

- Testing what's returned as the value/result passed to `Navigator.pop`
- I don't know if this is the best way to do it, but it works!
- I tried doing it via checking what was passed to `Navigator.pop`, but I couldn't get that to work
  - See [Stack Overflow question here](https://stackoverflow.com/questions/78679816/flutter-how-to-test-what-value-is-being-returned-via-navigator-pop)
- ...So instead I tested what was returned if I called `showDialog`:

```dart
  testWidgets('Display name screen returns false when cancelled', (WidgetTester tester) async {
    // ARRANGE
    const openDialogButtonText = 'Dummy display name launch';
    final displayNameScreen = DisplayNameScreen();
    bool result = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            child: OutlinedButton(
              child: const Text(openDialogButtonText),
              onPressed: () async {
                result = await showDialog(
                  context: tester.element(find.text(openDialogButtonText)),
                  builder: (context) => displayNameScreen,
                );
              },
            ),
          ),
        ),
      ),
    );

    // ACT
    final openDialogButton = find.text(openDialogButtonText);
    await tester.tap(openDialogButton);
    await tester.pumpAndSettle();

    final cancelButton = find.text('Cancel');
    await tester.tap(cancelButton);    

    // ASSERT
    expect(result, false);
  });
```

# Testing exactly what's happening in some code

- I came up with this probably-terrible hack to give me the equivalent of debug strings while testing!
- I injected a made-up object into the widget under test,  
  - then wrote debug strings to that object,
  - and asserted against those strings
- Like this, in the code under test:

```dart
class ClareThing {
  String test = "";
}
class DisplayNameScreen extends StatefulWidget {
  final ClareThing clareThing;

  const DisplayNameScreen({
    required this.clareThing,
  });

  @override
  State<DisplayNameScreen> createState() => DisplayNameScreenState();
}

class DisplayNameScreenState extends State<DisplayNameScreen> {
  onSubmit() async {
    if (mounted) {
      widget.clareThing.test = "MOUNTED";
    }
```

- ...then like this in the test:

```dart
    final ClareThing clareThing = ClareThing();
    clareThing.test = "start";

    await tester.pumpWidget(
      ListenableProvider(
        create: (_) => authProvider,
        child: MaterialApp(
          home: DisplayNameScreen(
                        clareThing: clareThing,
                      ),
        ),
      ),
    );

    expect(clareThing.test, "start");
```

# Mocking Firebase 

- using standard mocking - couldn't get this working 
    - [users_test.dart](/organising/private/career/Construct/jira-tickets/mock-firebase-example-1.dart)
- using FakeCloudFirestore - got this working in the end - 
    - [users_test.dart](/pages/coding/tools/testing/fake-firebase-example-2.md)
    - don't forget to edit pubspec.yaml as per comment in file
    - You also need to make sure your repository does not give a default value to its firebaseFirestoreInstance
    - (otherwise you'll get errors saying you need to call Firebase.initializeApp)
    - See https://stackoverflow.com/questions/52268590/how-to-unit-test-methods-using-firebase-cloud-firestore
    - Or probably more usefully, https://github.com/brianegan/flutter_architecture_samples/blob/master/firebase_flutter_repository/test/firebase_flutter_repository_test.dart
    - (Linked to from the stack overflow page)
    - Also try this: https://blog.victoreronmosele.com/mocking-firestore-flutter

# Dependency Injection with GetIt

- The way I've done it:
- Create an abstract class (an interface) and an implementation of that class:

```
abstract class IThing {
  Future<void> doStuff();
}

class Thing implements IThing {
  @override
  Future<void> doStuff() async {
    int thing = 0;
    return Future.value();
  }
```

- Register a singleton in dedicated method in `main.dart`:

```
void main() async {
  setupDependencyInjection();
  runApp(const MyFlutterApp());
}

setupDependencyInjection() {
  GetIt.I.registerSingleton<IThing>(
    Thing(),
  );
}
```

- Use GetIt to instantiate the object where you need it:

```
class MyScreen extends StatefulWidget {
  const MyScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return MyScreenState();
  }
}

class MyScreenState extends State<MyScreen> {
  final _thing = GetIt.I.get<IThing>();

  onFormSubmitted() async {
    if (_form.currentState!.validate()) {
      try {
        await doThing();
      } on Exception catch (exception) {
        _loggerService.error(exception);
      }
    }
  }

  Future<void> doThing() async {
    await _thing.doStuff();
  }
}
```

## Using GetIt for mocking dependencies in tests

```
class MockUsersRepository extends Mock implements IUsersRepository {}

void main() {
  test('My code should do a thing',
      () async {
    const personEmail = 'person@gmail.com';
    final person = User();

    var usersRepository = MockUsersRepository();
    GetIt.I.registerSingleton<IUsersRepository>(usersRepository);

    when(() => usersRepository.getUserByEmail(personEmail))
        .thenAnswer((_) => Future.value(person));
    
    verify(() => usersRepository.createUserIdentity(
          person: person,
        )).called(1);
  });
}
```

## Troubleshoot "repository is already registered inside GetIt"

- If you have more than one test in your test file, and they are all using `GetIt` for dependency injection, you'll need a separate `setUp` method:

```
```

# Debugging

- Debug console
  - Type the thing you want to know about
  - eg var name
  - or even limited function calls - eg simple local functions
  - but also things like `res.data()` in a firebase repository after a query's been done
  - then you can expand result using arrows on left

# debug text / logging / debug strings

- If you want to debug while testing, you could use my [ridiculous hack](#testing-exactly-whats-happening-in-some-code)

# finding useful widgets etc

- [Material Design](https://m3.material.io/)

# Get a dialog to return a value

- In the dialog code do this:

```dart
ElevatedButton(
  // Pass the value you want to return here ---------------|
  onPressed: () => Navigator.pop(context, value), //<-----|
  child: const Text('confirm'),
),
```

- Call it like this:

```dart
double? val = await showDialog<double>(  
  context: context,
  builder: (context) => const DialogOne(),
);
print('Dialog one returned value ---> $val');
```

- From [here]https://stackoverflow.com/questions/59768792/how-to-get-a-value-from-a-dialog-in-flutter