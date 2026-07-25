import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/navigation/navigation_screen.dart';

import 'package:surgitrack/features/dashboard/dashboard_screen.dart';

import 'package:surgitrack/features/patients/presentation/patient_list_screen.dart';
import 'package:surgitrack/features/patients/presentation/patient_form_screen.dart';
import 'package:surgitrack/features/patients/presentation/patient_details_screen.dart';

import 'package:surgitrack/features/cases/cases_screen.dart';

import 'package:surgitrack/features/procedures/procedures_screen.dart';

import 'package:surgitrack/features/analytics/analytics_screen.dart';

import 'package:surgitrack/features/reports/reports_screen.dart';

import 'package:surgitrack/features/settings/presentation/settings_screen.dart';
import 'package:surgitrack/features/settings/presentation/pages/cloud_account_page.dart';

import 'package:surgitrack/features/profile/presentation/surgeon_profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/dashboard',

  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Icon(Icons.error_outline, size: 64),

              const SizedBox(height: 16),

              Text(
                'The page you are looking for does not exist.',

                style: Theme.of(context).textTheme.titleMedium,

                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              FilledButton(
                onPressed: () {
                  context.go('/dashboard');
                },

                child: const Text('Go to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  },

  routes: [
    // =====================================================
    // MAIN APP SHELL
    //
    // Bottom Navigation:
    //
    // 0 → Home / Dashboard
    // 1 → Cases
    // 2 → Reports
    // 3 → Settings
    //
    // The central "+" button is an action and does not
    // represent a navigation branch.
    // =====================================================
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScreen(navigationShell: navigationShell);
      },

      branches: [
        // =================================================
        // BRANCH 0 — HOME / DASHBOARD
        // =================================================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',

              builder: (context, state) {
                return const DashboardScreen();
              },
            ),
          ],
        ),

        // =================================================
        // BRANCH 1 — CASES
        // =================================================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cases',

              builder: (context, state) {
                return const CasesScreen();
              },
            ),
          ],
        ),

        // =================================================
        // BRANCH 2 — REPORTS
        // =================================================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reports',

              builder: (context, state) {
                return const ReportsScreen();
              },
            ),
          ],
        ),

        // =================================================
        // BRANCH 3 — SETTINGS
        // =================================================
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',

              builder: (context, state) {
                return const SettingsScreen();
              },

              routes: [
                // -----------------------------------------
                // Surgeon Profile
                // /settings/profile
                // -----------------------------------------
                GoRoute(
                  path: 'profile',

                  builder: (context, state) {
                    return const SurgeonProfileScreen();
                  },
                ),

                // -----------------------------------------
                // Cloud Account
                // /settings/cloud
                // -----------------------------------------
                GoRoute(
                  path: 'cloud',

                  builder: (context, state) {
                    return const CloudAccountPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    // =====================================================
    // SECONDARY MODULES
    //
    // These are not bottom-navigation branches.
    // =====================================================

    // =====================================================
    // PATIENTS
    // =====================================================
    GoRoute(
      path: '/patients',

      builder: (context, state) {
        return const PatientListScreen();
      },

      routes: [
        // -----------------------------------------------
        // Add Patient
        // /patients/add
        // -----------------------------------------------
        GoRoute(
          path: 'add',

          builder: (context, state) {
            return const PatientFormScreen();
          },
        ),

        // -----------------------------------------------
        // Patient Details
        // /patients/:id
        // -----------------------------------------------
        GoRoute(
          path: ':id',

          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return PatientDetailsRouteWrapper(patientId: id);
          },
        ),
      ],
    ),

    // =====================================================
    // ANALYTICS
    // =====================================================
    GoRoute(
      path: '/analytics',

      builder: (context, state) {
        return const AnalyticsScreen();
      },
    ),

    // =====================================================
    // PROCEDURE LIBRARY
    // =====================================================
    GoRoute(
      path: '/procedures',

      builder: (context, state) {
        return const ProceduresScreen();
      },
    ),
  ],
);
