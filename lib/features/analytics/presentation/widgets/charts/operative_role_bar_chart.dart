import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

class OperativeRoleBarChart extends StatelessWidget {
  final List<OperativeRoleDistribution> distribution;

  const OperativeRoleBarChart({super.key, required this.distribution});

  String _formatRole(String role) {
    switch (role) {
      case 'observed':
        return 'Observed';

      case 'assisted':
        return 'Assisted';

      case 'performed_under_supervision':
        return 'Supervised';

      case 'performed_independently':
        return 'Independent';

      default:
        return role;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (distribution.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('No operative role data available yet.'),
      );
    }

    final maxValue = distribution
        .map((e) => e.count)
        .fold<int>(0, (a, b) => a > b ? a : b);

    return Column(
      children: distribution.map((item) {
        final progress = maxValue == 0 ? 0 : item.count / maxValue;

        return Padding(
          padding: const EdgeInsets.only(bottom: 14),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(_formatRole(item.role)),

                  Text(item.count.toString()),
                ],
              ),

              const SizedBox(height: 6),

              LinearProgressIndicator(value: progress.toDouble(), minHeight: 8),
            ],
          ),
        );
      }).toList(),
    );
  }
}
