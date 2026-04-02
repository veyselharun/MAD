// https://docs.flutter.dev/learn/pathway/tutorial/widget-fundamentals
// Widget fundamentals

import 'package:flutter/material.dart';
import 'package:flutter_ui_example/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          // Add a Tile widget to the the Center widget.
          child: Tile('A', HitType.hit),
          // child: Tile('A', HitType.partial),
          // child: Tile('A', HitType.miss),
        ),
      ),
    );
  }
}


// A widget is a Dart class that extends one of the Flutter widget classes.
// Here, the Tile class extends StatelessWidget, making it a stateless widget.
// 
// Flutter provides two types of widgets: StatelessWidget, for static content
// that doesn't change, and StatefulWidget, for dynamic content that can change over time.

// The Tile widget consists of three of the most common core widgets: 
// Container, Center, and Text.

// Container is a versatile layout widget that combines common painting,
// positioning, and sizing capabilities, allowing you to decorate, constrain,
// and transform its child widget all in a single, convenient wrapper.

// Center is a layout widget that centers its child within its parent,
// making it simple to position a widget at the exact center without any
// additional alignment configuration.

// Text is a basic widget that displays a string of text with a single style,
// making it simple to add styled text with custom font size, color, weight,
// and more to your app.
class Tile extends StatelessWidget {
  // The Tile class has a constructor that defines what data needs to be passed 
  // into the widget to render the widget.
  // In this case, the constructor accepts two parameters: letter and hitType.
  // letter is a String representing the guessed letter of the tile.
  // hitType is a HitType enum value represent the guess result and used to 
  // determine the color of the tile.
  // For example, HitType.hit results in a green tile.

  // Passing data into widget constructors is at the core of making widgets reusable.
  const Tile(this.letter, this.hitType, {super.key});

  final String letter;
  final HitType hitType;

  // The build method must be defined on every widget.
  // The build method returns a Widget.
  @override
  Widget build(BuildContext context) {


    return Container(
      width: 60,
      height: 60,
      
      // Add a Border to the box with the following code.
      // 
      // BoxDecoration is an object that knows how to add any number of decorations to a widget, 
      // from background color to borders to box shadows and more. 
      // In this case, you've added a border.

      // In the game, the color of the tile depends on the user's guess. 
      // The tile will be green when the user has guessed correctly, 
      // yellow when the letter is correct but the position is incorrect, 
      // and gray if the guess is wrong in both respects.
      //
      // To achieve this in UI, a switch expression is used.
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: switch (hitType) {
          HitType.hit => Colors.green,
          HitType.partial => Colors.yellow,
          HitType.miss => Colors.grey,
          _ => Colors.white,
        },  
      ),

      // Add the Center and Text widgets to the Container.child property.
      // Most widgets in the Flutter SDK have a child or children property 
      // that's meant to be passed a widget or a list of widgets, respectively. 
      // It's the best practice to use the same naming convention in your own custom widgets.
      child: Center(
        child: Text(
          letter.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}



