---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Widget-Layout
---

# Widget Layout

## Contents of this page:

- [See also...](<#see also>)
- [Useful layout resources](<#useful layout resources>)
- [Troubleshooting Color Hex values](<#troubleshooting color hex values>)
- [Use the widget inspector / layout explorer](<#use the widget inspector  layout explorer>)
- [Aligning text to the left](<#aligning text to the left>)
- [Layout constraints](<#layout constraints>)
- [Expanded vs flexible](<#expanded vs flexible>)
- [Add borders](<#add borders>)
- [Troubleshooting layout](<#troubleshooting layout>)
  - [Find the widget inspector / layout explorer](<#find the widget inspector  layout explorer>)
  - [Infinite size / blank screen](<#infinite size  blank screen>)
  - [Alternatives to IntrinsicHeight or IntrinsicWidth](<#alternatives to intrinsicheight or intrinsicwidth>)
  - [Persuading a widget to have a particular width or height](<#persuading a widget to have a particular width or height>)
  - [Getting a row / col to have width / height of its widest / highest widget](<#getting a row  col to have width  height of its widest  highest widget>)
  - [Cutting too-long text short and replacing it with ellipsis](<#cutting too long text short and replacing it with ellipsis>)
  - [Give text a background colour](<#give text a background colour>)
  - [When width or height is unconstrained](<#when width or height is unconstrained>)

## See also...

- [Separate section in flutter.md](flutter.md#visual-styling-and-layout)
- ...which contains...
  - [Themes](flutter.md#themes)
  - [Styling](flutter.md#styling)
  - [Centring widgets on the screen](flutter.md#centring-widgets-on-the-screen)
  - [Creating space between elements on the screen](flutter.md#creating-space-between-elements-on-the-screen)
  - [Preventing visual clashes with OS features](flutter.md#preventing-visual-clashes-with-os-features)
  - [Giving a button an icon](flutter.md#giving-a-button-an-icon)
  - [Other components helpful for layout](flutter.md#other-components-helpful-for-layout)

## Useful layout resources

- [Catalog of layout widgets](https://docs.flutter.dev/ui/widgets/layout)
- [Common flutter errors](https://docs.flutter.dev/testing/common-errors)
- [Guide to layout constraints](https://docs.flutter.dev/ui/layout/constraints)

## Troubleshooting Color Hex values

- I found something on the internet recommending `Color(0xff7c94b6)` for a color value
  - But when I asked for a hex value I was told `#EFEFEF`
  - Flutter complained at `Color(0xEFEFEF)` - it wanted eight characters after `0x`
  - I tried `0x00EFEFEF`, `0xEFEFEF00`... no dice.
  - The solution was to add package `hexcolor` to pubspec.yaml and then use `HexColor("#EFEFEF")`
  - See below for full explanation from Chad of all of this
- There are three ways of getting colors:

```dart
Row (
  children: [
    DecoratedBox(
      decoration: const BoxDecoration(
        border: null,
        color: Colors.blue, // Use preset color
      ),
      child: Text("text 1", style: textTheme),
    ),
    DecoratedBox(
      decoration: const BoxDecoration(
        border: null,
        color: Color(0xff7c94b6), // Use 0x prefix
      ),
      child: Text("text 2", style: textTheme),
    ),
    DecoratedBox(
      decoration: BoxDecoration(
        border: null,
        color: HexColor("#EFEFEF"), // Use # notation
      ),
      child: Text("text 3", style: textTheme),
    ),
  ],
),
```

- Chad explained it all!
  - "Color wants an ARGB integer - I'm assuming it's to make colours cross platformable? ARGB is 8 digits rather than 6 - you can't set the transparency using # colours in html which is where the confusion is I think!
  - so `#EFEFEF` becomes `0xFFEFEFEF`
  - `0x` indicates we want to use a hexadecimal number (hex colour) (this is what the # is for in CSS)
  - `FF` is the Alpha (A) part of the integer which sets the transparency to 255 - which is missing from a `#` colour
  - ...and then we can append the hex value without the `#`
  - [this tool](https://jonas-rodehorst.dev/tools/flutter-color-from-hex) helps illustrate how the value is formed
  - the list of built in Colors and their hex integers is [here](https://api.flutter.dev/flutter/material/Colors-class.html)
  - I didn't use the `HexColor` package as it felt unmaintained but maybe its fine?"

## Use the widget inspector / layout explorer

- Tutorial for layout explorer [here](https://docs.flutter.dev/tools/devtools/inspector)
  - you can also click the "Watch tutorial" button at the bottom of the explorer
- If you've lost it / want to know how to open it, see [below](<#find the widget inspector  layout explorer>) on how to find it
- If you want to see an inspected widget be highlighted in the running app, see "Flutter: inspect widget" [below](<#find the widget inspector  layout explorer>)
- If there are errors in your layout, you'll get a red box and arrows you can click to find the places in the layout where the errors are

## Aligning text to the left

- Wrap in a Row element, and set `mainAxisAlignment`:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "my text",
      style: textTheme,
    ),
  ],
),
```

## Layout constraints

- [Comprehensive guide here](https://docs.flutter.dev/ui/layout/constraints)
- It can be a bit difficult to follow / to get what you want from it though
- Here are the key points:
- "Constraints go down. Sizes go up. Parent sets position."
- "When you specify a width / height on a Container, you're not constraining Container. You're constraining the child of Container."

## Expanded vs flexible

- More [here](https://api.flutter.dev/flutter/widgets/Flexible-class.html)
  - and [here](https://stackoverflow.com/questions/52645944/flutter-expanded-vs-flexible)
- If you want to fill a particular area of screen, use `Expanded` or `Flexible`
- It has to be a child of `Row`, `Column` or `Flex`
- `Expanded` will mean the available space is definitely filled
- `Flexible` will mean each widget only takes as much space as it needs, but won't take more than its share
  - So if there are three flexible items in one row, each one will take MAX a third of the width of the row, even if two of them don't need a third of the space
  - The one that's too wide, if text, will wrap to increase height but keep only a third of the width
- If you want one widget to be anchored, with other widgets filling available space...
  - eg one widget anchored on the left, with other widget(s) filling the remaining space in the row
  - ...then have a Row, with the first child NOT contained in an `Expanded` widget...
  - ...but all subsequent widgets in the row should be contained in their own `Expanded` widgets
- By default, all `Expanded` items under the same parent (eg a row) will equally share the space available
  - Set the `flex` property if you want particular items to fill a particular proportion of the screen
  - This is a number out of 10
  - So if you have two widgets, and want one widget to take 30%, and the other to take 70% of the available space...
    - give the first one `flex: 3` - and the other `flex: 7`
    - Make sure all flexes add up to 10
    - In the below example, the two text items will fill all the space in the row, with a ratio 3:7

```dart
Row (
  children: [
    Expanded(
      flex: 3,
      child: Text(
        "my text",
        style: textTheme,
      ),
    ),
    Expanded(
      flex: 7,
      child: Text(
        "my text",
        style: textTheme,
      ),
    ),
  ],
),
```

## Add borders

- [More here](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html)
- Use `BoxDecoration`
- Set the `border` property
- `border: null` for no border
- For a thick curved border, like this:

```dart
Container(
  decoration: BoxDecoration(
    color: const Color(0xff7c94b6),
    image: const DecorationImage(
      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      fit: BoxFit.cover,
    ),
    border: Border.all(
      width: 8,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
)
```

## Troubleshooting layout

### Find the widget inspector / layout explorer

- If the widget tree won't refresh and is just blank, restart VS Code
- To get it back again, after closing it:
  - Check you haven't dragged it into a separate window first! Use Cmd + backtick to see if there's another window lurking somewhere
  - Click the blue square icon on the far right end of the floating toolbar that has the Hot Reload button
  - ... or Cmd + Shift + P - search for "flutter: inspect"
    - You'll get two options: 
    - 1. "Open DevTools widget inspector page" 
      - which opens up the tool in VS Code
      - then you can select widgets from the tree on the left
      - note that IF you also turn on "inspect widget" (see below), they will also be highlighted in the running app, so you can tell what you've selected
      - More on the inspector [above](<#use the widget inspector  layout explorer>)
    - 2. "Flutter: inspect widget"
      - This will highlight the current widget in the running app
        - but I can't work out whether this works if you don't have the widget inspector open
        - so far, I've only seen this work to highlight a widget you've selected in the widget inspector
      - or "Flutter: Cancel widget inspection" if you already clicked on this
      - note that sometimes it seems to disappear and you have to cancel and then inspect again to get it back
      - I think this might be because you've selected something in the widget inspector that's not currently visible on screen? But sometimes it happens even when it's visible on screen
      - Anyway this seems separate to selecting something in the widget inspector - you can select someting in the widget inspector, but it won't get highlighted in the app unless you've also turned on "Flutter: inspect widget"

### Infinite size / blank screen

- If you remove a parent widget and the screen, or parts of the screen, go blank as a result, check the Debug Console
- If you have an error about something "given an infinite size during layout", it means there is no parent in the widget tree determining the height or width of the wrapped widget.
- The solution is to insert a `SizedBox` or `Container` or `Expanded` or `Flexible` widget somewhere up in the parent hierarchy, and get them to specify height and/or width
  - see [Expanded vs flexible](<#expanded vs flexible>)

### Alternatives to IntrinsicHeight or IntrinsicWidth

- `IntrinsicHeight` and `IntrinsicWidth` will size things according to the dynamic size of the largest item in the row / column
- But if you just want to specify an absolute height / width, use `SizedBox` or `Container`

### Persuading a widget to have a particular width or height

- "When you specify a width / height on a Container, you're not constraining Container. You're constraining the child of Container."
- See [constraints](<#layout constraints>)

### Getting a row / col to have width / height of its widest / highest widget

- More [here](https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html)
- Use `IntrinsicWidth` or `IntrinsicHeight`
- It's potentially slow though
  - Use `SizedBox` instead if possible
- Use `IntrinsicWidth` like this:

```dart
IntrinsicWidth(
  child: Column(
    children: [
      Text(
        "my text",
        style: textTheme,
      ),
      Text(
        "this is a lot more text, this will define the overall width of the column",
        style: textTheme,
      ),
    ],
  ),
),
```

### Cutting too-long text short and replacing it with ellipsis

- More [here](https://dev.to/rowan_ibrahim/flutter-overflow-fixes-simple-guide-to-overflow-2c09)
- Use `overflow` within a `Text` widget
- Like this - anything after two lines will be replaced with `...` at the end of the second line:

```dart
Text(
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  "my text",
  style: textTheme,
),
```

### Give text a background colour

- Use `DecoratedBox` and populate its `color` property
- See [here](<#troubleshooting color hex values>) for discussion of different ways of specifying colour

### When width or height is unconstrained

- If there's overflow, you might get a visible yellow/black bar in the app
- When you look in the layout explorer, you'll see it says "unconstrained" for height or width
- You might be able to see smeting in the hierarchy which you think _ought_ to be constraining the height/width
- ...but bear in mind that some constraining widgets only affect their immediate children
- For instance, the `Link` widget in this hierarchy will NOT have constrained width, and that means the too-long link text will not have the overflow ellipsis applied
- ...but the simple `Text` widget at the bottom WILL have constrained width, and the overflow ellipsis WILL be applied

```dart
Expanded(
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Link(
            uri: Uri.parse('/rings/${ring.id}/home'),
            builder: (context, followLink) {
              return InkWell(
                onTap: followLink,
                child: const Text(
                  overflow: TextOverflow.ellipsis,
                  "Some very long text that is so very very long that it will definitely overflow",
                ),
              );
            },
          ),
        ],
      ),
      const SizedBox(height: 6),
      const Text(
        overflow: TextOverflow.ellipsis,
          "Some very long text that is so very very long that it will definitely overflow",
      ),
    ],
  ),
),
```

- The reason is that the `Link` widget has been wrapped in a `Row`
- The outer `Expanded` widget is constraining the width of the second `Text` element, but it only works on immediate children. The extra `Row` widget has terminated the flow of constraints from the `Expanded` widget.
- One solution is to remove the `Row` element...
- This code will work, but the text will no longer be left-justified (which is why a `Row` was added in the first place): 

```dart
Expanded(
  child: Column(
    children: [
      Link(
        uri: Uri.parse('/rings/${ring.id}/home'),
        builder: (context, followLink) {
          return InkWell(
            onTap: followLink,
            child: const Text(
              overflow: TextOverflow.ellipsis,
              "Some very long text that is so very very long that it will definitely overflow",
            ),
          );
        },
      ),
      const SizedBox(height: 6),
      const Text(
        overflow: TextOverflow.ellipsis,
          "Some very long text that is so very very long that it will definitely overflow",
      ),
    ],
  ),
),
```

- Instead, you must wrap the `Link` widget in an extra `Expanded` widget, as shown below.
- Note that it doesn't work if you wrap the `Row` in an extra `Expanded` widget - I'm not sure why!

```dart
Expanded(
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Link(
              uri: Uri.parse('/rings/${ring.id}/home'),
              builder: (context, followLink) {
                return InkWell(
                  onTap: followLink,
                  child: const Text(
                    overflow: TextOverflow.ellipsis,
                    "Some very long text that is so very very long that it will definitely overflow",
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 6),
      const Text(
        overflow: TextOverflow.ellipsis,
          "Some very long text that is so very very long that it will definitely overflow",
      ),
    ],
  ),
),
```

