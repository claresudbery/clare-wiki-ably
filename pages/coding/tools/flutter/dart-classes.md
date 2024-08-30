---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Dart-Classes
---



## Dart Classes

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

### Declaring Classes

- Objects have members consisting of functions and data (methods and instance variables, respectively).
- Here's how you declare instance variables:

```dart
class Point {
  double? x; // Declare instance variable x, initially null.
  double z = 0; // Declare z, initially 0.
}
```

- There are various ways of constructing classes...
  - [Default constructors](#default-constructors)
  - [Generative constructors](#generative-constructors)
  - [Named constructors](#named-constructors)
  - [Other constructors](#other-constructors)
  - ['Initializing formal' parameters](#initializing-formal-parameters)
  - [Initializer lists]()

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


