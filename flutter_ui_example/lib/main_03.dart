// https://docs.flutter.dev/learn/pathway/tutorial/layout
// Layout

import 'package:flutter/material.dart';
import 'package:flutter_ui_example/game.dart';

void main() {
  runApp(const MyApp());
}


// Mobile applications often have a bar at the top called an "app bar" that 
// can display a title, navigation controls, and/or actions.
// The simplest way to add an app bar to your app is by using two widgets: 
// Scaffold and AppBar.

// Scaffold is a Material Design widget that provides a standard page layout,
// making it simple to add an app bar, drawer, navigation bar, and more to a
// page of your app.

// AppBar is a Material Design widget that provides a standard toolbar,
// typically displayed at the top of a Scaffold, making it simple to add
// a title, leading icon, and action buttons to your app.

// Align is a layout widget that aligns its child within its parent,
// making it simple to position a widget at the center, top, bottom, left,
// right, or any custom alignment within its parent.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text('Birdle'),
          ),
        ),
        body: Center(child: GamePage()),
      ),
    );
  }
}

// GamePage will display the UI elements needed for the game itself.
// The GamePage layout contains the grid of tiles that display a user's guesses.
// There are a number of ways you can build this layout. The simplest is with 
// the Column and Row widgets. Each row contains five tiles that represent 
// the five letters in a guess, with five rows total. So you'll need a single 
// Column with five Row widgets as children, where each row contains five children.

// Padding is a layout widget that adds empty space around its child widget,
// making it simple to control the spacing between a widget and its
// surrounding elements.

// Column is a layout widget that arranges its children in a vertical sequence,
// making it simple to stack multiple widgets on top of each other in a
// top-to-bottom order.

// Row is a layout widget that arranges its children in a horizontal sequence,
// making it simple to place multiple widgets side by side in a
// left-to-right order.
class GamePage extends StatelessWidget {
  GamePage({super.key});
  // This manages game logic, and is out of scope for this lesson.
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // The spacing property puts five pixels between each element on the main axis.
        spacing: 5.0,
        children: [
          // The guesses list is a fixed-size list, starting with five 
          // elements, one for each potential guess. The list will always 
          // contain exactly five elements, and therefore will always 
          // render five rows.
          // Add five Row widgets to the column, one for each guess on the Game object.
          for (var guess in _game.guesses)
            Row(
              spacing: 5.0,
              children: [
                // Add a Tile to each row for each letter allowed in the guess.
                // The guess variable in the loop is a record with the type ({String char, HitType type}).
                for (var letter in guess) Tile(letter.char, letter.type),
              ],
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



