---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Dart
---

# Dart

## Contents of this page:

- [Useful links](#useful-links)
- [Lists](#lists)
- [Sets](#sets)
- [Generics](#generics)
- [Static consts](#static-consts)
- [String interpolation](#string-interpolation)
- [The double dots / double dot operator](#the-double-dots--double-dot-operator)
- [=> notation](#-notation)
- [Equality checks in Dart](#equality-checks-in-dart)
- [dart format, etc](#dart-format-etc)
- [Trying to make things const that can't be const](#trying-to-make-things-const-that-cant-be-const)

## Useful links

- [Language tour](https://dart.dev/language)
- [DartPad](https://dartpad.dev/) - useful tool for writing Dart in the browser
    - [Here is an example](https://dartpad.dev/?id=e7076b40fb17a0fa899f9f7a154a02e8) of a Flutter app written in DartPad

## Lists

- Expressed using `[]`
- eg `var favorites = [];`
    - this is an empty list
- To specify the type of objects in the list, use [generics]

## Sets

- Expressed using `{}`

## Generics

- Expressed using `<>`
- eg `var favorites = <WordPair>[];`
    - this is an empty list of objects of type `WordPair`
    - (instances of the `WordPair` class)

## Static consts

```
class CreateMatchboxWidgetKeys {
  static const Key nameLabel = Key('Name_Label');
  static const Key descriptionLabel = Key('Description_Label');
}

...
        children: <Widget>[
          Text(
            item.title ?? '',
            key: CreateMatchboxWidgetKeys.nameLabel,
          ),
```

## String interpolation

```
var greeting = "Hello";
var person = "Rohan";

print("${greeting}, ${person}!"); // prints "Hello, Rohan!"
```

## The double dots / double dot operator

- It allows you to not repeat the same target if you want to call several methods on the same object.
- e.g without double dots:

```dart
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
```

- But after using `..`, the above code will be written like this:

```dart
var paint = Paint()
..color = Colors.black
..strokeCap = StrokeCap.round
..strokeWidth = 5.0;
```

## => notation

```dart
).thenAnswer((_) => Future.value());
```

is equivalent to

```dart
).thenAnswer((_) {
      return true;
    });
```

and

```dart
).whenComplete(() => emit(const MatchboxStateUserReady()));
```

is equivalent to

```dart
).whenComplete(() {
      debugPrint("******************* about to emit event");
      emit(const MatchboxStateUserReady());
    });
```

## Equality checks in Dart

- Dart can't do equality checks between two instances unless you override `==` on a class:

```dart
expect(postedRhet, equals(testRhet)); // false
expect(postedRhet, equals(postedRhet)); // true
```

- Bloc uses [Equatable](https://pub.dev/packages/equatable) for comparing instances of state but I wasn't sure if it would introduce too much complexity 
  - we would need to ensure we keep the `props` attribute in sync like we do with the blocs
  - it uses the props to check the values against (rather than automatically figuring out which attributes on the class to use)
  - https://github.com/felangel/equatable/blob/ed646e59e8e33942b3aa6c35cbf78e83324e3e25/lib/src/equatable_mixin.dart#L25
  - `equals(props, other.props);`

## Dart format, etc

- run the following commands before issuing a PR:

```bash
dart fix --apply
dart format .
dart analyze
```

- `dart fix --dry-run` will suggest changes based on what options are in `analysis_options.yaml`
    - `dart fix --apply` will make actual changes to fix issues
- but often those changes will result in formatting issues, eg it will add a trailing comm a but not move the final enclosing bracket to a new line
    - to fix that, run `dart format .`
    - it will fix any problems it finds
    - you need the dot at the end to specify location
- all these commands can be run on a specific file or folder
    - get the relative path of the file (right-click at the top to get relative path) and just paste it after the command
    - eg `dart fix --apply test/screens/display_name_test.dart`
    - or `dart format test/screens/display_name_test.dart`
- can also turn on format on save in VS Code => Settings => Search for format => Format on Save
    - it picks up on any settings in any formatters you have to have configured
    - because I have the Dart extension, I therefore have Dart formatting rules
    - it won't fix everything though - will still need to run `dart fix --apply` and `dart format`
- Chad has made a change to how `dart format` runs in the pipeline...
  - See [construct infra](construct-infra.md#tools-like-dart-format-in-our-pipeline)

## Trying to make things const that can't be const

- VS Code will often prompt you to make objects `const` for efficiency
- But this can lead you down the road of thinking they HAVE to be const, when they don't
- In my case it was the `expect` statement in a `blocTest`:

```dart
expect: () => [
    const MatchboxStateInitial(),
    const MatchboxStateLoading(),
  ],
```

- I then changed the second object into something that couldn't be `const`, but because the prev one was `const`, I thought this had to be `const` too.
- Led me down a whole rabit hole of trying to make something be `const` that couldn't be `const`!
- Anyway, the solution was to simply remove the `const` keyword and all was fine:

```dart
expect: () => [
    const MatchboxStateInitial(),
    MatchboxStateSuccess(matchbox: matchbox),
  ],
```

