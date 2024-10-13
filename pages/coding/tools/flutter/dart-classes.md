---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Dart-Classes
---

# Dart Classes

## Contents of this page

- [Intro](#intro)
- [Declaring Classes](#declaring-classes)
- [Instance variables](#instance-variables)
- [Constructors](#constructors)
  - [Default constructors](#default-constructors)
  - [Generative constructors](#generative-constructors)
  - [Named constructors](#named-constructors)
  - [Other constructors](#other-constructors)
- [Initializing instance variables](#initializing-instance-variables)
  - ['Initializing formal' parameters](#initializing-formal-parameters)
  - [Initializer lists](#initializer-lists)
  - [Initialising inherited variables](#initialising-inherited-variables)
- [Mixins](#mixins)
- [Private classes](#private-classes)

## Intro

- Mixin-based inheritance means that although every class (except for the top class, Object?) has exactly one superclass, a class body can be reused in multiple class hierarchies.
  - See [below](#mixins) for more on mixins
- You can create an object using a constructor. Constructor names can be either `ClassName` or `ClassName.identifier`.

```dart
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});

// The following code has the same effect, but uses the optional new keyword before the constructor name:
var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
```

## Declaring Classes

- Objects have members consisting of functions and data (methods and [instance variables](#instance-variables), respectively).
- See [sample code](flutter-test-app/testing_app/test/sample_code_test.dart) for some tests that play around with constructors and parameters
  - To run the tests, navigate to `flutter-test-app/testing_app` and run `flutter test` from the command line
- Here's a pretty typical class declaration:

```dart
class Thing {
  // Instance variables with implicit getters
  final String? id;
  final DateTime? startDate;
  String authorID; // non-final means implicit setter too

  // Generative constructor
  Thing({
    // Named initializing formal parameters
    this.id,
    required this.startDate,
    required this.authorID,
  });

  // class member method
  bool hasStarted() {
    return DateTime.now().isAfter(startDate!);
  }
}
```

- There are various ways of constructing classes...
  - [Default constructors](#default-constructors)
  - [Generative constructors](#generative-constructors)
  - [Named constructors](#named-constructors)
  - [Other constructors](#other-constructors)
  - ['Initializing formal' parameters](#initializing-formal-parameters)
  - [Initializer lists](#initializer-lists)
- See [sample code](flutter-test-app/testing_app/test/sample_code_test.dart) for some tests that play around with constructors and parameters
  - To run the tests, navigate to `flutter-test-app/testing_app` and run `flutter test` from the command line

## Instance variables

- Here's how you declare instance variables (class properties):

```dart
class Point {
  double? x; // Declare instance variable x, initially null.
  double z = 0; // Declare z, initially 0.
}
```

- All non-nullable instance variables must be initialised 
  - but this can happen via initializing formal params
  - or the initializer list of a constructor
  - it doesn't have to happen at the point of declaration
  - see [below](#initializing-instance-variables) for more
- Implicit getters and setters:
  - All instance variables generate an implicit getter method. 
  - Non-final instance variables and `late final` instance variables without initializers also generate an implicit setter method.
  - See [here](dart.md#final-and-const) for more on `const and final`

```dart
class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
}

void main() {
  var point = Point();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.
}
```

## Constructors

### Default constructors

- If you don't declare a constructor, Dart uses the default constructor. 
- The default constructor is a [generative constructor](#generative-constructors) without arguments or name.

### Generative constructors

- The simplest kind.
- Has the same name as the class.
- Doesn't have to have a body.

```dart
class Thing {
  double wotsit = 1;
  Thing();
}
```

- Generative constructors don't need bodies, but they can have them.

```dart
class Thing2 {
  double wotsit = 2;
  
  Thing2(bool addTen) {
    wotsit = addTen ? wotsit + 10 : wotsit; 
  }
}
```

### Named constructors

- Use a named constructor to implement multiple constructors for a class or to provide extra clarity
- Prefix the constructor name with the name of the class

```dart
class Thing6 {
  double wotsit = 10;

  Thing6();

  Thing6.plusTen() {
    wotsit = wotsit + 10;
  }

  Thing6.minusFive() {
    wotsit = wotsit - 5;
  }
}
```

### Other constructors

- [Constant constructors](https://dart.dev/language/constructors#constant-constructors)
- [Factory constructors](https://dart.dev/language/constructors#factory-constructors)
- [Redirecting constructors](https://dart.dev/language/constructors#redirecting-constructors)

## Initializing instance variables

### 'Initializing formal' parameters

- To simplify the common pattern of assigning a constructor argument to an instance variable, Dart has initializing formal parameters.
- These seem to be the most common.
- They have (what seems to me (Clare)) a slightly odd syntax. 
- In the constructor declaration, include `this.<propertyName>`
- By specifying `this.x` in the parameter list, you're specifying that the instance variables will be initialised before the constructor body runs.

```dart
class Thing3 {
  double wotsit;

  // Generative constructor with initializing formal parameter.
  // Needs to have the same name as the class.
  // Doesn't have to have a body.
  Thing3(this.wotsit);
}
```

- No body needed with initializing formal parameter, but you can still have one.

```dart
class Thing4 {
  double wotsit;
  
  // Sets the wotsit instance variable before the constructor body runs.
  Thing4(this.wotsit, bool addTen) {
    wotsit = addTen ? wotsit + 10 : wotsit; // wotsit will be initialised to the value passed in, THEN potentially amended further
  }
}
```

- Initializing formal params can be 
  - [optional positional](dart-params.md#positional-parameters)
  - [named](dart-params.md#named-parameters)
  - In this case they need default values (unless nullable or [required](dart-params.md#required-parameters))
- No matter whether optional, named, or named and required, they can all be used in either 
  - [generative constructors](#generative-constructors)
  - or [named constructors](#named-constructors)

```dart
class Thing5 {
  double x;
  double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Thing5({required this.x, required this.y});

  // Initializing formal parameters can also be optional positional.
  Thing5.optionalPositional([this.x = 0.0, this.y = 0.0]);

  // Initializing formal parameters can also be named.
  Thing5.named({this.x = 0.0, this.y = 0.0});

  // Initializing formal parameters can also be named and required.
  Thing5.requiredNamed({required this.x, required this.y});
}
```

### Initializer lists

- You can initialize instance vars at the point of declaration - this seems to be sometimes called an intializer list:

```dart
class Thing7 {
  double x = 10.5;
  double y = 11.9;
}
```

- ...or you can add an initializer list to a generative or named constructor.
- All non-nullable instance variables must be initialised 
  - but this can happen via initializing formal params
  - or the initializer list of a constructor
  - it doesn't have to happen at the point of declaration
- Warning: The right-hand side of an initializer list can't access `this`.
- More [here](https://dart.dev/language/constructors#use-an-initializer-list)

```dart
class Point {
  double x;
  double y;

  // Initializer list sets instance variables before
  // the constructor body runs.
  Point()
    : x = 10.0,
      y = 11.0 {
    print("Hello");
  }

  // Initializer list sets instance variables before
  // the constructor body runs.
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }

  // To validate inputs during development, use assert in the initializer list.
  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
}
```

### Initialising inherited variables

- More [here](https://dart.dev/tools/linter-rules/use_super_parameters)
- In the following examples, the parent class `ShortcutManager` constructor takes a `shortcuts` parameter 
- and so does the `LoggingShortcutManager` constructor
- but it just passed its parameter straight through to the parent class for initialisation:

```dart
class LoggingShortcutManager extends ShortcutManager {
  LoggingShortcutManager({super.shortcuts});
}
```

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

## Private classes

- The underscore at the start of `_MyHomePageState` in [this commit](https://github.com/claresudbery/Flutter_codelab_namer_app/commit/161dbb89bcf7d0ea0e4a3ea52049cb85fcd7437b) makes that class private and is enforced by the compiler.