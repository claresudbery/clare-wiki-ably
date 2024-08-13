---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Flutter-Debugging
---

# Flutter Debugging

## Contents of this page:

- [Debugging](#debugging)
- [Seeing call stack](#seeing-call-stack)
- [debug text / logging / debug strings](#debug-text--logging--debug-strings)

## Debugging

- Debug console
  - Type the thing you want to know about
  - eg var name
  - or even limited function calls - eg simple local functions
  - but also things like `res.data()` in a firebase repository after a query's been done
  - then you can expand result using arrows on left

## Break on exception

- If there are errors during the running of the app, VS Code will break on exception
  - typically means the code will pause on an `await` statement
  - it will seize control of everything, so you might suddenly find yourself typing somewhere unexpected!

## Seeing call stack

- In VS Code, click the Debug Play button (triangle with insect) on the left
- It will give you a panel, bottom left, with call stack

## debug text / logging / debug strings

- If you want to debug while testing, you could use my [ridiculous hack](flutter-testing.md#testing-exactly-whats-happening-in-some-code)
- ...or if you want to output debug strings:
    - `import 'package:flutter/foundation.dart';` 
    - `debugPrint("****** HOOY 02, output = $thing");`