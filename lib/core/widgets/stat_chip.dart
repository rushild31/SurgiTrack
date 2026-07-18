import 'package:flutter/material.dart';

class StatChip extends StatelessWidget {
  final String label;

  final String value;

  final IconData? icon;

  const StatChip({
    super.key,

    required this.label,

    required this.value,

    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  value,

                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(label),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
