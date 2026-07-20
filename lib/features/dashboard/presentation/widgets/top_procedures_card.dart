import 'package:flutter/material.dart';

import 'package:surgitrack/core/widgets/app_card.dart';
import 'package:surgitrack/core/widgets/empty_state.dart';

class TopProceduresCard extends StatelessWidget {
  final Map<String, int> procedures;

  const TopProceduresCard({super.key, required this.procedures});

  @override
  Widget build(BuildContext context) {
    final entries = procedures.entries.toList();

    final maxValue = procedures.isEmpty
        ? 0
        : procedures.values.reduce((a, b) => a > b ? a : b);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Top Operative Exposure",

            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          if (procedures.isEmpty)
            const EmptyState(
              icon: Icons.medical_services_outlined,

              title: "No procedures logged",

              message:
                  "Procedure exposure will appear after operative cases are added",
            )
          else
            ...entries.asMap().entries.map((item) {
              final rank = item.key + 1;

              final procedure = item.value;

              final percentage = maxValue == 0
                  ? 0.0
                  : procedure.value / maxValue;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,

                          height: 30,

                          alignment: Alignment.center,

                          decoration: BoxDecoration(shape: BoxShape.circle),

                          child: Text(
                            rank.toString(),

                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            procedure.key,

                            maxLines: 1,

                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),

                        Text(
                          "${procedure.value}",

                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: percentage,

                            minHeight: 8,

                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          "${(percentage * 100).toStringAsFixed(0)}%",

                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
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
