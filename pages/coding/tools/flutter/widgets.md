---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Widgets
---

# Widgets

## Contents of this page:

- [Finding useful widgets etc](#finding-useful-widgets-etc)
- [Get a dialog to return a value](#get-a-dialog-to-return-a-value)
- [Streams vs futures](#streams-vs-futures)

## Finding useful widgets etc

- [Material components](material.md)

## Get a dialog to return a value

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

- From [here](https://stackoverflow.com/questions/59768792/how-to-get-a-value-from-a-dialog-in-flutter)

# Streams vs futures

- a future gives you a thing from the database and that's it, you've got it, won't know if it changes
- streams open a connection that stays open, like a web socket, with events notifying you of changes

