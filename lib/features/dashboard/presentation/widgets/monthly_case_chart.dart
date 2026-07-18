import 'package:flutter/material.dart';

import 'package:surgitrack/core/widgets/app_card.dart';
import 'package:surgitrack/core/widgets/empty_state.dart';

import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

class MonthlyCaseChart extends StatelessWidget {
  final List<MonthlyCaseData> data;

  const MonthlyCaseChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Monthly Case Trend",

            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          if (data.isEmpty)
            const EmptyState(
              icon: Icons.show_chart,
              title: "No case trend available",
              message:
                  "Monthly trends will appear after operative cases are added",
            )
          else
            ...data.map((month) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(month.month),

                    Text(
                      month.count.toString(),

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
