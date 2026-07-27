import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';
import 'theme/app_dark_theme.dart';
import 'theme/theme_provider.dart';

import 'router/app_router.dart';

import 'package:surgitrack/features/settings/providers/settings_provider.dart';
import 'package:surgitrack/features/settings/presentation/pin_lock_screen.dart';

class SurgiTrackApp extends ConsumerWidget {
  const SurgiTrackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    final settingsAsync = ref.watch(appSettingsProvider);

    return MaterialApp.router(
      title: 'SurgiTrack',

      debugShowCheckedModeBanner: false,

      // Light Theme
      theme: AppTheme.lightTheme,

      // Dark Theme
      darkTheme: AppDarkTheme.darkTheme,

      // Current User Selection
      themeMode: themeMode,

      // Router
      routerConfig: appRouter,

      // =====================================================
      // PIN LOCK GATE
      // =====================================================
      builder: (context, child) {
        final isUnlocked = ref.watch(appUnlockedProvider);

        return settingsAsync.when(
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),

          error: (error, stack) => const Scaffold(
            body: Center(child: Text('Unable to load application settings')),
          ),

          data: (settings) {
            // No PIN configured → normal application
            //
            // OR
            //
            // PIN already verified during this app session
            if (!settings.pinLockEnabled || isUnlocked) {
              return child ?? const SizedBox.shrink();
            }

            // PIN enabled but not yet verified
            return PinLockScreen(
              onUnlocked: () {
                ref.read(appUnlockedProvider.notifier).state = true;
              },
            );
          },
        );
      },

      restorationScopeId: 'surgitrack',

      themeAnimationDuration: const Duration(milliseconds: 200),

      themeAnimationCurve: Curves.easeInOut,
    );
  }
}
