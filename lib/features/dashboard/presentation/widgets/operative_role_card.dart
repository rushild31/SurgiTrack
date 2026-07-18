import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

class OperativeRoleCard extends StatelessWidget {
  final List<OperativeRoleDistribution> distribution;

  const OperativeRoleCard({super.key, required this.distribution});

  @override
  Widget build(BuildContext context) {
    final orderedRoles = [
      'observed',
      'assisted',
      'performed_under_supervision',
      'performed_independently',
    ];

    final sortedDistribution = [...distribution]
      ..sort((a, b) {
        return orderedRoles
            .indexOf(a.role)
            .compareTo(orderedRoles.indexOf(b.role));
      });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Operative Role Distribution",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 16),

            if (sortedDistribution.isEmpty)
              const Text("No cases recorded yet")
            else
              ...sortedDistribution.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Flexible(child: Text(_formatRole(item.role))),

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

  String _formatRole(String role) {
    switch (role) {
      case 'observed':
        return 'Observed';

      case 'assisted':
        return 'Assisted';

      case 'performed_under_supervision':
        return 'Performed Under Supervision';

      case 'performed_independently':
        return 'Performed Independently';

      default:
        return role;
    }
  }
}
