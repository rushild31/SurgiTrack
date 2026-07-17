import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';
import 'package:surgitrack/features/reports/data/pdf/monthly_log_pdf_generator.dart';

import 'package:surgitrack/features/reports/data/export/export_repository.dart';

import 'package:surgitrack/features/reports/presentation/widgets/export_button.dart';
import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';

class MonthlyOperativeLogPage extends ConsumerStatefulWidget {
  const MonthlyOperativeLogPage({super.key});

  @override
  ConsumerState<MonthlyOperativeLogPage> createState() =>
      _MonthlyOperativeLogPageState();
}

class _MonthlyOperativeLogPageState
    extends ConsumerState<MonthlyOperativeLogPage> {
  late DateTimeRange selectedRange;

  final ExportRepository exportRepository = ExportRepository();

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();

    selectedRange = DateTimeRange(
      start: DateTime(now.year, now.month, 1),

      end: DateTime(now.year, now.month + 1, 0),
    );
  }

  Future<void> pickMonth() async {
    final picked = await showDatePicker(
      context: context,

      initialDate: selectedRange.start,

      firstDate: DateTime(2020),

      lastDate: DateTime.now(),
    );

    if (picked == null) return;

    setState(() {
      selectedRange = DateTimeRange(
        start: DateTime(picked.year, picked.month, 1),

        end: DateTime(picked.year, picked.month + 1, 0),
      );
    });
  }

  Future<void> exportPdf(MonthlyOperativeLogReport report) async {
    final generator = MonthlyLogPdfGenerator();

    final widgets = generator.build(report);

    final pdfService = PdfService();

    final bytes = await pdfService.generatePdf(content: widgets);

    await pdfService.previewPdf(pdfBytes: bytes);
  }

  Future<void> exportExcel(MonthlyOperativeLogReport report) async {
    final bytes = await exportRepository.exportSurgicalLogbook(report);

    // Placeholder until file sharing/storage is added
    debugPrint("Excel generated: ${bytes.length} bytes");
  }

  @override
  Widget build(BuildContext context) {
    final report = ref.watch(monthlyOperativeLogReportProvider(selectedRange));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Operative Log"),

        actions: [
          ExportButton(
            onPdfExport: report.when(
              loading: () => null,

              error: (_, _) => null,

              data: (data) =>
                  () => exportPdf(data),
            ),

            onExcelExport: report.when(
              loading: () => null,

              error: (_, _) => null,

              data: (data) =>
                  () => exportExcel(data),
            ),
          ),

          IconButton(
            icon: const Icon(Icons.calendar_month),

            onPressed: pickMonth,
          ),
        ],
      ),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (data) {
          if (data.entries.isEmpty) {
            return const Center(child: Text("No cases found for this month"));
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: DataTable(
              columns: const [
                DataColumn(label: Text("Sr")),

                DataColumn(label: Text("Patient")),

                DataColumn(label: Text("Hospital ID")),

                DataColumn(label: Text("Age/Sex")),

                DataColumn(label: Text("Admission")),

                DataColumn(label: Text("Diagnosis")),

                DataColumn(label: Text("Surgery Date")),

                DataColumn(label: Text("Procedure")),

                DataColumn(label: Text("Role")),
              ],

              rows: data.entries
                  .map(
                    (entry) => DataRow(
                      cells: [
                        DataCell(Text(entry.serialNumber.toString())),

                        DataCell(Text(entry.patientName)),

                        DataCell(Text(entry.hospitalId)),

                        DataCell(Text(entry.ageSex)),

                        DataCell(
                          Text(
                            entry.admissionDate?.toString().split(" ").first ??
                                "-",
                          ),
                        ),

                        DataCell(Text(entry.diagnosis)),

                        DataCell(
                          Text(entry.surgeryDate.toString().split(" ").first),
                        ),

                        DataCell(Text(entry.procedures.join(", "))),

                        DataCell(Text(entry.operativeRole)),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
