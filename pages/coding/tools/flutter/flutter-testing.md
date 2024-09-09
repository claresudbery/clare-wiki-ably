---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Flutter-Testing
---

# Flutter Testing

## Contents of this page:

- [Creating a simple test project](#creating-a-simple-test-project)
- [Testing dependency injection](#testing-dependency-injection)
- [Testing blocs](#testing-blocs)
- [Run tests](#run-tests)
- [Testing firebase code](#testing-firebase-code)
  - [Mocking Firebase](#mocking-firebase)
  - [Testing real-time Firebase queries](#testing-real-time-firebase-queries)
- [Useful mocking tips](#useful-mocking-tips)
  - [When and how to use When](#when-and-how-to-use-when)
  - [Troubleshooting Null is not a subtype of type Future](#troubleshooting-null-is-not-a-subtype-of-type-future)
  - [Named params in when clauses](#named-params-in-when-clauses)
  - [Inspecting what has been passed to a mock](#inspecting-what-has-been-passed-to-a-mock)
- [Testing navigation / routing](#testing-navigation--routing)
  - [Sample hand-cranked navigation testing code v1](#sample-hand-cranked-navigation-testing-code-v1)
  - [Sample hand-cranked navigation testing code v2](#sample-hand-cranked-navigation-testing-code-v2)
- [Testing the return value of a dialog](#testing-the-return-value-of-a-dialog)

## Creating a simple test project

- I've created an app [here](https://github.com/claresudbery/flutter-test-app/tree/main/testing_app) purely for the purpose of writing / running tests
- This is what I did to create this v simple test app
  - Use the following commands to get started:

```bash
flutter create --empty testing_app
cd testing_app
flutter pub add provider go_router dev:test 'dev:flutter_driver:{"sdk":"flutter"}' 'dev:integration_test:{"sdk":"flutter"}'
flutter run
```

  - Add a `test` folder at the same level as `lib`
  - Add a `test` file in the `test` folder, eg `test/sample_code_test.dart`
  - Remove all the following folders from the same level as `lib` and `dart`:
    - (You'll be left with only `lib` and `test` folders, apart from hidden folders) 
    - Remove `windows`, `web`, `ios`, `android`, `linux` and `macos` folders 
  - Fwiw I used [this codelab](https://codelabs.developers.google.com/codelabs/flutter-app-testing#2) to arrive at this point, but I ended up removing most of the code that was added via that tutorial
- ! Note that if you want to open this code in VS Code, you have to open the parent folder (`flutter-test-app`) not the app folder (`testing_app`), or VS Code will complain.
- These are the files / folders I ended up with:
  - You'll see that I was able to create a very minimal solution, with only the following files:
    - `lib/main.dart`
    - `test/sample_code_test.dart` (the name of this file is up to you)
    - ...and in the root folder:
      - `analysis_options.yaml`
      - `devtools_options.yaml`
      - `pubspec.lock`
      - `pubspec.yaml`
      - `README.md`
  - In my local file system there are some more files, which don't get checked into github but get created as a result of running the app / tests in VS Code:
    - There is a `build` folder
    - There is a hidden `.dart_tool` folder
    - There are the following hidden files in the root folder:
      - `.flutter-plugins`
      - `.flutter-plugins-dependencies`
      - `.gitignore`
      - `.metadata`

## Testing dependency injection

- See [here](flutter-di.md#testing)

## Testing blocs

- See [here](bloc.md#testing-blocs)

## Run tests

To run all tests:

- In VS Code: Select the whole test folder in the explorer, right-click and choose Run tests
- On command line (from the `test` folder): `flutter test .`

To run all tests in one file:

- In Visual Studio: Open test file and click run button top right (or use the Run menu, or F5)
- On command line (from the `app` folder): `flutter test test/helpers/date_time_formatter_test.dart`

To run only a single flutter test:

- `flutter test test/path/to/file --name nameOfTest`

...Or a group of tests:

- `flutter test --name nameOfGroup`

You can also TAG tests within your testing code, then run tests that match that tag:

- `flutter test --tags chrome`

...eg, taken from the dart test page:

```dart
void main() {
  test('launches two browsers at once', () {
    // ...
  }, tags: ['chrome', 'firefox']);
}
```

More info on Flutter tests [here](https://docs.flutter.dev/cookbook/testing/unit/introduction).

## Testing Firebase code

### Mocking Firebase

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

### Testing real-time Firebase queries

- I've put a hacky way of doing this in [construct-hacks](flutter-construct/construct-hacks.md#testing-real-time-firebase-queries) 

## Useful mocking tips

### When and how to use When

- If you don't use the return value, you don't need to use the `when()` formation - it's irrelevant
    - But if you do use the return value and the return value is `Future<void>`, either of the following formations will work:
    - `.thenAnswer((_) async {})`
    - `.thenAnswer((_) => Future.value())`
    - (otherwise, if you try to do `thenReturn(null)`, you get the error "The argument type 'Null' can't be assigned to the parameter type 'Future<void>'")
    - Note that if the return value is `Future<void>` then it only needs stubbing if the test itself actually uses the `await` keyword. If the `await` keyword is (for instance) in the `onSubmit()` method for a widget and the test uses `await tester.pumpWidget`, then you don't actually need to stub the method that returns `Future<void>`.
        - I'm still a little confused by this, but I've proved it's the case for the call to `usersRepository.createUserIdentity` in `display_name_test`
- See [below](#named-params-in-when-clauses) if you have named params in the thing you are mocking
- See [below](#troubleshooting-null-is-not-a-subtype-of-type-future) for errors caused by bad config of `when` clauses

### Troubleshooting Null is not a subtype of type Future

- If the return value is passed along somewhere in the code under test, even if it's not actually used, then if you haven't set up a `when()` clause correctly, you'll get the following error: "_TypeError (type 'Null' is not a subtype of type 'Future<void>')"
- This is because the default behaviour of the mock is to return null, if you haven't specified otherwise
- Note that this can also happen if you do have a `when()` call, but the specified params don't match those used during the actual call - for instance if there are optional named calls that you have covered with something like `any(named: "matchboxID")` (see below)
- You can use `@GenerateMocks` and `build_runner` to get past null issues
    - See [here](https://github.com/dart-lang/mockito/blob/master/NULL_SAFETY_README.md)
    - and [here](https://stackoverflow.com/questions/67371802/dart-type-null-is-not-a-subtype-of-type-futurestring-in-mockito)

### Named params in when clauses

- If you have named params, you have to add them to the `when()` thing or your `when()` setup will be ignored
- You can use `any()` for optional named params, but have to do it like this: 
    - `matchboxID: any(named: "matchboxID"),`
        - or like this: [eek sorry, can't remember what I planned to put here!]
    - If you just do this: `matchboxID: any(),`
    - ... you'll get this error: "Invalid argument(s): An argument matcher (like `any()`) was either not used as an immediate argument to Symbol("createUserIdentity") (argument matchers can only be used as an argument for the very method being stubbed or verified), or was used as a named argument without the Mocktail "named" API (Each argument matcher that is used as a named argument needs to specify the name of the argument it is being used in. For example: `when(() => obj.fn(x: any(named: "x")))`)."
- Optional named params look like this (they are the ones in the `{}` - ie `name` and `role`): 

```dart
Future<void> createUserIdentity(
    String userID,
    String ringID, {
    String? name,
    UserRole? role,
}) async {
```

- If you use `any()` for optional named params, then you'll be able to capture if one of them doesn't get called
- Mostly when stubbing, you can pass `_` through to say you don't care what the params are
    - Like this: `.thenAnswer((invocation) => Future.value(challengee));`
        - More [here](https://pub.dev/packages/mockito)
    - ...but if you want to know more about exactly what was passed through to a mock, see [below](#inspecting-what-has-been-passed-to-a-mock)

### Inspecting what has been passed to a mock

- If you want to know more about exactly what was passed through to a mock
    - You can pass `invocation` through in the `thenAnswer` clause
    - then access `invocation.namedArguments[Symbol('argName')]`
    - Like this:

```dart
)).thenAnswer((Invocation invocation) {
final namedArgs = invocation.namedArguments;
final onData = namedArgs[Symbol('onData')] as Function(Photo);
final onDone = namedArgs[Symbol('onDone')] as Function();
final onError = namedArgs[Symbol('onError')] as Function(dynamic);

return Stream<Photo>.fromFuture(
    Future<Photo>.delayed(Duration(milliseconds: 50), () => Photo()),
).listen(onData, onDone: onDone, onError: onError, cancelOnError: true);
});
```
        
- More on that [here](https://stackoverflow.com/questions/58453530/dart-mockito-how-to-call-function-argument-in-mocked-method)

- You can also use `captureAny`:

```dart
final verifyRhet = verify(
  () => mockRhetsRepository.postRhet(captureAny<Rhet>()),
);
```

- I wanted to ensure the service was posting a rhet for the specific matchbox
- by using `captureAny<Rhet>` we can obtain the rhet that was passed:

```dart
final Rhet postedRhet = verifyRhet.captured.first;
expect(postedRhet.matchboxID, equals(matchboxID));
```

- the reason I'm doing this is because Dart can't do equality checks between two instances unless you override `==` on a class
    - more [here](Dart#equality-checks-in-dart)

## Testing navigation / routing

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

### Sample hand-cranked navigation testing code v1

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

### Sample hand-cranked navigation testing code v2

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

## Testing the return value of a dialog

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

