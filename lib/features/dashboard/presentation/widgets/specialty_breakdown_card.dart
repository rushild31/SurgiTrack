import 'package:flutter/material.dart';

import 'package:surgitrack/core/widgets/app_card.dart';

class SpecialtyBreakdownCard extends StatelessWidget {
  final Map<String, int> data;

  const SpecialtyBreakdownCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Specialty Breakdown",

            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          if (data.isEmpty)
            const Text("No cases recorded yet")
          else
            ...data.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(entry.key),

                    Text(
                      entry.value.toString(),

                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}
