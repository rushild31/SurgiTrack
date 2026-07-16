import 'package:flutter/material.dart';

class AnalyticsSummaryCard extends StatelessWidget {
  final String title;

  final String value;

  final IconData icon;

  const AnalyticsSummaryCard({
    super.key,

    required this.title,

    required this.value,

    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Icon(icon),

            const SizedBox(height: 12),

            Text(value, style: Theme.of(context).textTheme.headlineMedium),

            const SizedBox(height: 4),

            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
