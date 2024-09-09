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