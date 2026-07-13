import 'package:flutter/material.dart';

class OperativeRoleCard extends StatelessWidget {
  final int observed;

  final int assisted;

  final int supervised;

  final int independent;

  const OperativeRoleCard({
    super.key,

    required this.observed,

    required this.assisted,

    required this.supervised,

    required this.independent,
  });

  Widget _row(String title, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        children: [
          Expanded(child: Text(title)),

          Text(
            value.toString(),

            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Operative Role",

              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            _row("Observed", observed),

            _row("Assisted", assisted),

            _row("Performed under Supervision", supervised),

            _row("Performed Independently", independent),
          ],
        ),
      ),
    );
  }
}
