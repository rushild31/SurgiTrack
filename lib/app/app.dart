import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';

class SurgiTrackApp extends StatelessWidget {
  const SurgiTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SurgiTrack',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      routerConfig: appRouter,

      restorationScopeId: 'surgitrack',

      themeAnimationDuration: const Duration(milliseconds: 200),

      themeAnimationCurve: Curves.easeInOut,
    );
  }
}
