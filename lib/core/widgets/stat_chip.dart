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
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            if (icon != null) ...[
              Icon(icon, color: theme.colorScheme.secondary),

              const SizedBox(width: 10),
            ],

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  value,

                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 2),

                Text(label, style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
