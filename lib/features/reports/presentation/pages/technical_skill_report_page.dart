import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';
import 'package:surgitrack/features/reports/data/pdf/technical_skill_pdf_generator.dart';

import 'package:surgitrack/features/reports/data/export/export_repository.dart';
import 'package:surgitrack/features/reports/data/export/report_export_service.dart';

import 'package:surgitrack/features/reports/presentation/widgets/export_button.dart';

class TechnicalSkillReportPage extends ConsumerWidget {
  const TechnicalSkillReportPage({super.key});

  Future<void> exportPdf(List<TechnicalSkillReport> reports) async {
    final generator = TechnicalSkillPdfGenerator();

    final widgets = generator.build(reports);

    final pdfService = PdfService();

    final bytes = await pdfService.generatePdf(
      content: widgets,
      title: 'Technical Skill Exposure Report',
    );

    await ReportExportService.exportPdf(
      bytes: bytes,
      fileName: 'SurgiTrack_Technical_Skills.pdf',
    );
  }

  Future<void> exportExcel(List<TechnicalSkillReport> reports) async {
    final repository = ExportRepository();

    final bytes = await repository.exportTechnicalSkill(reports);

    await ReportExportService.exportExcel(
      bytes: bytes,
      fileName: 'SurgiTrack_Technical_Skills.xlsx',
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(technicalSkillReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Skills'),
        actions: [
          report.when(
            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),

            data: (skills) {
              if (skills.isEmpty) {
                return const SizedBox();
              }

              return ExportButton(
                onPdfExport: () => exportPdf(skills),
                onExcelExport: () => exportExcel(skills),
              );
            },
          ),
        ],
      ),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => Center(child: Text(error.toString())),

        data: (skills) {
          if (skills.isEmpty) {
            return const Center(
              child: Text('No technical skill exposure recorded'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(12),

            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Technical Skill Portfolio',

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Total Technical Steps Logged: '
                        '${skills.length}',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              ...skills.map((skill) => TechnicalSkillCard(report: skill)),
            ],
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

            Text('Exposure: ${report.exposure}'),

            const Divider(),

            SkillExposureRow(label: 'Observed', value: report.observed),

            SkillExposureRow(label: 'Assisted', value: report.assisted),

            SkillExposureRow(label: 'Supervised', value: report.supervised),

            SkillExposureRow(label: 'Independent', value: report.independent),
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
      padding: const EdgeInsets.symmetric(vertical: 3),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [Text(label), Text(value.toString())],
      ),
    );
  }
}
