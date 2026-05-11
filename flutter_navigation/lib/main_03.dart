// GoRouter path parameter example: encoding and extracting data via the URL.
//
// A path parameter is a named placeholder in a URL segment that captures a 
// dynamic value at runtime for use by the receiving route.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// Defines the application's route table.
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstScreen(),
    ),
    // ':message' marks a dynamic path segment; GoRouter captures its
    // runtime value and exposes it via state.pathParameters.
    GoRoute(
      path: '/second/:message',
      builder: (context, state) {
        final String? msg = state.pathParameters['message'];
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
            // Embeds data directly in the URL; GoRouter matches this
            // to '/second/:message' and extracts 'dataToSend' as the parameter.
            const dataToSend = 'Hello from Home!';
            context.go('/second/$dataToSend');
          },
          child: const Text('Send Message to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // Accepts the extracted path parameter via constructor, decoupling
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