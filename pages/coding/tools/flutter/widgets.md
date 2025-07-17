---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Widgets
---

# Widgets

## Contents of this page:

- [Intro to widgets](<#intro to widgets>)
- [Finding useful widgets etc](<#finding useful widgets etc>)
- [Get a dialog to return a value](<#get a dialog to return a value>)
- [Streams vs futures](<#streams vs futures>)
- [Keyboard Shortcuts](<#keyboard shortcuts>)
  - [Flutter Shortcuts, Actions and Intents](<#flutter shortcuts actions and intents>)
  - [The Shortcuts Widget](<#the shortcuts widget>)
  - [Handling Keyboard Shortcuts in the Quill Editor](<#handling keyboard shortcuts in the quill editor>)
  - [Bug in Quill Editor's Overriding of Keyboard Shortcuts](<#handling keyboard shortcuts in the quill editor>)
- [Quill Editor](<#quill editor>)
- [Widget layout](<#widget layout>)
- [Common flutter errors](<#common flutter errors>)

## Intro to widgets

- See [here](/pages/coding/tools/flutter/Flutter#widgets)

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

## Streams vs futures

- a future gives you a thing from the database and that's it, you've got it, won't know if it changes
- streams open a connection that stays open, like a web socket, with events notifying you of changes

## Keyboard Shortcuts

### Flutter Shortcuts, Actions and Intents

- [High-level overview](https://docs.flutter.dev/ui/interactivity/actions-and-shortcuts#shortcuts)
- See [below](<#the shortcuts widget>) for the `Shortcuts` widget
- Note that there are several `Intent` classes built in to Flutter, which are mapped to `Action` classes behind the scenes, and just work.
  - For instance: `SelectAllTextIntent`, `DoNothingIntent`, `PreviousFocusIntent`, `NextFocusIntent`
    - More [here](https://api.flutter.dev/flutter/widgets/NextFocusIntent-class.html)
    - and [here](https://api.flutter.dev/flutter/widgets/DoNothingAction-class.html)
  - There is also `DoNothingAndStopPropagationIntent`
    - ...and to be honest I'm still a bit confused about whether this means "do nothing if encountered at this point in the widget tree, but don't propagate this behaviour any further down the tree" or whether it means "do nothing at this point in the widget tree and all the way down to the bottom", but I _think_ it's the former.
    - More [here](https://api.flutter.dev/flutter/widgets/DoNothingAction-class.html)
- Intents can be a bit confusing.
- On their own they don't do much - they're really just types
- This is why when you see `Intent` class definitions, they don't contain much functionality, and can be as simple as this:

```dart
class InsertWordIntent extends Intent {
  final Document myDoc;
  final String word;
  const InsertWordIntent(this.myDoc, this.word);
}
```

- ...but their power lies in their relationship with `Action` classes.
- In the example below, the `InsertWordAction` expects to be informed by an `InsertWordIntent` which keeps track of the word to be inserted.

```dart
class InsertWordAction extends Action<InsertWordIntent> {
  InsertWordAction();

  @override
  void invoke(covariant InsertWordIntent intent) => intent.myDoc.replace(0, intent.word.length, intent.word);
}
```

- The final piece of the puzzle comes when Intents are mapped to Actions, for instance in a `Shortcuts` widget - see [example below](<#the shortcuts widget>)

### The Shortcuts Widget

- [Main documentation](https://docs.flutter.dev/ui/interactivity/actions-and-shortcuts#shortcuts)
- The `Shortcuts` widget allows you to define what happens in response to keyboard shortcuts
- It can be placed higher up in the widget tree to define what happens for its children
  - BUT if its children have their own shortcut definitions, it can also be placed LOWER in the tree (ie as the child of another widget) to override keyboard shortcuts
- There are some examples [here](https://api.flutter.dev/flutter/widgets/Shortcuts-class.html)
- Example - this will define the Cmd + 1 shortcut for the child text input so that it will result in inserted text:

```dart
Widget buildShortcuts() {    
  return 
  Shortcuts(
    shortcuts: <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit1):
        InsertWordIntent(document, "WORD-INSERTED"),
    },
    child: Actions(
      actions: <Type, Action<Intent>>{
        InsertWordIntent: InsertWordAction(),
      },
      child: 
      const TextField(
        decoration: InputDecoration(
          hintText: 'overridden keyboard shortcuts in here',
        ),
      ),
    ), 
  );
}
```

- You can get more control via the `Shortcuts manager`
  - More [here](https://docs.flutter.dev/ui/interactivity/actions-and-shortcuts#the-shortcutmanager)
  - It is a longer-lived object than the `Shortcuts` widget
  - It contains the logic for deciding how to handle the keys, the logic for walking up the tree to find other shortcut mappings, and maintains a map of key combinations to intents.
  - You can subclass it to customize its functionality.
  - Like this:

```dart
class LoggingShortcutManager extends ShortcutManager {
  LoggingShortcutManager({super.shortcuts});

  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      debugPrint('************************* Handled shortcut $event in $context');
    } else {
      debugPrint('************************* shortcut $event in $context WAS ALREADY HANDLED');
    }
    return result;
  }
}

Widget buildShortcuts() {    
  return Shortcuts.manager(        
    manager: LoggingShortcutManager(
      shortcuts: <ShortcutActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.digit1, meta: true):
            InsertWordIntent(widget.editorController.document, "5-UPSTREAM"),
      },
    ),
    child: Actions(
      actions: <Type, Action<Intent>>{
        InsertWordIntent: InsertWordAction(),
      },
      child: CsQuillEditor(
        controller: widget.editorController,
        placeholder: "What the hell 3?",
        onAnnotationClick: onAnnotationClick,
      ),
    ),
  );
}
```

- Notes:
  - Remember you can use Ctrl + Shift + R => Wrap Widget when the cursor is placed in the name of a widget to wrap that widget with a `Shortcuts` widget
  - In some contexts you can use either `LogicalKeySet` (as above) or `SingleActivator` (see below)
    - `LogicalKeySet` is a type of `ShortcutActivator`
    - `SingleActivator` is also a type of `ShortcutActivator`
    - When using `SingleActivator`, you specify additional keys like Shift, Ctrl or Cmd via the additional params (see below)
  - Alpha keys are expressed as `LogicalKeyboardKey.keyQ` etc, 
    - ...and numeric are 
      - `LogicalKeyboardKey.digit1` etc 
      - or `LogicalKeyboardKey.numpad1` etc
  - There is a `DefaultTextEditingShortcuts` also available - ore [here](https://api.flutter.dev/flutter/widgets/DefaultTextEditingShortcuts-class.html)
  - The `meta` key refers to the `Cmd` key or the `Windows` key
    - In the quill code, it replaces `Cmd` with `Ctrl` in some circs depending on whether it's a Mac or Windows, like this:

    ```dart
    SingleActivator(
      LogicalKeyboardKey.digit1,
      control: !isDesktopMacOS,
      meta: isDesktopMacOS,
    )
    ```

### Handling Keyboard Shortcuts in the Quill Editor

- Quill has a lot of keyboard events it handles by default
  - You can see some [here](https://github.com/slab/quill/blob/v1.3.7/modules/keyboard.js#L141)
  - ...and some more [here](https://github.com/singerdmx/flutter-quill/blob/6dbf0f7caf6da89db9eed08cb377a5458124bfc6/lib/src/editor/widgets/default_single_activator_actions.dart#L18)
    - (see [above](<#flutter shortcuts actions and intents>) for explanation of `Intent` objects)
- You can override keyboard shortcut events using the `customShortcuts` and `customActions` parameters to the `QuillEditorConfigurations` constructor 
  - We had to upgrade to flutter-quill v 10.1.7 to fix a bug in this functionality - see [below](<#bug in quill editors overriding of keyboard shortcuts>)
  - This is what it looks like:

```dart
Widget buildQuillEditor() {   
  // See above for explanation of Intents and Actions and SingleActivator
  final Map<ShortcutActivator, Intent> customShortcuts = 
    {
      const SingleActivator(LogicalKeyboardKey.digit7, meta: true): InsertWordIntent(controller.document, "1-DIGIT7"),
    };
  final Map<Type, Action<Intent>> customActions = 
    {
      InsertWordIntent: InsertWordAction(),
    };
  return QuillEditor(
      focusNode: FocusNode(),
      controller: controller,
      configurations: QuillEditorConfigurations(
        showCursor: showCursor,
        autoFocus: allowFocus,
        customShortcuts: customShortcuts,
        customActions: customActions,
      ),
      scrollController: ScrollController(),
    ); 
}
```

- Other not-so-useful links:
  - This link seems to be referring to some other kind of shortcuts (not keyboard shortcuts?) but anyway, the `characterShortcutEvents` param it refers to doesn't seem to exist, so maybe it's just old?
    - [Quill shortcut events](https://pub.dev/packages/flutter_quill#-shortcut-events)
    - Customizing shortcuts using (non-existent?) [characterShortcutEvents](https://github.com/singerdmx/flutter-quill/blob/master/doc/customizing_shortcuts.md)
  - This link is not much use to use cos it's Quill JS rather than Flutter Quill, but including it here for completeness:
    - [General quill keyboard shortcuts](https://quilljs.com/docs/modules/keyboard/#key-bindings)

### Bug in Quill Editor's Overriding of Keyboard Shortcuts

- The code which makes use of `customShortcuts` is [here](https://github.com/singerdmx/flutter-quill/blob/6dbf0f7caf6da89db9eed08cb377a5458124bfc6/lib/src/editor/widgets/keyboard_service_widget.dart#L53-L54)
- You should be able to override keyboard shortcuts by using the `customShortcuts` and `customActions` parameters to the `QuillEditorConfigurations` constructor 
- But we found we could only define new shortcuts, we couldn't override existing ones
- The problem was caused by `mergeMaps` placing `customShortcuts` as the first param instead of the second. You can see what it looks like AFTER the bugfix, [here](https://github.com/singerdmx/flutter-quill/blob/6dbf0f7caf6da89db9eed08cb377a5458124bfc6/lib/src/editor/widgets/keyboard_service_widget.dart#L53-L54)
- The order was reversed to fix the bug [here](https://github.com/singerdmx/flutter-quill/pull/2089)
- [This question](https://github.com/singerdmx/flutter-quill/discussions/931) appears to be referencing the same issue.
- It turns out that if we go forward to version `10.1.7`, that's when the above bug fix was applied (as per changelog [here](https://github.com/singerdmx/flutter-quill/blob/master/CHANGELOG.md#1017))
  - But when I tried to upgrade to that version in `pubspec.yaml`, I got a build error  
  - So I tried upgrading to latest version (currently `10.8.2`), but then I got the error `Because flutter_quill >=10.7.7 depends on quill_native_bridge >=10.5.14 <10.7.5-dev.0 which requires SDK version >=3.5.1 <4.0.0, flutter_quill >=10.7.7 is forbidden.`
  - So then I tried going to version `10.7.6` 
    - ... and initially I thought I got the same error
    - ...but then I realised the old message was just still hanging around in the debug console
    - the clue was that hiding right at the bottom of the console was `Exited(1)`, which is a GOOD thing.
    - ...So anyway, now we're on `10.7.6` and the bug is fixed
    - (Although I did notice in the process that actually the debug console was previously suggesting version `10.3.0`, but wevs)

## Quill Editor

- The repo is [here](https://github.com/singerdmx/flutter-quill)
- To look at details of different versions, see changelog [here](https://github.com/singerdmx/flutter-quill/blob/master/CHANGELOG.md)
- For notes about overriding keyboard shortcuts, see [above](<#handling keyboard shortcuts in the quill editor>) 
- For notes about a bug in overriding keyboard shortcuts, see [above](<#bug in quill editors overriding of keyboard shortcuts>)

## Widget layout

- See [dedicated page](/pages/coding/tools/flutter/widget-layout.md)

## Common flutter errors

- See [here](https://docs.flutter.dev/testing/common-errors)

