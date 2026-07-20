import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/dashboard/providers/dashboard_provider.dart';

import 'package:surgitrack/features/dashboard/presentation/widgets/core_kpi_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/quick_action_button.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/recent_cases_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/monthly_case_chart.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/specialty_breakdown_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/operative_role_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/top_procedures_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(dashboardStatisticsProvider);

    final recentCases = ref.watch(recentCasesProvider);

    final specialty = ref.watch(specialtyBreakdownProvider);

    final operative = ref.watch(operativeRoleBreakdownProvider);

    final monthly = ref.watch(monthlyCaseDataProvider);

    final topProcedures = ref.watch(topProceduresProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("SurgiTrack")),

      body: statistics.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (stats) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dashboardStatisticsProvider);

              ref.invalidate(recentCasesProvider);

              ref.invalidate(specialtyBreakdownProvider);

              ref.invalidate(operativeRoleBreakdownProvider);

              ref.invalidate(monthlyCaseDataProvider);

              ref.invalidate(topProceduresProvider);
            },

            child: ListView(
              padding: const EdgeInsets.all(16),

              children: [
                // ============================
                // HEADER
                // ============================
                Text(
                  "Welcome Dr. Rushil Dalwadi",

                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "CTVS Resident | Surgical Training Portfolio",

                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 24),

                // ============================
                // KPI GRID
                // ============================
                GridView.count(
                  crossAxisCount: 2,

                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisSpacing: 12,

                  mainAxisSpacing: 12,

                  childAspectRatio: 1.7,

                  children: [
                    CoreKpiCard(
                      title: "Operative Cases",

                      value: stats.totalCases,

                      icon: Icons.local_hospital_outlined,
                    ),

                    CoreKpiCard(
                      title: "Patients",

                      value: stats.totalPatients,

                      icon: Icons.people_outline,
                    ),

                    CoreKpiCard(
                      title: "Procedures",

                      value: stats.totalProcedures,

                      icon: Icons.medical_services_outlined,
                    ),

                    CoreKpiCard(
                      title: "This Month",

                      value: stats.casesThisMonth,

                      icon: Icons.calendar_month_outlined,
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // ============================
                // QUICK ACTIONS
                // ============================
                Text(
                  "Quick Actions",

                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Wrap(
                  spacing: 12,

                  runSpacing: 12,

                  children: [
                    QuickActionButton(
                      label: "Add Patient",

                      icon: Icons.person_add_outlined,

                      onTap: () => context.push('/patients/add'),
                    ),

                    QuickActionButton(
                      label: "Cases",

                      icon: Icons.assignment_outlined,

                      onTap: () => context.go('/cases'),
                    ),

                    QuickActionButton(
                      label: "Reports",

                      icon: Icons.description_outlined,

                      onTap: () => context.go('/reports'),
                    ),

                    QuickActionButton(
                      label: "Analytics",

                      icon: Icons.analytics_outlined,

                      onTap: () => context.go('/analytics'),
                    ),

                    QuickActionButton(
                      label: "Export",

                      icon: Icons.download_outlined,

                      onTap: () => context.go('/reports'),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // ============================
                // OPERATIVE TRAINING SUMMARY
                // ============================
                Text(
                  "Training Exposure Summary",

                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                operative.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (e, s) => Text(e.toString()),

                  data: (data) => OperativeRoleCard(data: data),
                ),

                const SizedBox(height: 24),

                // ============================
                // ANALYTICS
                // ============================
                monthly.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (e, s) => Text(e.toString()),

                  data: (data) => MonthlyCaseChart(data: data),
                ),

                const SizedBox(height: 16),

                specialty.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (e, s) => Text(e.toString()),

                  data: (data) => SpecialtyBreakdownCard(data: data),
                ),

                const SizedBox(height: 16),

                topProcedures.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (e, s) => Text(e.toString()),

                  data: (data) => TopProceduresCard(procedures: data),
                ),

                const SizedBox(height: 16),

                // ============================
                // RECENT CASES
                // ============================
                recentCases.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (e, s) => Text(e.toString()),

                  data: (cases) => RecentCasesCard(cases: cases),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
