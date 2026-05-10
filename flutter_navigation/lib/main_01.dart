// Navigator example using imperative routing.
// 
// Imperative routing: Navigation is controlled by explicitly calling methods
// such as push() and pop() to modify the route stack.
//
// Non-imperative (declarative) routing: Navigation is controlled by defining
// the desired route state, and the framework updates the route stack 
// automatically.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            // Pushes SecondScreen onto the navigation stack.
            Navigator.push(
              // This context identifies FirstScreen's location in the widget
              // tree. Navigator uses it to find the nearest Navigator widget 
              // above this screen.
              context,

              // MaterialPageRoute provides a platform-adaptive page transition
              // (for example, slide animations).
              //
              // For iOS-styled apps, CupertinoPageRoute can be used.
              //
              // Custom routes can also be created with PageRouteBuilder or by
              // extending PageRoute.
              //
              // <void> means no value is expected to be returned when this 
              // route is popped.
              MaterialPageRoute<void>(
                // builder lazily creates SecondScreen only when the route is
                // pushed.
                builder: (context) => const SecondScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Route')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Removes the current route from the stack and returns to the 
            // previous screen.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
