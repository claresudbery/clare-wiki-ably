---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Navigation-And-Routing
---

# Navigation and Routing

## Contents of this page:

- [Redirect while routing](#redirect-while-routing)
- [Testing navigation / routing](#testing-navigation--routing)
  - [Sample hand-cranked navigation testing code v1](#sample-hand-cranked-navigation-testing-code-v1)
  - [Sample hand-cranked navigation testing code v2](#sample-hand-cranked-navigation-testing-code-v2)

## Redirect while routing

- `GoRouter` has a redirect hook:

```dart
final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          redirect: myRedirect,
        ),
```

- You can then define a method (in this case `myRedirect`) that will get called to determine whether a redirect is needed.
- Return `null` if no redirect needed.
- It's also a way of creating a hook if there is code you want to be run whenever a particular route is visited

```dart
FutureOr<String?> myRedirect(
  BuildContext? context,
  GoRouterState? state,
) async {
  final bool redirectNeeded = false;

  if (state != null) {
    redirectNeeded = redirectNeeded(context, state);
  }

  if (redirectNeeded) {
    return '/somewhere-else';
  }

  return null;
}
```

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