import 'package:flutter/material.dart';

import 'package:surgitrack/core/widgets/app_card.dart';
import 'package:surgitrack/core/widgets/empty_state.dart';

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
      ..sort(
        (a, b) => orderedRoles
            .indexOf(a.role)
            .compareTo(orderedRoles.indexOf(b.role)),
      );

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Operative Role Distribution",

            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 16),

          if (sortedDistribution.isEmpty)
            const EmptyState(
              icon: Icons.assignment_outlined,
              title: "No operative data",
              message: "Operative roles will appear after cases are logged",
            )
          else
            ...sortedDistribution.map(
              (item) => _roleRow(context, item.role, item.count),
            ),
        ],
      ),
    );
  }

  Widget _roleRow(BuildContext context, String role, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Flexible(child: Text(_formatRole(role))),

          Text(
            count.toString(),

            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
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
