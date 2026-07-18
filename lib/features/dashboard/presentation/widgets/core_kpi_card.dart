import 'package:flutter/material.dart';

import 'package:surgitrack/core/widgets/app_card.dart';

class CoreKpiCard extends StatelessWidget {
  final String title;

  final int value;

  final IconData icon;

  const CoreKpiCard({
    super.key,

    required this.title,

    required this.value,

    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          CircleAvatar(radius: 24, child: Icon(icon)),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(title, style: Theme.of(context).textTheme.bodyMedium),

                const SizedBox(height: 4),

                Text(
                  value.toString(),

                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
