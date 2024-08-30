---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Dart
---

# Dart

## Contents of this page:

- [Useful links](#useful-links)
- [Dart Parameters](#dart-parameters)
- [Dart Classes](#dart-classes)
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

## Intro

- Dart is an object-oriented language with classes and mixin-based inheritance
  - A [mixin](#mixins) is a special kind of multiple inheritance
- Every object is an instance of a [class](#classes), and all classes except `Null` descend from `Object`

## Dart Parameters

- See [separate page](dart-params.md#dart-parameters)

## Dart Classes

- See [separate page](dart-classes.md#dart-classes)

## Mixins

- Mixins are a way of defining code that can be reused in multiple class hierarchies.
- To use a mixin, use the with keyword followed by one or more mixin names:

```dart
class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
```

- To define a mixin, use the mixin declaration. 
- Mixins and mixin classes cannot have an extends clause, and must not declare any generative constructors.

```dart
mixin Musical {

  void entertainMe() {
    print('Playing piano');
  }
}
```

- mixins can't use constructor parameters to instantiate their own fields, but it is possible to
  - Define abstract members in the mixin
  - Access state in the mixin's subclass
  - Implement an interface
  - Use the `on` clause to declare a superclass
  - Use the `mixin class` declaration to define a class that is usable as both a regular class and a mixin
    - Any restrictions that apply to classes or mixins also apply to mixin classes
- More [here](https://dart.dev/language/mixins)

## Extension methods

- Like all Dart code, extension methods are in libraries. 
- To define an extension method:

```dart
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
  // ···
}
```

- To use an extension method, just import the library it's in, and use it like an ordinary method:

```dart
// Import a library that contains an extension on String.
import 'string_apis.dart';
// ···
print('42'.padLeft(5)); // Use a String method.
print('42'.parseInt()); // Use an extension method.
```

- There are various ways to resolve API conflicts - discussed [here](https://dart.dev/language/extension-methods#api-conflicts)
- More [here](https://dart.dev/language/extension-methods)

## The dynamic type

- Use of `dynamic` is generally discouraged
- Some operations work with any possible object. 
  - For example, a `log()` method could take any object and call toString() on it. 
- Two types in Dart permit all values: `Object?` and `dynamic`. 
  - However, they convey different things. 
  - If you simply want to state that you allow all objects, use `Object?`. 
  - If you want to allow all objects except null, then use `Object`.
- The type `dynamic` not only accepts all objects, but it also permits all operations. 
  - Any member access on a value of type `dynamic` is allowed at compile time, but may fail and throw an exception at runtime. 
  - If you want exactly that risky but flexible dynamic dispatch, then `dynamic` is the right type to use.
  - Otherwise, prefer using `Object?` or `Object`. 
  - Rely on `is` checks and type promotion to ensure that the value's runtime type supports the member you want to access before you access it.
- More [here](https://dart.dev/effective-dart/design#avoid-using-dynamic-unless-you-want-to-disable-static-checking)

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
  - See [construct infra](flutter-construct/construct-infra.md#tools-like-dart-format-in-our-pipeline)

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

