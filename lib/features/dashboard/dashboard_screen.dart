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

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(dashboardStatisticsProvider);

    final recentCases = ref.watch(recentCasesProvider);

    final specialty = ref.watch(specialtyBreakdownProvider);

    final operative = ref.watch(operativeRoleBreakdownProvider);

    final monthly = ref.watch(monthlyCaseDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),

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
            },

            child: ListView(
              padding: const EdgeInsets.all(16),

              children: [
                CoreKpiCard(
                  title: "Total Cases",

                  value: stats.totalCases,

                  icon: Icons.local_hospital_outlined,
                ),

                CoreKpiCard(
                  title: "Total Patients",

                  value: stats.totalPatients,

                  icon: Icons.people_outline,
                ),

                CoreKpiCard(
                  title: "Total Procedures",

                  value: stats.totalProcedures,

                  icon: Icons.medical_services_outlined,
                ),

                CoreKpiCard(
                  title: "Cases This Month",

                  value: stats.casesThisMonth,

                  icon: Icons.calendar_month_outlined,
                ),

                const SizedBox(height: 24),

                Text(
                  "Quick Actions",

                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: QuickActionButton(
                        label: "Add Patient",

                        icon: Icons.person_add,

                        onTap: () {
                          context.push('/patients/add');
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: QuickActionButton(
                        label: "Add Case",

                        icon: Icons.assignment_add,

                        onTap: () {
                          context.push('/cases/add');
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Text(
                  "Recent Cases",

                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const SizedBox(height: 12),

                recentCases.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),

                  error: (error, stack) => Text(error.toString()),

                  data: (cases) => RecentCasesCard(cases: cases),
                ),

                const SizedBox(height: 16),

                specialty.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (error, stack) => Text(error.toString()),

                  data: (data) => SpecialtyBreakdownCard(data: data),
                ),

                const SizedBox(height: 16),

                operative.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (error, stack) => Text(error.toString()),

                  data: (data) => OperativeRoleCard(distribution: data),
                ),

                const SizedBox(height: 16),

                monthly.when(
                  loading: () => const CircularProgressIndicator(),

                  error: (error, stack) => Text(error.toString()),

                  data: (data) => MonthlyCaseChart(data: data),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
