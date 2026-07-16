import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/specialty_distribution.dart';

class SpecialtyDistributionCard extends StatelessWidget {
  final List<SpecialtyDistribution> distribution;

  const SpecialtyDistributionCard({super.key, required this.distribution});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Cases by Specialty",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 16),

            ...distribution.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(item.specialty),

                    Text(
                      item.count.toString(),

                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
