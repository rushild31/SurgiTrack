import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex(context),

        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/dashboard');
              break;

            case 1:
              context.go('/cases');
              break;

            case 2:
              context.go('/procedures');
              break;

            case 3:
              context.go('/analytics');
              break;

            case 4:
              context.go('/settings');
              break;
          }
        },

        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Home'),

          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Cases'),

          NavigationDestination(
            icon: Icon(Icons.medical_services),
            label: 'Procedures',
          ),

          NavigationDestination(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),

          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/cases')) {
      return 1;
    }

    if (location.startsWith('/procedures')) {
      return 2;
    }

    if (location.startsWith('/analytics')) {
      return 3;
    }

    if (location.startsWith('/settings')) {
      return 4;
    }

    return 0;
  }
}
