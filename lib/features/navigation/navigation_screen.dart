import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:surgitrack/app/theme/theme_provider.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goToBranch(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SurgiTrack'),

        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),

                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              // Branding Header
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(24),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Icon(Icons.local_hospital_outlined, size: 48),

                    const SizedBox(height: 12),

                    Text(
                      'SurgiTrack',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Surgical Training Portfolio',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.dashboard),

                title: const Text('Dashboard'),

                onTap: () => _goToBranch(context, 0),
              ),

              ListTile(
                leading: const Icon(Icons.people),

                title: const Text('Patients'),

                onTap: () => _goToBranch(context, 1),
              ),

              ListTile(
                leading: const Icon(Icons.assignment),

                title: const Text('Cases'),

                onTap: () => _goToBranch(context, 2),
              ),

              ListTile(
                leading: const Icon(Icons.analytics),

                title: const Text('Analytics'),

                onTap: () => _goToBranch(context, 3),
              ),

              ListTile(
                leading: const Icon(Icons.description),

                title: const Text('Reports'),

                onTap: () => _goToBranch(context, 4),
              ),

              ListTile(
                leading: const Icon(Icons.settings),

                title: const Text('Settings'),

                onTap: () {
                  Navigator.pop(context);

                  context.go('/settings');
                },
              ),

              const Spacer(),

              const Divider(),

              // Dark Mode Toggle
              SwitchListTile(
                secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),

                title: const Text('Dark Mode'),

                value: isDark,

                onChanged: (value) {
                  ref.read(themeProvider.notifier).toggleTheme(value);
                },
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),

      body: navigationShell,

      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,

        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,

            initialLocation: index == navigationShell.currentIndex,
          );
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),

            selectedIcon: Icon(Icons.dashboard),

            label: 'Dashboard',
          ),

          NavigationDestination(
            icon: Icon(Icons.people_outline),

            selectedIcon: Icon(Icons.people),

            label: 'Patients',
          ),

          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),

            selectedIcon: Icon(Icons.assignment),

            label: 'Cases',
          ),

          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),

            selectedIcon: Icon(Icons.analytics),

            label: 'Analytics',
          ),

          NavigationDestination(
            icon: Icon(Icons.description_outlined),

            selectedIcon: Icon(Icons.description),

            label: 'Reports',
          ),

          NavigationDestination(
            icon: Icon(Icons.settings_outlined),

            selectedIcon: Icon(Icons.settings),

            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
