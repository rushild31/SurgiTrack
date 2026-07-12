import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/dashboard/dashboard_screen.dart';
import 'package:surgitrack/features/cases/cases_screen.dart';
import 'package:surgitrack/features/procedures/procedures_screen.dart';
import 'package:surgitrack/features/academics/academics_screen.dart';
import 'package:surgitrack/features/analytics/analytics_screen.dart';
import 'package:surgitrack/features/reports/reports_screen.dart';
import 'package:surgitrack/features/settings/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/dashboard',

  routes: [
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),

    GoRoute(path: '/cases', builder: (context, state) => const CasesScreen()),

    GoRoute(
      path: '/procedures',
      builder: (context, state) => const ProceduresScreen(),
    ),

    GoRoute(
      path: '/academics',
      builder: (context, state) => const AcademicsScreen(),
    ),

    GoRoute(
      path: '/analytics',
      builder: (context, state) => const AnalyticsScreen(),
    ),

    GoRoute(
      path: '/reports',
      builder: (context, state) => const ReportsScreen(),
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
