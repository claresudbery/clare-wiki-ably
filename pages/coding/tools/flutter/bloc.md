---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Bloc
---

# Bloc

## Contents of this page:

- [Intro](#blocs-intro)
- [How blocs work](#how-blocs-work)
- [Adding BlocProvider and BlocListener to widgets](#adding-blocprovider-and-bloclistener-to-widgets)
- [BlocListener](#bloclistener)
  - [Intro to BlocListener](#intro-to-bloclistener)
  - [Testing BlocListener](#testing-bloclistener)
- [Testing blocs](#testing-blocs)
  - [Verifying mocks in bloc tests](#verifying-mocks-in-bloc-tests)
  - [Troubleshooting "No method stub was called from within `when()`"](#troubleshooting-no-method-stub-was-called-from-within-when)
  - [Testing widget code that uses a BlocListener](#testing-widget-code-that-uses-a-bloclistener)
- [Troubleshooting](#troubleshooting)
  - [Troubleshooting "Cannot add new events after calling close"](#troubleshooting-cannot-add-new-events-after-calling-close)
  - [Troubleshooting error on emitter.dart line 114](#troubleshooting-error-on-emitterdart-line-114)

## Blocs Intro

- Useful [getting started link](https://bloclibrary.dev/getting-started/)

## How blocs work

- in each bloc you have three things
    - the bloc - logic combining events and states - `xxx_bloc.dart`
    - the events - `xxx_event.dart`
    - the states - `xxx_state.dart`
- in `xxx_bloc.dart` in our event handler we emit states
    - in our test, we assert that those states should have been emitted
    - each state is an instance of a class
        - those classes are defined in `xxxx_state`
    - then in the screen...
        - you could (eg) have a switch statement that responds to the different states
    - when the screen starts up, it might trigger an initial Event
    - the bloc is responsible for defining what happens in response to different events
    - it will emit different states while responding to events
    - the screen might then have a switch statement that responds to different states
- events emit states 
    - the internal state of the object will change as a result of the state being emitted
    - so any data that's passed to the emit code on the new state instance will get persisted
    - this is not immediately visible - it's down to the internal plumbing of bloc code, and what happens when you call emit
- tests will always have expectation sections that say "we expect these states to be emitted, set up in this way"
    - so your expect section expects to be passed a list of state instances
        - Pedantic note: The expect section is in fact an argument being passed to the bloctest framework
    - order matters! You're basically saying, "I expect these states to be emitted in this order"
- An example - the `FetchMatchbox` event 
  - see [here](flutter-construct/construct-examples.md#the-matchbox-bloc-and-the-fetchmatchbox-event)
- An example using `BlocListener` 
  - This allows us to add functionality that needs to occur once per state change - in this case showing a Dialog
  - see [here](flutter-construct/construct-examples.md#the-matchbox-bloc-and-bloclistener)
  - also notes [below](#bloclistener)

## Adding BlocProvider and BlocListener to widgets

- It can be a bit fiddly to get everything nested in the right order.
- See skeleton examples [here](flutter-construct/construct-examples.md#nested-structures-for-blocprovider-bloclistener-etc)
- Notes:
  - The widget's `build` method gets called repeatedly, independently of whether bloc state changes
  - Every time it's called, it returns a new `BlocProvider`
  - It also calls whatever `builder` method is returned by the blocProvider
    - (which might be a previously-generated method)
  - ...but the blocProvider will only regenerate the `builder` method that's returned in the following circumstances:
    - a `buildWhen` method returns true (see [here](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocBuilder-class.html))
    - the state has changed
      - BUT not if the state has changed twice within the same bloc event handler
      - it only seems to be intersted in the final state emitted from one event handler
      - However, even though previous state changes in an event handler will not result in the builder being regenerated, the fact that the state has changed within the event handler WILL result in the final state being used for a builder regeneration
        - but if an event handler just emits one state and that state is the same state as the one previously emitted, that will NOT result in builder regeneration and will NOT result in the widget being rerendered
    - what happens in the `BlocListener` does not seem to be relevant to whether the widget is re-rendered
      - I did think maybe events had to be handled in the BlocListener in order to result in re-rendering, but that doesn't seem to be the case


## BlocListener

### Intro to BlocListener

- See documentation [here](https://bloclibrary.dev/flutter-bloc-concepts/#bloclistener)
- BlocListener is a Flutter widget which takes a BlocWidgetListener and an optional Bloc and invokes the listener in response to state changes in the bloc. It should be used for functionality that needs to occur once per state change such as navigation, showing a SnackBar, showing a Dialog, etc
- see example [here](flutter-construct/construct-examples.md#the-matchbox-bloc-and-bloclistener)
- See also [Testing widget code that uses a BlocListener](#testing-widget-code-that-uses-a-bloclistener)

### Testing BlocListener

- This approach works, using `whenListen`: https://github.com/felangel/bloc/blob/db714f374fe315dd78d644ad56daa003aca58de7/examples/flutter_weather/test/settings/view/settings_page_test.dart#L48

## Testing blocs

### Verifying mocks in bloc tests

- Add a `verify` clause:

```dart
blocTest('Does a thing',
    build: () => MyBloc(),
    setUp: () {
        when(
            () => mockMyService.doThing(
                user.id!,
            ),
        ).thenAnswer((_) => Future.value());
    },
    act: (bloc) {
        bloc.add(Myevent(user: user,),);
    },
    expect: () => [
        const MyState(),
    ],
    verify: (_) {
        verify(
            () => mockMyService.doThing(
                user.id!,
            ),
        ).called(1);
    },
);
```

- More here on how to do it if you're not using the `blocTest` syntax: https://github.com/felangel/bloc/issues/157
    - In this case you'll use `expectLater` and `then`
    - There's an example of this kind of test [here](https://github.com/brianegan/flutter_architecture_samples/blob/41a033f6e67ec51bba2edf669cfcb857498db58c/frideos_library/test/stats_bloc_test.dart#L45), although it doesn't use the `then` syntax

### Troubleshooting "No method stub was called from within `when()`"

- Error when running test: "No method stub was called from within `when()`"
- This can happen if you accidentally used a real object instead of a mock object
- But it can also happen if there is a problem with your `when` clause
- It happened to me when I had the following code:

```dart
blocTest('Does a thing',
    build: () => MyBloc(),
    setUp: () {
        when(
            () => mockMyService.doThing(
                user.id!,
            ),
        ).thenAnswer((_) => Future.value());
    },
    act: (bloc) {
        bloc.add(Myevent(user: user,),);
    },
    expect: () => [
        const MyState(),
    ],
);
```

- The problem was that `user.id` was null, so it couldn't resolve `user.id!`
- I discovered this when I removed the `when` call altogether and just ran the code. In the code itself it was passing `user.id!` into `doThing`, and I got the error "Null check operator used on a null value"
- Presumably this error was also being generated by the bloc test code, but not being handled, so it just fell through to an error abhout problem,s with the `when` clause

### Testing widget code that uses a BlocListener

- Like this:

```dart
testWidgets('If bloc has UserReady state, redirect to thing',
      (WidgetTester tester) async {
        when(() => thingBloc.state).thenReturn(
          const ThingStateInitial(),
        );
        whenListen(
          thingBloc,
          Stream.fromIterable([
            const ThingStateInitial(), // previous state
            const ThingStateUserReady(), // current state
          ]),
        );

        await tester.pumpWidget(initWidget(authProvider));
        await tester.pumpAndSettle();

        expect(find.text(thingScreenTitle), findsOneWidget);
      });
```

- ...but you don’t actually need to pass prev + current state to `whenListen`. If you’re only interested in the new state, you can just pass that in. Otherwise the listener gets triggered twice, once for each state. 
- You only need to pass both states in if you have a `listenWhen` clause set up in your `BlocListener` and you are looking at both prev and current states to decide whether to act or not. 
- You can do this instead:

```dart
testWidgets('If bloc has UserReady state, redirect to thing',
      (WidgetTester tester) async {
        when(() => thingBloc.state).thenReturn(
          const ThingStateInitial(),
        );
        whenListen(
          thingBloc,
          Stream.fromIterable([const ThingStateUserReady()]),
        );

        await tester.pumpWidget(initWidget(authProvider));
        await tester.pumpAndSettle();

        expect(find.text(thingScreenTitle), findsOneWidget);
      });
```

## Troubleshooting

### Troubleshooting bloc integration tests

- I wanted to test whether it was possible to enter, exit and then re-enter a popup dialog
- This was dependent on whether a bloc tried to emit the same state repeatedly, and how a bloc listener responded to that
- I couldn't find a way to test this by mocking the bloc - I needed a real bloc instance rather than a mocked one
- But when I tried to call `showDialog` within the tested code, the dialog widget was not being added to the widget tree and my test was failing
- The solution was to use `GetIt.RegisterFactory` within the test code instead of `GetIt.RegisterSingleton`
  - Same as [below](#troubleshooting-cannot-add-new-events-after-calling-close)
- I'm still not sure exactly why, but I think it MIGHT be something to do with the context passed to `showDialog`
- The relevant code is in `matchbox_preview.dart` and `matchbox_preview_bloc_test.dart`

### Troubleshooting "Cannot add new events after calling close"

- We got this when we entered the same screen twice
- The error was thrown the second time we entered the screen, the first time the screen tried to fire an event for a bloc
- It turned out the problem was that we were using `GetIt.RegisterSingleton` instead of `GetIt.RegisterFactory` in `main.dart`
- We changed this...

```dart
  GetIt.I.registerSingleton<ThingBloc>(
    ThingBloc(),
  );
```

- ...to this:

```dart
  GetIt.I.registerFactory<ThingBloc>(
    () => ThingBloc(),
  );
```

- Relevant links:
    - Someone else with same problem: https://stackoverflow.com/a/78253377
    - Good explanation: https://github.com/felangel/bloc/issues/1734#issuecomment-694802121

### Troubleshooting error on emitter.dart line 114

- This is actually an `async / await` problem
- This manifests really oddly
- The code stops in the debugger on whatever the previous line of code was
- But if you add debug strings you'll see the code has got past that and into the bloc event handler
- You'll probably see that `emit` has been called
- Look at the stack trace and you'll see it errored in emitter.dart
- Currently it says this: "emit was called after an event handler completed normally.
    This is usually due to an unawaited future in an event handler.
    Please make sure to await all asynchronous operations with event handlers
    and use emit.isDone after asynchronous operations before calling emit() to
    ensure the event handler has not completed."
- The solution is to make sure your event handler has `await` on any calls to async methods
- In my case, I had an async helper method in my bloc code that was being called by an event handler without using `await` on the call to the helper.


