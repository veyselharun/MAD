// https://docs.flutter.dev/learn/pathway/tutorial/create-an-app
// Create a Flutter app

// Imports the Flutter Material package, which provides a set of
// pre-built widgets that follow Material Design guidelines.
//
// This includes commonly used widgets such as MaterialApp,
// Scaffold, AppBar, Text, and many others used to build
// visually consistent user interfaces.
import 'package:flutter/material.dart';

// The main function is the entry point of the Flutter app.
void main() {
  // The runApp method is part of the Flutter SDK.
  // It takes a widget as an argument and makes it the root of the widget tree. 
  // It attaches the widget to the screen and starts the build and rendering 
  // process, effectively connecting the app to the device's rendering pipeline.
  // 
  // In this case, an instance of the MainApp widget is being passed in.
  runApp(const MyApp());
}

// The MyApp class declaration.
// MyApp is the root widget, as it's the widget that's passed into runApp.
//
// Widget: A declarative building block that defines the structure, style, 
// and behavior of a user interface element, 
// forming the foundation of any Flutter application.

// Declarative UI (used by Flutter, SwiftUI, Jetpack Compose):
// You describe what the UI should look like for a given state, 
// and the framework handles how to update and render it.

// Imperative UI (used by traditional Android (XML + Java/Kotlin), UIKit (iOS), etc.):
// You explicitly write step-by-step instructions (imperative code) to create, 
// update, and modify the UI manually (e.g., findViewById, setText(), addSubview()).
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // The build method describes the UI for a widget by returning a
  // widget tree. It is called by the framework whenever the widget
  // needs to be rendered or re-rendered (e.g., after setState()).
  //
  // A Flutter app is composed of widgets organized in a tree
  // structure called the widget tree.
  //
  // In this example, the build method returns a MaterialApp widget,
  // which contains a Scaffold widget. The Scaffold includes a Center
  // widget, which in turn contains a Text widget.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}


