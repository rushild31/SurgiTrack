import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/analytics/providers/analytics_dashboard_provider.dart';

import 'package:surgitrack/features/analytics/presentation/widgets/analytics_summary_card.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/specialty_distribution_card.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/operative_role_card.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/monthly_case_line_chart.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/procedure_exposure_card.dart';
import 'package:surgitrack/features/analytics/presentation/widgets/technical_step_card.dart';

class AnalyticsOverviewPage extends ConsumerWidget {
  const AnalyticsOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(analyticsDashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
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
                Text(
                  'Surgical Portfolio Summary',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 16),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.6,
                  children: [
                    AnalyticsSummaryCard(
                      title: 'Total Patients',
                      value: statistics.totalPatients.toString(),
                      icon: Icons.people,
                    ),
                    AnalyticsSummaryCard(
                      title: 'Total Cases',
                      value: statistics.totalCases.toString(),
                      icon: Icons.medical_services,
                    ),
                    AnalyticsSummaryCard(
                      title: 'Total Procedures',
                      value: statistics.totalProcedures.toString(),
                      icon: Icons.assignment,
                    ),
                    AnalyticsSummaryCard(
                      title: 'Avg Procedures / Case',
                      value: statistics.averageProceduresPerCase
                          .toStringAsFixed(2),
                      icon: Icons.analytics,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SpecialtyDistributionCard(
                  distribution: data.specialtyDistribution,
                ),

                const SizedBox(height: 24),

                OperativeRoleCard(distribution: data.operativeRoleDistribution),

                const SizedBox(height: 24),

                MonthlyCaseLineChart(trends: data.monthlyCaseTrend),

                const SizedBox(height: 24),

                Text(
                  'Top Procedures',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 12),

                ...data.topProcedures.map(
                  (procedure) => ProcedureExposureCard(exposure: procedure),
                ),

                const SizedBox(height: 24),

                Text(
                  'Technical Step Exposure',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 12),

                ...data.technicalStepExposure
                    .take(5)
                    .map((step) => TechnicalStepCard(exposure: step)),

                const SizedBox(height: 24),

                Text(
                  'Independently Performed Procedures',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 12),

                if (data.independentlyPerformedProcedures.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('No independently performed procedures yet.'),
                    ),
                  )
                else
                  ...data.independentlyPerformedProcedures.map(
                    (procedure) => ProcedureExposureCard(exposure: procedure),
                  ),

                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
