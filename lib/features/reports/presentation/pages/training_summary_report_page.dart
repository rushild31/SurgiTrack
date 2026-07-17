import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';
import 'package:surgitrack/features/reports/data/pdf/training_summary_pdf_generator.dart';

import 'package:surgitrack/features/reports/data/export/export_repository.dart';

import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';

class TrainingSummaryReportPage extends ConsumerWidget {
  const TrainingSummaryReportPage({super.key});

  Future<void> exportPdf(TrainingPeriodReport report) async {
    final generator = TrainingSummaryPdfGenerator();

    final widgets = generator.build(report);

    final pdfService = PdfService();

    final bytes = await pdfService.generatePdf(content: widgets);

    await pdfService.previewPdf(pdfBytes: bytes);
  }

  Future<void> exportExcel(TrainingPeriodReport report) async {
    final repository = ExportRepository();

    final bytes = await repository.exportTrainingSummary(report);

    debugPrint("Training Summary Excel generated: ${bytes.length} bytes");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(
      trainingPeriodReportProvider(AnalyticsReportFilter.empty),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Summary"),

        actions: [
          report.when(
            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),

            data: (summary) {
              return Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.picture_as_pdf),

                    onPressed: () {
                      exportPdf(summary);
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.table_chart),

                    onPressed: () {
                      exportExcel(summary);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (summary) {
          return ListView(
            padding: const EdgeInsets.all(16),

            children: [
              SummaryHeader(report: summary),

              const SizedBox(height: 20),

              const Text(
                "Specialty Distribution",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              ...summary.specialtyDistribution.entries.map(
                (entry) => SummaryRow(label: entry.key, value: entry.value),
              ),

              const SizedBox(height: 20),

              const Text(
                "Operative Role Distribution",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              SummaryRow(label: "Observed", value: summary.observedCases),

              SummaryRow(label: "Assisted", value: summary.assistedCases),

              SummaryRow(label: "Supervised", value: summary.supervisedCases),

              SummaryRow(label: "Independent", value: summary.independentCases),
            ],
          );
        },
      ),
    );
  }
}

class SummaryHeader extends StatelessWidget {
  final TrainingPeriodReport report;

  const SummaryHeader({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Training Period",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(report.period),

            const SizedBox(height: 12),

            const Text(
              "Total Cases",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(
              report.totalCases.toString(),

              style: const TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;

  final int value;

  const SummaryRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [Text(label), Text(value.toString())],
      ),
    );
  }
}
