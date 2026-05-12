// GoRouter extra example: passing optional data directly between routes.
//
// The `extra` parameter is used to send supplementary data during navigation
// without encoding it into the URL. This is useful for objects, models,
// or temporary values that do not need to be shareable/bookmarkable.
// GoRouter extra example: passing an object between routes.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// Simple model class used for object passing.
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });
}

// Global router. Defines all named routes and their screen builders.
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstScreen(),
    ),
    // No parameter in the path; object is passed directly through
    // navigation and exposed via state.extra.
    GoRoute(
      path: '/second',
      builder: (context, state) {
        final User? user = state.extra as User?;
        return SecondScreen(
          user: user,
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Object Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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
            // Creates an object locally, then passes it via extra.
            // The receiving route can access the full object directly.
            const user = User(
              name: 'Alice',
              age: 25,
            );

            context.go('/second', extra: user);
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // Accepts the extracted object via constructor, decoupling
  // widget logic from routing concerns.
  final User? user;

  const SecondScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${user?.name ?? 'Unknown'}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Age: ${user?.age ?? 0}',
              style: const TextStyle(fontSize: 20),
            ),
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