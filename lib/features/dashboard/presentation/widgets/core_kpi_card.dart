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
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            width: 52,

            height: 52,

            decoration: BoxDecoration(shape: BoxShape.circle),

            child: Icon(icon, size: 28),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title.toUpperCase(),

                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    letterSpacing: 0.8,

                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value.toString(),

                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
