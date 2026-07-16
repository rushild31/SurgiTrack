import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/reports_provider.dart';
import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';

class SurgicalLogbookPage extends ConsumerWidget {
  const SurgicalLogbookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(surgicalLogbookReportProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Surgical Logbook")),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (entries) {
          if (entries.isEmpty) {
            return const Center(child: Text("No surgical cases recorded"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),

            itemCount: entries.length,

            itemBuilder: (context, index) {
              return SurgicalLogbookCard(entry: entries[index]);
            },
          );
        },
      ),
    );
  }
}

class SurgicalLogbookCard extends StatelessWidget {
  final SurgicalLogbookEntry entry;

  const SurgicalLogbookCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "${entry.surgeryDate.day}/"
              "${entry.surgeryDate.month}/"
              "${entry.surgeryDate.year}",

              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text("Diagnosis: ${entry.diagnosis}"),

            const SizedBox(height: 4),

            Text(
              "Procedure: "
              "${entry.procedures.join(", ")}",
            ),

            const SizedBox(height: 4),

            Text("Specialty: ${entry.specialty}"),

            Text("Role: ${entry.operativeRole}"),

            Text("Approach: ${entry.approach}"),

            Text("Complexity: ${entry.complexity}"),
          ],
        ),
      ),
    );
  }
}
