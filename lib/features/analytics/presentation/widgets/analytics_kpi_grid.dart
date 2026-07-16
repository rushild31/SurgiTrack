import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';

import 'package:surgitrack/features/analytics/presentation/widgets/analytics_summary_card.dart';

class AnalyticsKpiGrid extends StatelessWidget {
  final AnalyticsStatistics statistics;

  const AnalyticsKpiGrid({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
          value: statistics.averageProceduresPerCase.toStringAsFixed(2),
          icon: Icons.analytics,
        ),
      ],
    );
  }
}
