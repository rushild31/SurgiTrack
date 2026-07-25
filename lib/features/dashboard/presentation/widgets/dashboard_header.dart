import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final greeting = _GreetingData.fromTime(DateTime.now());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(greeting.icon, size: 34, color: theme.colorScheme.primary),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${greeting.message}, Dr. Rushil Dalwadi',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'Your surgical training portfolio',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GreetingData {
  final String message;
  final IconData icon;

  const _GreetingData({required this.message, required this.icon});

  factory _GreetingData.fromTime(DateTime time) {
    final hour = time.hour;

    if (hour >= 6 && hour < 12) {
      return const _GreetingData(
        message: 'Good Morning',
        icon: Icons.wb_sunny_outlined,
      );
    }

    if (hour >= 12 && hour < 16) {
      return const _GreetingData(
        message: 'Good Afternoon',
        icon: Icons.bolt_outlined,
      );
    }

    if (hour >= 16 && hour < 20) {
      return const _GreetingData(
        message: 'Good Evening',
        icon: Icons.wb_twilight_outlined,
      );
    }

    return const _GreetingData(
      message: 'Good Night',
      icon: Icons.nightlight_outlined,
    );
  }
}
