// GoRouter example using non-imperative (declarative) routing.
//
// Navigation is controlled by defining the desired route location,
// and GoRouter updates the route stack automatically.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// Defines the application's route table.
// Each route maps a URL path to a screen widget.
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstScreen(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),

      // Connects MaterialApp to GoRouter.
      routerConfig: _router,
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigates to '/second' by changing the current route location.
            //
            // go() replaces the current route stack with the new location.
            context.go('/second');
          },
          child: const Text('Go to Second Screen'),
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
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigates to '/' by changing the current route location.
            //
            // go() replaces the current route stack with the new location.
            context.go('/');
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}