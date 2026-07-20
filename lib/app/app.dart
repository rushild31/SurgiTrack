import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';
import 'theme/app_dark_theme.dart';
import 'theme/theme_provider.dart';

import 'router/app_router.dart';

class SurgiTrackApp extends ConsumerWidget {
  const SurgiTrackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'SurgiTrack',

      debugShowCheckedModeBanner: false,

      // Light Theme
      theme: AppTheme.lightTheme,

      // Dark Theme
      darkTheme: AppDarkTheme.darkTheme,

      // Current User Selection
      themeMode: themeMode,

      routerConfig: appRouter,

      restorationScopeId: 'surgitrack',

      themeAnimationDuration: const Duration(milliseconds: 200),

      themeAnimationCurve: Curves.easeInOut,
    );
  }
}
