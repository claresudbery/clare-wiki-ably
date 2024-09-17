import 'package:test/test.dart';
import 'package:testing_app/code_structures/constructors.dart';
import 'package:testing_app/code_structures/elseif_vs_division.dart';
import 'package:testing_app/code_structures/parameters.dart';

void main() {
  group('Class fiddling', () {
    test(
      'Trivial generative constructor',
      () async {
        final thing = Thing();

        expect(thing.wotsit, equals(1));
      },
      tags: ['constructors'],
    );

    test(
      'Constructor with body - executed according to params - passing true in',
      () async {
        final thing = Thing2(true);

        expect(thing.wotsit, equals(12));
      },
      tags: ['constructors'],
    );

    test(
      'Constructor with body - executed according to params - passing false in',
      () async {
        final thing = Thing2(false);

        expect(thing.wotsit, equals(2));
      },
      tags: ['constructors'],
    );

    test(
      'Generative constructor with initializing formal parameters',
      () async {
        final thing = Thing3x(3.0, 3.5);

        expect(thing.x, equals(3.0));
      },
      tags: ['constructors'],
    );

    test(
      'Generative constructor with initializing formal parameter and no other initialization',
      () async {
        final thing = Thing3(3.5);

        expect(thing.wotsit, equals(3.5));
      },
      tags: ['constructors'],
    );

    test(
      'Generative constructor with initializing formal parameters setting values before the constructor body runs, passing true in',
      () async {
        final thing = Thing4(5, true);

        expect(thing.wotsit, equals(15));
      },
      tags: ['constructors'],
    );

    test(
      'Generative constructor with initializing formal parameters setting values before the constructor body runs, passing false in',
      () async {
        final thing = Thing4(5, false);

        expect(thing.wotsit, equals(5));
      },
      tags: ['constructors'],
    );

    test(
      'Named class constructor with optional positional initializing formal parameters - passing nothing in',
      () async {
        final thing = Thing5.optionalPositional();

        expect(thing.x, equals(0.0));
        expect(thing.y, equals(0.0));
      },
      tags: ['constructors'],
    );

    test(
      'Named class constructor with optional positional initializing formal parameters - passing something in',
      () async {
        final thing = Thing5.optionalPositional(5);

        expect(thing.x, equals(5));
        expect(thing.y, equals(0.0));
      },
      tags: ['constructors'],
    );

    test(
      'Named class constructor with optional positional initializing formal parameters - passing everything in',
      () async {
        final thing = Thing5.optionalPositional(5, 6);

        expect(thing.x, equals(5));
        expect(thing.y, equals(6));
      },
      tags: ['constructors'],
    );

    test(
      'Named class constructor with named initializing formal parameters - passing nothing in',
      () async {
        final thing = Thing5.named();

        expect(thing.x, equals(0.0));
        expect(thing.y, equals(0.0));
      },
      tags: ['constructors'],
    );

    test(
      'Named class constructor with named initializing formal parameters - passing one value in',
      () async {
        final thing = Thing5.named(x: 8);

        expect(thing.x, equals(8));
        expect(thing.y, equals(0.0));
      },
      tags: ['constructors'],
    );

    test(
      'Named class constructor with named initializing formal parameters - passing a different value in in',
      () async {
        final thing = Thing5.named(y: 9);

        expect(thing.x, equals(0.0));
        expect(thing.y, equals(9));
      },
      tags: ['constructors'],
    );

    test(
      'PARAMETERS',
      () async {
        final thing = ParameterPlayground(y: 9);
        const param2 = 2;
        const param3 = 3;

        thing.positionalParams(0);
        thing.positionalParams(0, param2);
        thing.positionalParams(0, param2, param3);

        thing.defaultPositionalParams(0);
        thing.defaultPositionalParams(0, param2);
        thing.defaultPositionalParams(0, param2, param3);

        thing.namedParams(0);
        thing.namedParams(param3: param3, param2: param2, 0);
        thing.namedParams(param2: param2, 0, param3: param3);
        thing.namedParams(param3: param3, 0);

        thing.defaultNamedParams(0);
        thing.defaultNamedParams(param3: param3, param2: param2, 0);
        thing.defaultNamedParams(param2: param2, 0, param3: param3);
        thing.defaultNamedParams(param3: param3, 0);

        thing.requiredNamedParams(param3: param3, param2: param2, 0);
        thing.requiredNamedParams(param2: param2, 0, param3: param3);

        expect(thing.x, equals(0.0));
      },
      tags: ['params'],
    );

    test(
      'elseif vs truncating division',
      () async {
        int defaultValue = 7;

        compareElseIfWithDivision(defaultValue, 100, 1);
        compareElseIfWithDivision(defaultValue, 180, 1);
        compareElseIfWithDivision(defaultValue, 200, 2);
        compareElseIfWithDivision(defaultValue, 280, 2);
        compareElseIfWithDivision(defaultValue, 300, 3);
        compareElseIfWithDivision(defaultValue, 380, 3);
        compareElseIfWithDivision(defaultValue, 400, 4);
        compareElseIfWithDivision(defaultValue, 480, 4);
        compareElseIfWithDivision(defaultValue, 500, 5);
        compareElseIfWithDivision(defaultValue, 580, 5);
        compareElseIfWithDivision(defaultValue, 600, 6);
        compareElseIfWithDivision(defaultValue, 680, 6);
        compareElseIfWithDivision(defaultValue, 700, defaultValue);
        compareElseIfWithDivision(defaultValue, 1200, defaultValue);
      },
      tags: ['elseif'],
    );
  });
}

void compareElseIfWithDivision(
  int defaultValue, int documentLength, int expectedValue) {
  int elseIfVersion;
  int modVersion;
  elseIfVersion = elseIfCode(documentLength, defaultValue);
  expect(elseIfVersion, equals(expectedValue));
  modVersion = truncatingDivision(documentLength, defaultValue);
  expect(modVersion, equals(elseIfVersion));
}
