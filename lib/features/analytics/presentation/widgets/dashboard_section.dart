import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  final String title;

  final Widget child;

  final EdgeInsetsGeometry padding;

  const DashboardSection({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            child,
          ],
        ),
      ),
    );
  }
}
