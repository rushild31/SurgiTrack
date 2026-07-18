import 'package:flutter/material.dart';

class OperativeRoleCard extends StatelessWidget {
  final Map<String, int> data;

  const OperativeRoleCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final orderedRoles = [
      'observed',
      'assisted',
      'performed_under_supervision',
      'performed_independently',
    ];

    final sortedEntries = data.entries.toList()
      ..sort(
        (a, b) =>
            orderedRoles.indexOf(a.key).compareTo(orderedRoles.indexOf(b.key)),
      );

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

            if (sortedEntries.isEmpty)
              const Text("No operative data recorded yet")
            else
              ...sortedEntries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Flexible(child: Text(_formatRole(entry.key))),

                      Text(
                        entry.value.toString(),

                        style: const TextStyle(fontWeight: FontWeight.bold),
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
