---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Dart
---

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
