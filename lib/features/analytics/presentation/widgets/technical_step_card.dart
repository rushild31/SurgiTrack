import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';

class TechnicalStepCard extends StatelessWidget {
  final TechnicalStepExposure exposure;

  const TechnicalStepCard({super.key, required this.exposure});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              exposure.procedureName,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            const SizedBox(height: 4),

            Text(
              exposure.stepName,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            _roleRow(context, "Observed", exposure.roleCounts['observed'] ?? 0),

            _roleRow(context, "Assisted", exposure.roleCounts['assisted'] ?? 0),

            _roleRow(
              context,
              "Performed under Supervision",
              exposure.roleCounts['performed_under_supervision'] ?? 0,
            ),

            _roleRow(
              context,
              "Performed Independently",
              exposure.roleCounts['performed_independently'] ?? 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleRow(BuildContext context, String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Flexible(child: Text(label)),

          Text(value.toString()),
        ],
      ),
    );
  }
}
