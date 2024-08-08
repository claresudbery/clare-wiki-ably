---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Flutter-DI
---

## Contents of this page:

- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()
- []()

## Dependency Injection with GetIt

- The way I've done it:
- Create an abstract class (an interface) and an implementation of that class:

```dart
abstract class IThing {
  Future<void> doStuff();
}

class Thing implements IThing {
  @override
  Future<void> doStuff() async {
    int thing = 0;
    return Future.value();
  }
```

- Register a singleton in dedicated method in `main.dart`:

```dart
void main() async {
  setupDependencyInjection();
  runApp(const MyFlutterApp());
}

setupDependencyInjection() {
  GetIt.I.registerSingleton<IThing>(
    Thing(),
  );
}
```

- Use GetIt to instantiate the object where you need it:

```dart
class MyScreen extends StatefulWidget {
  const MyScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return MyScreenState();
  }
}

class MyScreenState extends State<MyScreen> {
  final _thing = GetIt.I.get<IThing>();

  onFormSubmitted() async {
    if (_form.currentState!.validate()) {
      try {
        await doThing();
      } on Exception catch (exception) {
        _loggerService.error(exception);
      }
    }
  }

  Future<void> doThing() async {
    await _thing.doStuff();
  }
}
```

## Testing 

### Using GetIt for mocking dependencies in tests

```dart
class MockUsersRepository extends Mock implements IUsersRepository {}

void main() {
  test('My code should do a thing',
      () async {
    const personEmail = 'person@gmail.com';
    final person = User();

    var usersRepository = MockUsersRepository();
    GetIt.I.registerSingleton<IUsersRepository>(usersRepository);

    when(() => usersRepository.getUserByEmail(personEmail))
        .thenAnswer((_) => Future.value(person));
    
    verify(() => usersRepository.createUserIdentity(
          person: person,
        )).called(1);
  });
}
```

### Troubleshoot "repository is already registered inside GetIt"

- If you have more than one test in your test file, and they are all using `GetIt` for dependency injection, you'll need a separate `setUp` method:

```dart
void main() {
  final matchboxesService = MockMatchboxesService();

  setUpAll(() {
    GetIt.I.registerSingleton<ILoggerService>(MockLoggerService());
    GetIt.I.registerSingleton<IMatchboxesService>(matchboxesService);
  });
```