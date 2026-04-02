// https://docs.flutter.dev/learn/pathway/tutorial/stateful-widget
// Stateful Widgets

import 'package:flutter/material.dart';
import 'package:flutter_ui_example/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Align(alignment: Alignment.centerLeft, child: Text('Birdle')),
        ),
        body: Center(child: GamePage()),
      ),
    );
  }
}

class GuessInput extends StatelessWidget {
  GuessInput({super.key, required this.onSubmitGuess});

  final void Function(String) onSubmitGuess;

  final TextEditingController _textEditingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  void _onSubmit() {
    onSubmitGuess(_textEditingController.text);
    _textEditingController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 5,
              focusNode: _focusNode,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
              controller: _textEditingController,
              onSubmitted: (String value) {
                _onSubmit();
              },
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_circle_up),
          onPressed: _onSubmit,
        ),
      ],
    );
  }
}

// The grid grid must reflect the user's guesses. Each tile in the next
// unfilled row should update after each submitted user guess by:
// Displaying the correct letter.
// Changing color to reflect whether the letter is correct (green),
// is in the word but at an incorrect position (yellow),
// or doesn't appear in the word at all (grey).
// To handle this dynamic behavior, we need to convert GamePage
// from a StatelessWidget to a StatefulWidget.

// When a widget's appearance or data needs to change during its lifetime,
// we need a StatefulWidget and a companion State object. While the
// StatefulWidget itself is still immutable (its properties can't change
// after creation), the State object is long-lived, can hold mutable data,
// and can be rebuilt when that data changes, causing the UI to update.

// Changet the GamePage widget to a stateful widget.
// To convert the GamePage (or any other) widget from a stateless widget to
// a stateful widget, do the following steps:
// 1. Change GamePage to extend StatefulWidget instead of StatelessWidget.
// 2. Create a new class named _GamePageState, that extends State<GamePage>.
//    This new class will hold the mutable state and the build method. Move
//    the build method and all properties instantiated on the widget from
//    GamePage to the state object.
// 3. Implement the createState() method in GamePage, which returns an
//    instance of _GamePageState.
class GamePage extends StatefulWidget {
  GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          for (var guess in _game.guesses)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var letter in guess)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2.5,
                      vertical: 2.5,
                    ),
                    child: Tile(letter.char, letter.type),
                  ),
              ],
            ),
          GuessInput(
            onSubmitGuess: (String guess) {
              // Whenever you mutate a State object, you must call setState
              // to signal the framework to update the user interface and call
              // the build method again.

              // In this app, when a user makes a guess, the word they guessed
              // is saved on the Game object, which is a property on the GamePage
              // class, and therefore is state that might change and require
              // the UI to update. When this state is mutated, the grid should
              // be re-drawn to show the user's guess.

              // To implement this, we update the callback function passed to GuessInput.
              // The function needs to call setState and, within setState,
              // it needs to execute the logic to determine whether the users
              // guess was correct.

              // Now, when you type a legal guess into the TextInput and submit it,
              // the application will reflect the user's guess. If you were to
              // call _game.guess(guess) without a calling setState, the internal
              // game data would change, but Flutter wouldn't know it needs to
              // repaint the screen, and the user wouldn't see any updates.
              setState(() {
                _game.guess(guess);
              });
            },
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(this.letter, this.hitType, {super.key});

  final String letter;
  final HitType hitType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: switch (hitType) {
          HitType.hit => Colors.green,
          HitType.partial => Colors.yellow,
          HitType.miss => Colors.grey,
          _ => Colors.white,
        },
      ),

      child: Center(
        child: Text(
          letter.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
