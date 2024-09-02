
import 'package:flutter_test/flutter_test.dart';

void main() {
    group('Class fiddling', () {
      test('class constructor Thing',
          () async {
        final thing = Thing();

        expect(thing.wotsit, equals(1));
      }, tags: ['clare'],);

      test('class constructor Thing2',
          () async {
        final thing = Thing2(true);

        expect(thing.wotsit, equals(12));
      }, tags: ['clare'],);

      test('class constructor Thing2',
          () async {
        final thing = Thing2(false);

        expect(thing.wotsit, equals(2));
      }, tags: ['clare'],);

      test('class constructor Thing3x',
          () async {
        final thing = Thing3x(3.0, 3.5);

        expect(thing.x, equals(3.0));
      }, tags: ['clare'],);

      test('class constructor Thing3',
          () async {
        final thing = Thing3(3.5);

        expect(thing.wotsit, equals(3.5));
      }, tags: ['clare'],);

      test('class constructor Thing4 1',
          () async {
        final thing = Thing4(5, true);

        expect(thing.wotsit, equals(15));
      }, tags: ['clare'],);

      test('class constructor Thing4 2',
          () async {
        final thing = Thing4(5, false);

        expect(thing.wotsit, equals(5));
      }, tags: ['clare'],);

      test('class constructor Thing5 optional 1',
          () async {
        final thing = Thing5.optional();

        expect(thing.x, equals(0.0));
        expect(thing.y, equals(0.0));
      }, tags: ['clare'],);

      test('class constructor Thing5 optional 2',
          () async {
        final thing = Thing5.optional(5);

        expect(thing.x, equals(5));
        expect(thing.y, equals(0.0));
      }, tags: ['clare'],);

      test('class constructor Thing5 optional 3',
          () async {
        final thing = Thing5.optional(5, 6);

        expect(thing.x, equals(5));
        expect(thing.y, equals(6));
      }, tags: ['clare'],);

      test('class constructor Thing5 named 1',
          () async {
        final thing = Thing5.named();

        expect(thing.x, equals(0.0));
        expect(thing.y, equals(0.0));
      }, tags: ['clare'],);

      test('class constructor Thing5 named 2',
          () async {
        final thing = Thing5.named(x: 8);

        expect(thing.x, equals(8));
        expect(thing.y, equals(0.0));
      }, tags: ['clare'],);

      test('class constructor Thing5 named 3',
          () async {
        final thing = Thing5.named(y: 9);

        expect(thing.x, equals(0.0));
        expect(thing.y, equals(9));
      }, tags: ['clare'],);

      test('PARAMETERS',
          () async {
        final thing = Thing5.named(y: 9);
        const param2 = 2;
        const param3 = 3;

        thing.positionalParams(0);
        thing.positionalParams(0, param2);
        thing.positionalParams(0, param2, param3);

        thing.defaultPositionalParams(0);
        thing.defaultPositionalParams(0, param2);
        thing.defaultPositionalParams(0, param2, param3);

        thing.namedParams(0);
        thing.namedParams(param3:param3, param2:param2, 0);
        thing.namedParams(param2:param2, 0, param3:param3);
        thing.namedParams(param3:param3, 0);

        thing.defaultNamedParams(0);
        thing.defaultNamedParams(param3:param3, param2:param2, 0);
        thing.defaultNamedParams(param2:param2, 0, param3:param3);
        thing.defaultNamedParams(param3:param3, 0);

        thing.requiredNamedParams(param3:param3, param2:param2, 0);
        thing.requiredNamedParams(param2:param2, 0, param3:param3);

        expect(thing.x, equals(0.0));
      }, tags: ['clare'],);
    });
  });
}

class Thing {
  double wotsit = 1;

  Thing();
}

class Thing2 {
  double wotsit = 2;
  
  Thing2(bool addTen) {
    wotsit = addTen ? wotsit + 10 : wotsit; 
  }
}

class Thing3x {
  // Initializer list of variables and values
  double x = 2.0;
  double y = 2.0;

  // Generative constructor with initializing formal parameters.
  // Sets the x and y instance variables
  // before the constructor body runs.
  Thing3x(this.x, this.y);
}

class Thing3 {
  double wotsit;

  // Generative constructor with initializing formal parameter.
  // Needs to have the same name as the class.
  // Doesn't have to have a body.
  Thing3(this.wotsit);
}

class Thing4 {
  double wotsit;
  
  // Sets the wotsit instance variable before the constructor body runs.
  Thing4(this.wotsit, bool addTen) {
    wotsit = addTen ? wotsit + 10 : wotsit; // wotsit will be initialised to the value passed in, THEN potentially amended further
  }
}

double wotsup = 10;

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

class Thing5 {
  double x;
  double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Thing5()
    : x = 10.0,
      y = 11.0 {
        print ("Hello");
      }

  // Initializing formal parameters can also be optional positional.
  Thing5.optionalPositional([this.x = 0.0, this.y = 0.0]);

  // Initializing formal parameters can also be named.
  Thing5.named({this.x = 0.0, this.y = 0.0});

  // Initializing formal parameters can also be named and required.
  Thing5.requiredNamed({required this.x, required this.y});

  void positionalParams(int param1, [Object? param2, Object? param3]) {
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

  void requiredNamedParams(int param1, {required param2, required param3}) {
      x = x + param1;
  }
}

void doStuff() {
  final thing = Thing5.named(y: 9);
  const param2 = 2;
  const param3 = 3;

  thing.positionalParams(0);
  thing.positionalParams(0, param2);
  thing.positionalParams(0, param2, param3);

  thing.defaultPositionalParams(0);
  thing.defaultPositionalParams(0, param2);
  thing.defaultPositionalParams(0, param2, param3);

  thing.namedParams(0);
  thing.namedParams(param3:param3, param2:param2, 0);
  thing.namedParams(param2:param2, 0, param3:param3);
  thing.namedParams(param3:param3, 0);

  thing.defaultNamedParams(0);
  thing.defaultNamedParams(param3:param3, param2:param2, 0);
  thing.defaultNamedParams(param2:param2, 0, param3:param3);
  thing.defaultNamedParams(param3:param3, 0);

  thing.requiredNamedParams(param3:param3, param2:param2, 0);
  thing.requiredNamedParams(param2:param2, 0, param3:param3);
}