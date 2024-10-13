---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Navigation-And-Routing
---

## Contents of this page:

- [Redirect while routing]()
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