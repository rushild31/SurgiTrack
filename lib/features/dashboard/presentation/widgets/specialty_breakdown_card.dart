import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:surgitrack/core/widgets/app_card.dart';
import 'package:surgitrack/core/widgets/empty_state.dart';

class SpecialtyBreakdownCard extends StatelessWidget {
  final Map<String, int> data;

  const SpecialtyBreakdownCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final total = data.values.fold<int>(0, (sum, value) => sum + value);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Specialty Exposure",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          if (data.isEmpty)
            const EmptyState(
              icon: Icons.pie_chart_outline,

              title: "No cases recorded",

              message:
                  "Specialty distribution will appear after operative cases are added",
            )
          else ...[
            SizedBox(
              height: 220,

              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 55,

                  sectionsSpace: 4,

                  sections: data.entries.map((entry) {
                    final percentage = total == 0
                        ? 0
                        : entry.value / total * 100;

                    return PieChartSectionData(
                      value: entry.value.toDouble(),

                      title: "${percentage.toStringAsFixed(0)}%",

                      radius: 85,

                      titleStyle: const TextStyle(
                        fontSize: 13,

                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 12),

            ...data.entries.map((entry) {
              final percentage = total == 0 ? 0 : entry.value / total * 100;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),

                child: Row(
                  children: [
                    Container(
                      width: 12,

                      height: 12,

                      decoration: const BoxDecoration(shape: BoxShape.circle),
                    ),

                    const SizedBox(width: 10),

                    Expanded(child: Text(entry.key)),

                    Text(
                      "${entry.value} cases "
                      "(${percentage.toStringAsFixed(0)}%)",

                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}
