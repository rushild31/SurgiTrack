import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';
import 'package:surgitrack/features/reports/data/pdf/technical_skill_pdf_generator.dart';

class TechnicalSkillReportPage extends ConsumerWidget {
  const TechnicalSkillReportPage({super.key});

  Future<void> exportPdf(List<TechnicalSkillReport> reports) async {
    final generator = TechnicalSkillPdfGenerator();

    final widgets = generator.build(reports);

    final pdfService = PdfService();

    final bytes = await pdfService.generatePdf(content: widgets);

    await pdfService.previewPdf(pdfBytes: bytes);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(technicalSkillReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Technical Skills"),

        actions: [
          report.when(
            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),

            data: (skills) {
              if (skills.isEmpty) {
                return const SizedBox();
              }

              return IconButton(
                icon: const Icon(Icons.picture_as_pdf),

                onPressed: () => exportPdf(skills),
              );
            },
          ),
        ],
      ),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (skills) {
          if (skills.isEmpty) {
            return const Center(
              child: Text("No technical skill exposure recorded"),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),

            itemCount: skills.length,

            itemBuilder: (context, index) {
              return TechnicalSkillCard(report: skills[index]);
            },
          );
        },
      ),
    );
  }
}

class TechnicalSkillCard extends StatelessWidget {
  final TechnicalSkillReport report;

  const TechnicalSkillCard({super.key, required this.report});

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
              report.skillName,

              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text("Exposure: ${report.exposure}"),

            const SizedBox(height: 8),

            SkillExposureRow(label: "Observed", value: report.observed),

            SkillExposureRow(label: "Assisted", value: report.assisted),

            SkillExposureRow(label: "Supervised", value: report.supervised),

            SkillExposureRow(label: "Independent", value: report.independent),
          ],
        ),
      ),
    );
  }
}

class SkillExposureRow extends StatelessWidget {
  final String label;
  final int value;

  const SkillExposureRow({super.key, required this.label, required this.value});

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
