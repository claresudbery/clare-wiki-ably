---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Dart-Params
---

## Dart Parameters

- There are lots of different types of parameter
- It can get confusing, particularly when the compiler complains at you and tries to suggest ways of fixing things which can end up just making things worse.
- Quick summary:
  - Unless specified otherwise (as described below), all params are required and positional
  - Required params have to be present in the arg list when the function is called
  - Positional params have to be provided in the correct order when the function is called
  - Named params are denoted using `{}`, eg `void myFunc({bool namedParam}) {...}`
  - Optional positional params are denoted using `[]`, eg `void myFunc([bool optionalPositionalParam]) {...}`
  - Named params are optional by default. To make them required, add the `required` keyword
    - When they are required, they cannot have default values
    - Only named params can be marked `required`
  - Only optional params can have default values
    - Optional params MUST have default values unless they're nullable
    - This applies to both named and positional params
  - When defining a function, named and optional positional params must appear AFTER the normal params
    - You can add named OR optional positional params, but not both
  - When calling a function, named params can be placed anywhere in the argument list
    - ...but positional params cannot (the clue's in the name!)
- More detail on the different things you can do with parameters:
  - Give [default values](#parameters-default-values)
  - Have [named parameters](#named-parameters)
  - Have [positional parameters](#positional-parameters)
  - Have [optional parameters](#optional-parameters)
  - Have [required parameters](#required-parameters)

### Parameters: Default values

- You can't give default values to ordinary parameters 
- You can only do it with optional parameters (named or positional)
- Use the `=` operator
- The specified default value must be a compile-time constant

```dart
// Compile-time error:
void defaultRequiredParams(param1 = 3, param2 = 4) {  
    // CAN'T DO THIS!
}

// Compile-time error:
void defaultRequiredNamedParams({required param2 = 3, required param3 = 4}) {
    // CAN'T DO THIS!
}

// Valid: 
void defaultPositionalParams([int param2 = 3, int param3 = 4]) {
}

// Valid:
void defaultNamedParams({int param2 = 3, int param3 = 4}) {
}
```

### Named parameters

- Named params are denoted using `{}`, eg `void myFunc({bool namedParam}) {...}`
- Named params are optional by default. To make them required, add the `required` keyword (see [below](#named-parameters))
- When defining a function, named params must appear AFTER the normal params
  - You can add named OR optional positional params, but not both
- When calling a function, named params can be placed anywhere in the argument list

```dart
class Thing5 {
  double x = 10;

  void namedParams(int param1, {Object? param2, Object? param3}) {
      x = x + param1;
  }

  void defaultNamedParams(int param1, {int param2 = 3, int param3 = 4}) {
      x = x + param1;
  }
}

void doStuff() {
  final thing = Thing5();
  const param2 = 2;
  const param3 = 3;

  thing.namedParams(0);
  thing.namedParams(param3:param3, param2:param2, 0);
  thing.namedParams(param2:param2, 0, param3:param3);
  thing.namedParams(param3:param3, 0);
}
```

### Positional parameters

- Unless specified otherwise (as described below), all params are positional
- Positional params have to be provided in the correct order when the function is called
- Optional positional params are denoted using `[]`, eg `void myFunc([bool optionalPositionalParam]) {...}`
- Only optional params can have default values
  - Optional params MUST have default values unless they're nullable
- When defining a function, optional positional params must appear AFTER the normal params
  - You can add named OR optional positional params, but not both

```dart
class Thing5 {
  double x = 10;

  void positionalParams(int param1, Object? param2, Object? param3) {
      x = x + param1;
  }

  void optionalPositionalParams(int param1, [Object? param2, Object? param3]) {
      x = x + param1;
  }

  void defaultPositionalParams(int param1, [int param2 = 3, int param3 = 4]) {
      x = x + param1;
  }
}

void doStuff() {
  final thing = Thing5();
  const param2 = 2;
  const param3 = 3;

  thing.positionalParams(0, param2, param3);

  thing.optionalPositionalParams(0);
  thing.optionalPositionalParams(0, param2);
  thing.optionalPositionalParams(0, param2, param3);
}
```

### Optional parameters

- Unless specified otherwise (as described below), all params are required
- Optional params do not have to be present in the arg list when the function is called
- Named params are denoted using `{}`, eg `void myFunc({bool namedParam}) {...}`
  - Named params are optional by default. To make them required, add the `required` keyword
- Optional positional params are denoted using `[]`, eg `void myFunc([bool optionalPositionalParam]) {...}`
- Only optional params can have default values
  - Optional params MUST have default values unless they're nullable

```dart
class Thing5 {
  double x = 10;

  void optionalPositionalParams(int param1, [Object? param2, Object? param3]) {
      x = x + param1;
  }

  void defaultPositionalParams(int param1, [int param2 = 3, int param3 = 4]) {
      x = x + param1;
  }

  void namedParams(int param1, {Object? param2, Object? param3}) {
      x = x + param1;
  }

  void defaultNamedParams(int param1, {int param2 = 3, int param3 = 4}) {
      x = x + param1;
  }
}

void doStuff() {
  final thing = Thing5();
  const param2 = 2;
  const param3 = 3;

  thing.optionalPositionalParams(0);
  thing.optionalPositionalParams(0, param2);
  thing.optionalPositionalParams(0, param2, param3);

  thing.namedParams(0);
  thing.namedParams(param3:param3, param2:param2, 0);
  thing.namedParams(param2:param2, 0, param3:param3);
  thing.namedParams(param3:param3, 0);
}
```

### Required parameters

- Unless specified otherwise (as described below), all params are required
- Required params have to be present in the arg list when the function is called
- Named params are optional by default. To make them required, add the `required` keyword
  - When they are required, they cannot have default values
  - Only named params can be marked `required`
- When defining a function, named params must appear AFTER the normal params
- When calling a function, named params can be placed anywhere in the argument list

```dart
class Thing5 {
  double x = 10;

  void requiredParams(int param1, Object? param2, Object? param3) {
      x = x + param1;
  }

  void requiredNamedParams(int param1, {required param2, required param3}) {
      x = x + param1;
  }
}

void doStuff() {
  final thing = Thing5();
  const param2 = 2;
  const param3 = 3;

  thing.requiredParams(0, param2, param3);

  thing.requiredNamedParams(param3:param3, param2:param2, 0);
  thing.requiredNamedParams(param2:param2, 0, param3:param3);
}
```