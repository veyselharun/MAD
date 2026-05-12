// GoRouter example using bottom tab navigation with StatefulShellRoute.
//
// StatefulShellRoute maintains separate navigation stacks for each tab,
// preserving state when switching between tabs.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// Defines the application's route table with bottom tab navigation.
// StatefulShellRoute maintains separate navigation stacks per tab.
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        // Branch 1: Home tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const FirstScreen(),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(),
                ),
              ],
            ),
          ],
        ),
        // Branch 2: Second tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/second',
              builder: (context, state) => const SecondScreen(),
            ),
          ],
        ),
        // Branch 3: Third tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/third',
              builder: (context, state) => const ThirdScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Bottom Nav Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Connects MaterialApp to GoRouter.
      routerConfig: _router,
    );
  }
}

// Scaffold that wraps tab content with a persistent BottomNavigationBar.
// navigationShell handles switching branches and preserving per-tab state.
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Renders the currently active branch's page.
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // Sync the selected tab with the active branch index.
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          // goBranch() switches to the selected tab branch.
          // initialLocation: true restores the branch's root route
          // if the user taps the already-active tab (back-to-top behavior).
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Second'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Third'),
        ],
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Tab', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Pushes a nested route within the Home tab's branch stack.
                context.go('/details');
              },
              child: const Text('Go to Details'),
            ),
          ],
        ),
      ),
    );
  }
}

// Nested route inside the Home tab branch.
// Uses context.pop() to return within the same tab stack.
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Back to Home'),
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
      body: const Center(
        child: Text('Second Tab', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: const Center(
        child: Text('Third Tab', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}