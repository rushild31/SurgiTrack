import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/specialty_distribution.dart';

class SpecialtyDistributionChart extends StatelessWidget {
  final List<SpecialtyDistribution> distribution;

  const SpecialtyDistributionChart({super.key, required this.distribution});

  @override
  Widget build(BuildContext context) {
    if (distribution.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No specialty exposure recorded yet.'),
        ),
      );
    }

    final totalCases = distribution.fold<int>(
      0,
      (sum, item) => sum + item.count,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Total Logged Cases: $totalCases',
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        const SizedBox(height: 16),

        ...distribution.map((item) {
          final percentage = totalCases == 0
              ? 0
              : (item.count / totalCases * 100).round();

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      item.specialty,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    Text(
                      '${item.count} cases ($percentage%)',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                LinearProgressIndicator(
                  value: totalCases == 0 ? 0 : item.count / totalCases,
                  minHeight: 8,
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
