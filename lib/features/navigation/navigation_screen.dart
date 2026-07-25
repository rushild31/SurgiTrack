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
  }

  void _openAddPatient(BuildContext context) {
    context.push('/patients/add');
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
              // =====================================================
              // BRANDING HEADER
              // =====================================================
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

              // =====================================================
              // PRIMARY NAVIGATION
              // =====================================================
              ListTile(
                leading: const Icon(Icons.home_outlined),

                title: const Text('Home'),

                onTap: () {
                  Navigator.pop(context);
                  _goToBranch(context, 0);
                },
              ),

              ListTile(
                leading: const Icon(Icons.assignment_outlined),

                title: const Text('Cases'),

                onTap: () {
                  Navigator.pop(context);
                  _goToBranch(context, 1);
                },
              ),

              ListTile(
                leading: const Icon(Icons.description_outlined),

                title: const Text('Reports'),

                onTap: () {
                  Navigator.pop(context);
                  _goToBranch(context, 2);
                },
              ),

              // =====================================================
              // ADD PATIENT
              // =====================================================
              ListTile(
                leading: const Icon(Icons.person_add_outlined),

                title: const Text('Add Patient'),

                onTap: () {
                  Navigator.pop(context);
                  _openAddPatient(context);
                },
              ),

              // =====================================================
              // SECONDARY MODULES
              // =====================================================
              ListTile(
                leading: const Icon(Icons.analytics_outlined),

                title: const Text('Analytics'),

                onTap: () {
                  Navigator.pop(context);
                  context.push('/analytics');
                },
              ),

              const Spacer(),

              const Divider(),

              // =====================================================
              // SETTINGS
              // =====================================================
              ListTile(
                leading: const Icon(Icons.settings_outlined),

                title: const Text('Settings'),

                onTap: () {
                  Navigator.pop(context);
                  _goToBranch(context, 3);
                },
              ),

              // =====================================================
              // DARK MODE
              // =====================================================
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
          _goToBranch(context, index);
        },

        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),

            selectedIcon: Icon(Icons.home),

            label: 'Home',
          ),

          const NavigationDestination(
            icon: Icon(Icons.assignment_outlined),

            selectedIcon: Icon(Icons.assignment),

            label: 'Cases',
          ),

          NavigationDestination(
            icon: _AddPatientButton(
              onPressed: () {
                _openAddPatient(context);
              },
            ),

            selectedIcon: _AddPatientButton(
              onPressed: () {
                _openAddPatient(context);
              },
            ),

            label: '',
          ),

          const NavigationDestination(
            icon: Icon(Icons.description_outlined),

            selectedIcon: Icon(Icons.description),

            label: 'Reports',
          ),

          const NavigationDestination(
            icon: Icon(Icons.settings_outlined),

            selectedIcon: Icon(Icons.settings),

            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class _AddPatientButton extends StatelessWidget {
  const _AddPatientButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Transform.translate(
      offset: const Offset(0, -12),

      child: Material(
        elevation: 6,

        shape: const CircleBorder(),

        color: theme.colorScheme.primary,

        child: InkWell(
          onTap: onPressed,

          customBorder: const CircleBorder(),

          child: const SizedBox(
            width: 58,

            height: 58,

            child: Icon(Icons.add, size: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
