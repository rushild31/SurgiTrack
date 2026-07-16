import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';

class TimelineChart extends StatelessWidget {
  final List<MonthlyCaseTrend> trends;

  const TimelineChart({super.key, required this.trends});

  @override
  Widget build(BuildContext context) {
    if (trends.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: const Text("No monthly case data available"),
        ),
      );
    }

    final maxCases = trends
        .map((e) => e.caseCount)
        .reduce((a, b) => a > b ? a : b);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Monthly Case Trend",

              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 16),

            ...trends.map((trend) => _barRow(context, trend, maxCases)),
          ],
        ),
      ),
    );
  }

  Widget _barRow(BuildContext context, MonthlyCaseTrend trend, int maxCases) {
    final widthFactor = maxCases == 0 ? 0 : trend.caseCount / maxCases;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("${_monthName(trend.month.month)} ${trend.month.year}"),

              Text(
                trend.caseCount.toString(),

                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          const SizedBox(height: 6),

          FractionallySizedBox(
            widthFactor: widthFactor.toDouble(),

            child: Container(
              height: 10,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),

                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",

      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return months[month - 1];
  }
}
