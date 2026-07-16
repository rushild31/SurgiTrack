import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/analytics/providers/analytics_dashboard_provider.dart';

import 'package:surgitrack/features/analytics/presentation/widgets/charts/specialty_distribution_chart.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/charts/operative_role_bar_chart.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/charts/monthly_case_line_chart.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/procedure_exposure_card.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/technical_step_card.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/analytics_kpi_grid.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/dashboard_section.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/analytics_filter_button.dart';

class AnalyticsOverviewPage extends ConsumerWidget {
  const AnalyticsOverviewPage({super.key});

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(analyticsDashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),

        actions: const [AnalyticsFilterButton()],
      ),

      body: dashboard.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stackTrace) => Center(child: Text(error.toString())),

        data: (data) {
          final statistics = data.statistics;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                _sectionTitle(context, 'Surgical Portfolio Summary'),

                const SizedBox(height: 16),

                AnalyticsKpiGrid(statistics: statistics),

                const SizedBox(height: 28),

                _sectionTitle(context, 'Surgical Spectrum'),

                const SizedBox(height: 12),

                DashboardSection(
                  title: 'Specialty Experience',
                  child: SpecialtyDistributionChart(
                    distribution: data.specialtyDistribution,
                  ),
                ),

                const SizedBox(height: 28),

                _sectionTitle(context, 'Operative Autonomy'),

                const SizedBox(height: 12),

                DashboardSection(
                  title: 'Operative Role Progression',
                  child: OperativeRoleBarChart(
                    distribution: data.operativeRoleDistribution,
                  ),
                ),

                const SizedBox(height: 12),

                if (data.independentlyPerformedProcedures.isNotEmpty) ...[
                  Text(
                    'Independent Procedures',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 8),

                  ...data.independentlyPerformedProcedures
                      .take(5)
                      .map(
                        (procedure) =>
                            ProcedureExposureCard(exposure: procedure),
                      ),
                ],

                const SizedBox(height: 28),

                _sectionTitle(context, 'Case Volume Trend'),

                const SizedBox(height: 12),

                MonthlyCaseLineChart(trends: data.monthlyCaseTrend),

                const SizedBox(height: 28),

                _sectionTitle(context, 'Procedure Exposure'),

                const SizedBox(height: 12),

                ...data.topProcedures
                    .take(5)
                    .map(
                      (procedure) => ProcedureExposureCard(exposure: procedure),
                    ),

                const SizedBox(height: 28),

                _sectionTitle(context, 'Technical Skill Exposure'),

                const SizedBox(height: 12),

                ...data.technicalStepExposure
                    .take(5)
                    .map((step) => TechnicalStepCard(exposure: step)),

                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
