import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';

class ProcedureExposurePage extends ConsumerWidget {
  const ProcedureExposurePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(procedureExposureReportProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Procedure Exposure")),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (procedures) {
          if (procedures.isEmpty) {
            return const Center(child: Text("No procedure exposure recorded"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),

            itemCount: procedures.length,

            itemBuilder: (context, index) {
              return ProcedureExposureCard(report: procedures[index]);
            },
          );
        },
      ),
    );
  }
}

class ProcedureExposureCard extends StatelessWidget {
  final ProcedureExposureReport report;

  const ProcedureExposureCard({super.key, required this.report});

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
              report.procedureName,

              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "Total Exposure: "
              "${report.totalCases}",
            ),

            const SizedBox(height: 8),

            ExposureRow(label: "Observed", value: report.observed),

            ExposureRow(label: "Assisted", value: report.assisted),

            ExposureRow(label: "Supervised", value: report.supervised),

            ExposureRow(label: "Independent", value: report.independent),
          ],
        ),
      ),
    );
  }
}

class ExposureRow extends StatelessWidget {
  final String label;

  final int value;

  const ExposureRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [Text(label), Text(value.toString())],
      ),
    );
  }
}
