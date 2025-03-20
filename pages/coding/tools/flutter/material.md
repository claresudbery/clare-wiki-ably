---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Material
---

# Material Components

## Contents of this page:

- [Material Components - Intro](#material-components---intro)
- [Flutter Widget for autocomplete text fields](#flutter-widget-for-autocomplete-text-fields)
- [Navigation rails](#navigation-rails)
- [The `Expanded` widget](#the-expanded-widget)
- [Placeholder](#placeholder)
- [Wrap](#wrap)
- [FittedBox](#fittedbox)
- [LayoutBuilder](#layoutbuilder)
- [ListView](#listview)
- [Images and ImagePicker](#images-and-imagepicker)
  - [Max width and max height of images](#max-width-and-max-height-of-images)
  - [Image dimension units](#image-dimension-units)

## Material Components - Intro

- [More here](https://m3.material.io/components)
- Seems to be a similar concept to Bootstrap UI templates
- based on Material Design
    - Material Design is an adaptable system of guidelines, components, and tools that support the best practices of user interface design.
- Components are interactive building blocks for creating a user interface. They can be organized into categories based on their purpose: Action, containment, communication, navigation, selection, and text input.

## Flutter Widget for autocomplete text fields

- [Here](https://api.flutter.dev/flutter/material/Autocomplete-class.html)

## Navigation rails

- Use `NavigationRail` for a list of icons to click to reach different screens or areas of functionality
- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/2bb70dbc783563ba598347c7ce9507ec701aa76f)
- You can change the `extended: false` line in NavigationRail to `true`. This shows the labels next to the icons.
- A navigation rail has destinations, with their respective icons and labels. 
- It also defines the current `selectedIndex`. 
  - A selected index of zero selects the first destination, 
  - a selected index of one selects the second destination, and so on.
- The navigation rail also defines what happens when the user selects one of the destinations with `onDestinationSelected`

## The `Expanded` widget

- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/2bb70dbc783563ba598347c7ce9507ec701aa76f)
- Expanded widgets are extremely useful in rows and columns
— They let you express layouts where some children take only as much space as they need (`SafeArea`, in the above case) and other widgets should take as much of the remaining room as possible (`Expanded`, in this case). 
- One way to think about `Expanded` widgets is that they are "greedy". 
- If you want to get a better feel of the role of this widget, try wrapping the `SafeArea` widget in the above commit with another `Expanded`
  - Two `Expanded` widgets split all the available horizontal space between themselves

## Placeholder

- a handy widget that draws a crossed rectangle wherever you place it, marking that part of the UI as unfinished.

## Wrap

- `Wrap` is a widget similar to Row or Column that automatically wraps children to the next "line" (called "run") when there isn't enough vertical or horizontal space.

## FittedBox

- `FittedBox` is a widget that automatically fits its child into available space according to your specifications.

## LayoutBuilder

- Helps make things more responsive
- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/93f0643e0914ff0e23994a8ead696d8c53cab104) for an example
- `LayoutBuilder` lets you change your widget tree depending on how much available space you have.
- You can use the refactor menu => Wrap with builder
  - (right-click => Refactor or Ctrl + Shift + R)
  - then modify the name of the newly added `Builder`to `LayoutBuilder`,
  - and modify the callback parameter list from `(context)` to `(context, constraints)`
- See [this commit]() for an example
- LayoutBuilder's `builder` callback is called every time the constraints change. This happens when, for example:
  - The user resizes the app's window
  - The user rotates their phone from portrait mode to landscape mode, or back
  - Some widget next to MyHomePage grows in size, making MyHomePage's constraints smaller
  - And so on
- Now your code can decide whether to (for instance) show a label by querying the current constraints.

## ListView

- a `Column` that scrolls
- See [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/a2c9c5cc3a84ee406b0e1694bb74a588a771a7e7) for an example

## Images and ImagePicker

### Max width and max height of images

- We're using the [`ImagePicker` class](https://pub.dev/packages/image_picker) when users upload avatars
- We've set max width and height to 400
  - This means 400 _pixels_ - see [below](#image-dimension-units)
  - But when I tried to upload an image with larger dimensions, it just shrank it down for me - didn't actually stop me
- We've set max file size to 2Mb
- File types are 
  - JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, WBMP, HEIC (iOS only)
    - Additional formats may be supported by user device.
    - I verified all the above on my macbook (Chrome) apart from Animated WebP, BMP, WBMP
    - I tried the following on my MacBook (Chrome) and they were NOT supported:
      - tiff, pdf, heic (only works on ios), jpeg-200 (`.jp2`), OpenEXR (`.exr`)
  - This is assumed, based on what's documented [here](https://api.flutter.dev/flutter/widgets/Image-class.html#:~:text=The%20following%20image%20formats%20are,supported%20by%20the%20underlying%20platform.)

### Image dimension units

- Ah ok, you can ignore the below notes, it's documented as pixels [here](https://github.com/flutter/packages/blob/main/packages/image_picker/image_picker_platform_interface/lib/src/types/image_options.dart#L62-L70)
- What are the image dimension units?
  - This is driving me mad. The `ImagePicker` class has a `pickImage` method that takes params maxWidth and maxHeight which we’re setting to 400… but 400 _what_? I can’t find documentation that tells me what the units are! I’m guessing pixels, but that’s not always the case?
  - [Where we use it](https://github.com/The-Construct-Software-Dev/construct/blob/5049b9e394992f0d1781f18cff38de823e89f26a/app/lib/screens/rings/widgets/cs_upload_ring_avatar.dart#L40)
  - [Official docs](https://pub.dev/packages/image_picker)
  - [This article says pixels though](https://www.dhiwise.com/post/streamlining-image-selection-with-flutter-image-picker-plugin), so I’m gonna go with that.
  - Docs in the file (image_picker-1.1.2/lib/image_picker.dart):

![flutter-image-picker.png](/resources/images/flutter-image-picker.png)