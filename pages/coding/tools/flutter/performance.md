---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Performance
---

# Performance

## Contents of this page:

## Improving web performance

- [Optimizing performance in Flutter web apps with tree shaking and deferred loading](https://medium.com/flutter/optimizing-performance-in-flutter-web-apps-with-tree-shaking-and-deferred-loading-535fbe3cd674)
  - Includes:
    - Description of tree shaking and how the `dart2js` compiler works to optimize and eliminate dead code, by excluding unused classes or functions from the compiled JavaScript bundle
    - Explanation of how to improve performance via lazy / deferred loading
    - How to use `FutureBuilder` to have async code (eg deferred / lazy loading) in a `builder` (which are normally assumed to be synchronous)
    - How to use the Network tab in Chrome DevTools to see what gets loaded and when
    - How to defer loading of localizations in the Flutter Gallery
      - Localisations can be resource intensive - eg different languages available for different locales
- [Improving perceived performance with image placeholders, precaching, and disabled navigation transitions](https://medium.com/flutter/improving-perceived-performance-with-image-placeholders-precaching-and-disabled-navigation-6b3601087a2b)
  - Includes:
    - Using image placeholders to prevent content from jumping around after images load
      - Using the the `FadeInImage` widget
      - Using `Image.frameBuilder`
    - Precaching
    - Disabling navigation transitions
      - These tend to be used in mobile apps but not web, and disabling them for web can improve performance
      - To override this `MaterialApp` behavior, you can create your own `PageTransitionsTheme` class.
- [Building performant Flutter widgets](https://medium.com/flutter/building-performant-flutter-widgets-3b2558aa08fa)
  - Includes:
    - Paying attention to when widget `build()` methods are called - being vigilant in when and what you choose to build.
    - Calling `setState()` judiciously
    - Using `listview.builder` so that for scrolling lists, only the visible list items are rebuilt
    - Being aware that things rendered ‘invisible’ using a `ScaleTransition` might be being built unnecessarily
    - How to identify excessive widget rebuilding...
      - by using the IntelliJ [built-in tooling](https://flutter.dev/docs/development/tools/android-studio#show-performance-data)
      - by adding a bit of code to `/packages/flutter/lib/src/widgets/framework.dart`
      - by adding a `resetOutput` function
