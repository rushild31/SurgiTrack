import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/navigation/navigation_screen.dart';

import 'package:surgitrack/features/dashboard/dashboard_screen.dart';

import 'package:surgitrack/features/patients/presentation/patient_list_screen.dart';
import 'package:surgitrack/features/patients/presentation/patient_form_screen.dart';
import 'package:surgitrack/features/patients/presentation/patient_details_screen.dart';

import 'package:surgitrack/features/cases/cases_screen.dart';

import 'package:surgitrack/features/analytics/analytics_screen.dart';

import 'package:surgitrack/features/reports/reports_screen.dart';

import 'package:surgitrack/features/settings/presentation/settings_screen.dart';
import 'package:surgitrack/features/settings/presentation/pages/cloud_account_page.dart';

import 'package:surgitrack/features/profile/presentation/surgeon_profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/dashboard',

  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScreen(navigationShell: navigationShell);
      },

      branches: [
        // =========================
        // Dashboard
        // =========================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',

              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),

        // =========================
        // Patients
        // =========================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/patients',

              builder: (context, state) => const PatientListScreen(),

              routes: [
                GoRoute(
                  path: 'add',

                  builder: (context, state) => const PatientFormScreen(),
                ),

                GoRoute(
                  path: ':id',

                  builder: (context, state) {
                    final id = state.pathParameters['id']!;

                    return PatientDetailsRouteWrapper(patientId: id);
                  },
                ),
              ],
            ),
          ],
        ),

        // =========================
        // Cases
        // =========================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cases',

              builder: (context, state) => const CasesScreen(),
            ),
          ],
        ),

        // =========================
        // Analytics
        // =========================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/analytics',

              builder: (context, state) => const AnalyticsScreen(),
            ),
          ],
        ),

        // =========================
        // Reports
        // =========================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reports',

              builder: (context, state) => const ReportsScreen(),
            ),
          ],
        ),

        // =========================
        // Settings
        // =========================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',

              builder: (context, state) => const SettingsScreen(),

              routes: [
                GoRoute(
                  path: 'profile',

                  builder: (context, state) => const SurgeonProfileScreen(),
                ),

                GoRoute(
                  path: 'cloud',

                  builder: (context, state) => const CloudAccountPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
