import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/dashboard/dashboard_screen.dart';
import 'package:surgitrack/features/patients/presentation/patient_list_screen.dart';
import 'package:surgitrack/features/cases/cases_screen.dart';
import 'package:surgitrack/features/procedures/procedures_screen.dart';
import 'package:surgitrack/features/academics/academics_screen.dart';
import 'package:surgitrack/features/analytics/analytics_screen.dart';
import 'package:surgitrack/features/reports/reports_screen.dart';
import 'package:surgitrack/features/profile/presentation/surgeon_profile_screen.dart';
import 'package:surgitrack/features/settings/presentation/settings_screen.dart';
import 'package:surgitrack/features/settings/presentation/pages/cloud_account_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/', redirect: (_, _) => '/dashboard'),

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),

    GoRoute(
      path: '/patients',
      builder: (context, state) => const PatientListScreen(),
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
      path: '/profile',
      builder: (context, state) => const SurgeonProfileScreen(),
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),

    GoRoute(
      path: '/cloud',
      builder: (context, state) => const CloudAccountPage(),
    ),
  ],
);
