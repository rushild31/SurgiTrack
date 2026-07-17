import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';
import 'package:surgitrack/features/reports/data/pdf/procedure_exposure_pdf_generator.dart';

import 'package:surgitrack/features/reports/data/export/export_repository.dart';

class ProcedureExposurePage extends ConsumerWidget {
  const ProcedureExposurePage({super.key});

  Future<void> exportPdf(List<ProcedureExposureReport> reports) async {
    final generator = ProcedureExposurePdfGenerator();

    final widgets = generator.build(reports);

    final pdfService = PdfService();

    final bytes = await pdfService.generatePdf(content: widgets);

    await pdfService.previewPdf(pdfBytes: bytes);
  }

  Future<void> exportExcel(List<ProcedureExposureReport> reports) async {
    final repository = ExportRepository();

    final bytes = await repository.exportProcedureExposure(reports);

    debugPrint("Procedure Exposure Excel generated: ${bytes.length} bytes");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(procedureExposureReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Procedure Exposure"),

        actions: [
          report.when(
            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),

            data: (procedures) {
              if (procedures.isEmpty) {
                return const SizedBox();
              }

              return Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.picture_as_pdf),

                    onPressed: () {
                      exportPdf(procedures);
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.table_chart),

                    onPressed: () {
                      exportExcel(procedures);
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

            Text("Total Exposure: ${report.totalCases}"),

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
