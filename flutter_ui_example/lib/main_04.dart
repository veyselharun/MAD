// https://docs.flutter.dev/learn/pathway/tutorial/user-input
// User Input

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

// GuessInput is a dedicated widget that allows users to type in their
// guesses. It requires onSubmitGuess callback function as an argument.
// In the GuessInput widget, we write our guess, then we press enter or
// we click a button to submit the guess.

// Expanded is a layout widget that fills the available space within a Row,
// Column, or Flex, allowing a child widget to take up all remaining room
// or a proportional share when multiple Expanded widgets are used together
// with the flex property.

// TextField is an input widget that allows users to type text using
// the keyboard, giving you control over styling, hints, validation,
// and input behavior through a highly configurable decoration and
// controller system.

// There are many button widgets built into Flutter. TextButton, ElevatedButton,
// IconButton, etc. All of these buttons (and many other interaction widgets)
// require two arguments (in addition to their optional arguments):
//   A callback function passed to onPressed.
//   A widget that makes up the content of the button (often Text or an Icon).
//
// IconButton is an interactive widget that displays a tappable icon,
// allowing you to trigger actions in response to user presses.
class GuessInput extends StatelessWidget {
  GuessInput({super.key, required this.onSubmitGuess});

  // Declare a final member of the class called onSubmitGuess that has the
  // type void Function(String). This function takes a single String argument
  // (the user's guess) and doesn't return any value (denoted by void).
  //
  // This callback tells us that the logic that actually handles the user's
  // guess will be written elsewhere. It's a good practice for interactive
  // widgets to use callback functions to keep the widget that handles
  // interactions reusable and decoupled from any specific functionality.
  //
  // The passed-in onSubmitGuess function is called when a user enters a guess.
  final void Function(String) onSubmitGuess;

  // TextEditingController is a controller class that lets you read, update,
  // and listen to changes in a TextField's content programmatically, giving
  // you full control over the text and cursor position from outside the widget.
  final TextEditingController _textEditingController = TextEditingController();

  // FocusNode is a controller class that manages the focus state of a widget,
  // allowing you to programmatically request, release, and listen to focus
  // changes so you can control keyboard visibility and input behavior from
  // outside the widget.
  final FocusNode _focusNode = FocusNode();

  // Make a call to the callback function with the trimmed input text.
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
              // Use the FocusNode to request focus whenever the TextField 
              // is submitted after the controller is cleared. After 
              // pressing Enter after inputting text, we can continue typing.
              focusNode: _focusNode,
              // Make autofocus true.
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
              // Set the controller of the TextField to _textEditingController
              // to manage the text that the user types into the input field.
              controller: _textEditingController,
              onSubmitted: (String value) {
                _onSubmit();
              },
            ),
          ),
        ),
        IconButton(
          // The padding property sets the padding between the edge of the
          // button and the icon it wraps to zero. This removes the default
          // padding and makes the button smaller.
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_circle_up),
          onPressed: _onSubmit,
        ),
      ],
    );
  }
}

class GamePage extends StatelessWidget {
  GamePage({super.key});
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 5.0,
        children: [
          for (var guess in _game.guesses)
            Row(
              spacing: 5.0,
              children: [
                for (var letter in guess) Tile(letter.char, letter.type),
              ],
            ),
          // After the tiles add our own GuessInput widget.
          GuessInput(
            // Callback function sent to GuessInput
            onSubmitGuess: (String guess) {
              print(guess); // Temporary code line.
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
