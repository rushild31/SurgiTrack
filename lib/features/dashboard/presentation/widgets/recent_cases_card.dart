import 'package:flutter/material.dart';

import 'package:surgitrack/core/database/app_database.dart';

class RecentCasesCard extends StatelessWidget {
  final List<SurgicalCaseData> cases;

  const RecentCasesCard({super.key, required this.cases});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Recent Cases",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            if (cases.isEmpty)
              const Text("No cases recorded yet")
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
      ),
    );
  }
}
