// GoRouter query parameter example: encoding and extracting optional data via the URL.
//
// A query parameter is an optional key-value pair appended to the URL after '?',
// used for data that is supplementary to the route rather than part of its path.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// Global router. Defines all named routes and their screen builders.
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstScreen(),
    ),
    // No parameter in the path; query parameters are parsed automatically
    // by GoRouter and exposed via state.uri.queryParameters.
    GoRoute(
      path: '/second',
      builder: (context, state) {
        final String? msg = state.uri.queryParameters['message'];
        return SecondScreen(message: msg ?? 'No message');
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
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
            // Appends data as a query string; GoRouter parses the key-value
            // pair and exposes it via state.uri.queryParameters on the route.
            const dataToSend = 'Hello from Home!';
            context.go('/second?message=$dataToSend');
          },
          child: const Text('Send Message to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // Accepts the extracted query parameter via constructor, decoupling
  // widget logic from routing concerns.
  final String message;
  const SecondScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received: $message', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}