import 'package:flutter/material.dart';

class QuickActionButton extends StatelessWidget {
  final String label;

  final IconData icon;

  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: onTap,

      child: Container(
        width: 150,

        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),

          color: Theme.of(context).colorScheme.surface,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(icon, size: 28),

            const SizedBox(height: 10),

            Text(
              label,

              textAlign: TextAlign.center,

              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
