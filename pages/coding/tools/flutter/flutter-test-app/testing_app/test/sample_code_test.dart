
import 'package:test/test.dart';
import '../lib/code_structures/constructors.dart';
import '../lib/code_structures/parameters.dart';

void main() {
  group('Class fiddling', () {
    test('Trivial generative constructor',
        () async {
      final thing = Thing();

      expect(thing.wotsit, equals(1));
    }, tags: ['clare'],);

    test('Constructor with body - executed according to params - passing true in',
        () async {
      final thing = Thing2(true);

      expect(thing.wotsit, equals(12));
    }, tags: ['clare'],);

    test('Constructor with body - executed according to params - passing false in',
        () async {
      final thing = Thing2(false);

      expect(thing.wotsit, equals(2));
    }, tags: ['clare'],);

    test('Generative constructor with initializing formal parameters',
        () async {
      final thing = Thing3x(3.0, 3.5);

      expect(thing.x, equals(3.0));
    }, tags: ['clare'],);

    test('Generative constructor with initializing formal parameter and no other initialization',
        () async {
      final thing = Thing3(3.5);

      expect(thing.wotsit, equals(3.5));
    }, tags: ['clare'],);

    test('Generative constructor with initializing formal parameters setting values before the constructor body runs, passing true in',
        () async {
      final thing = Thing4(5, true);

      expect(thing.wotsit, equals(15));
    }, tags: ['clare'],);

    test('Generative constructor with initializing formal parameters setting values before the constructor body runs, passing false in',
        () async {
      final thing = Thing4(5, false);

      expect(thing.wotsit, equals(5));
    }, tags: ['clare'],);

    test('Named class constructor with optional positional initializing formal parameters - passing nothing in',
        () async {
      final thing = Thing5.optionalPositional();

      expect(thing.x, equals(0.0));
      expect(thing.y, equals(0.0));
    }, tags: ['clare'],);

    test('Named class constructor with optional positional initializing formal parameters - passing something in',
        () async {
      final thing = Thing5.optionalPositional(5);

      expect(thing.x, equals(5));
      expect(thing.y, equals(0.0));
    }, tags: ['clare'],);

    test('Named class constructor with optional positional initializing formal parameters - passing everything in',
        () async {
      final thing = Thing5.optionalPositional(5, 6);

      expect(thing.x, equals(5));
      expect(thing.y, equals(6));
    }, tags: ['clare'],);

    test('Named class constructor with named initializing formal parameters - passing nothing in',
        () async {
      final thing = Thing5.named();

      expect(thing.x, equals(0.0));
      expect(thing.y, equals(0.0));
    }, tags: ['clare'],);

    test('Named class constructor with named initializing formal parameters - passing one value in',
        () async {
      final thing = Thing5.named(x: 8);

      expect(thing.x, equals(8));
      expect(thing.y, equals(0.0));
    }, tags: ['clare'],);

    test('Named class constructor with named initializing formal parameters - passing a different value in in',
        () async {
      final thing = Thing5.named(y: 9);

      expect(thing.x, equals(0.0));
      expect(thing.y, equals(9));
    }, tags: ['clare'],);

    test('PARAMETERS',
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
}
