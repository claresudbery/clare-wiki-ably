---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Construct-Examples
---

## Contents of this page:

- [The Matchbox Bloc and the FetchMatchbox Event](#the-matchbox-bloc-and-the-fetchmatchbox-event)
- [The Matchbox Bloc and BlocListener](#the-matchbox-bloc-and-bloclistener)
- [Nested structures for BlocProvider, BlocListener etc](#nested-structures-for-blocprovider-bloclistener-etc)

## The Matchbox Bloc and the FetchMatchbox Event

- The `FetchMatchbox` event:
- `screens/matchbox.dart`: in `MatchboxScreen` Widget `build` method 
    - we call `matchboxBloc.add(FetchMatchbox` 
    - we are adding the `FetchMatchbox` event to the bloc in this widget's `build` method 
    - this means we are causing that event to be fired on startup of this widget
    - because we want the matchbox to be fetched when the widget is being constructed when screen first shown
- in `matchbox_bloc.dart` in our event handler we emit loading and success states
- in our test, we assert that those states should have been emitted
- each state is an instance of a class
- the classes are defined in `matchbox_state`
- in each bloc you have three things
    - the bloc - logic combining events and states - `matchbox_bloc.dart`
    - the events - `matchbox_event.dart`
    - the states - `matchbox_state.dart`
- then in the screen - `matchbox.dart`
    - we have a switch statement that responds to the different states
- when the screen starts up, it triggers the `FetchMatchbox` Event
- the bloc is responsible for defining what happens in response to different events
- it will emit different states while responding to events
- the screen then has this switch statement that responds to different states

## The Matchbox Bloc and BlocListener

- The `matchbox_preview` screen uses `BlocListener` to show dialogs in response to state changes
- A switch statement reacts appropriately in response to state changes
- There's an event diagram [here](https://app.mural.co/t/sudberysoftwareengineering1540/m/sudberysoftwareengineering1540/1721987225283/861925eb2de32dc193a3ba9d855aa804f5989536?sender=ua8e59c649d4f8a7d21ab1250)
    - See also [CHT-126](https://www.notion.so/construct-platform/Implement-bloc-state-management-for-Matchbox-Preview-Display-Name-90e9326fe58c418a9d2501f33f5bd81c?pvs=4)
    - PR here: https://github.com/The-Construct-Software-Dev/construct/pull/111
- Basic structure looks like this:

```dart
@override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _matchboxFuture,
      builder: (context, snapshot) {
        final authProvider = Provider.of<IAuthProvider>(context, listen: false);

        return BlocProvider<MatchboxBloc>(
          create: (context) => _matchboxBloc,
          child: BlocListener<MatchboxBloc, MatchboxState>(
            listener: (context, state) async {
              switch (state) {
                case MatchboxStateUserHasToPay():
                  await userHasToPayState(authProvider, state.matchbox);
                case MatchboxStateDisplayNameNeeded():
                  await displayNameNeededState(authProvider);
                case MatchboxStateUserReady():
                  await userReadyForMatchboxState();
              }
            },
            child: BlocBuilder<MatchboxBloc, MatchboxState>(
              builder: (context, state) {
```

## Nested structures for BlocProvider, BlocListener etc

- Below are several different possible skeleton structures for how things can be nested to get `BlocProvider`, `BlocListener` et al into your widget code.
- Skeleton structure for `matchbox_preview` (not actually how I did it in the end though - see below):

```dart
@override
  Widget build(BuildContext context) {
    return BlocProvider<MatchboxBloc>(
      create: (context) => _matchboxBloc,
      child: BlocListener<MatchboxBloc, MatchboxState>(
        listener: (context, state) {
          // action here
        },
        child: BlocBuilder<MatchboxBloc, MatchboxState>(
          builder: (context, state) {
            final authProvider = Provider.of<IAuthProvider>(context, listen: false);

            return FutureBuilder(
              future: _matchboxFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Scaffold();
              },
            );
          },
        ),
      ),
    );
  }
}
```

- Also can be done like this (this is how I did it in the end), with the `FutureBuilder` in the outer block. 
- I think I (Clare) did this so I would have access to the `context` when building the `authProvider`.

```dart
@override
  Widget build(BuildContext context) {
    return BlocProvider<MatchboxBloc>(
      create: (context) => _matchboxBloc,
      child: BlocListener<MatchboxBloc, MatchboxState>(
        listener: (context, state) {
          // action here
        },
        child: BlocBuilder<MatchboxBloc, MatchboxState>(
          builder: (context, state) {
            final authProvider = Provider.of<IAuthProvider>(context, listen: false);

            return FutureBuilder(
              future: _matchboxFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Scaffold();
              },
            );
          },
        ),
      ),
    );
  }
}
```

- Skeleton structure for BlocProvider with event fired in create clause:

```dart
@override
  Widget build(BuildContext context) {
    return BlocProvider<MatchboxBloc>(
      create: (context) => _matchboxBloc
        ..add(
          FetchMatchbox(
            ringID: widget.ringID,
            matchboxID: widget.matchboxID,
          ),
        ),
      child: BlocListener<MatchboxBloc, MatchboxState>(
        listener: (context, state) {
          // action here
        },
        child: BlocBuilder<MatchboxBloc, MatchboxState>(
          builder: (context, state) {
            final authProvider = Provider.of<IAuthProvider>(context, listen: false);

            return FutureBuilder(
              future: _matchboxFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Scaffold();
              },
            );
          },
        ),
      ),
    );
  }
}
```

- Skeleton structure of example from `github.com/felangel`
- From [here](https://github.com/felangel/bloc/blob/db714f374fe315dd78d644ad56daa003aca58de7/examples/flutter_todos/lib/todos_overview/view/todos_overview_page.dart#L41)

```dart
class TodosOverviewView extends StatelessWidget {
  const TodosOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: [
          buildActions(context),
        ],
      ),
      body: BlocListener<MatchboxBloc, MatchboxState>(
        listener: (context, state) {
          // action here
        },
        child: BlocBuilder<MatchboxBloc, MatchboxState>(
          builder: (context, state) {
            final authProvider = Provider.of<IAuthProvider>(context, listen: false);

            return FutureBuilder(
              future: _matchboxFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Scaffold();
              },
            );
          },
        ),
      ),
    );
  }
}
```