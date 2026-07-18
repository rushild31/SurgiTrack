import 'package:flutter/material.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/widgets/app_card.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(icon, size: 64),

            const SizedBox(height: 16),

            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(message, textAlign: TextAlign.center),

            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),

              ElevatedButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}

class RecentCasesCard extends StatelessWidget {
  final List<SurgicalCaseData> cases;

  const RecentCasesCard({super.key, required this.cases});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Recent Cases", style: Theme.of(context).textTheme.titleMedium),

          const SizedBox(height: 12),

          if (cases.isEmpty)
            const EmptyState(
              icon: Icons.folder_open,
              title: "No cases yet",
              message: "Start adding operative cases to build your portfolio",
            )
          else
            ...cases.map((caseData) {
              return ListTile(
                contentPadding: EdgeInsets.zero,

                title: Text(caseData.diagnosis),

                subtitle: Text(caseData.specialty),

                trailing: Text(
                  "${caseData.surgeryDate.day}/"
                  "${caseData.surgeryDate.month}/"
                  "${caseData.surgeryDate.year}",
                ),
              );
            }),
        ],
      ),
    );
  }
}
