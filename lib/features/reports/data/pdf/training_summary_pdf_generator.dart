import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/training_period_report.dart';

class TrainingSummaryPdfGenerator {
  List<pw.Widget> build(TrainingPeriodReport report) {
    return [
      pw.Text(
        "Training Summary Report",
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 10),

      pw.Text("Period: ${report.period}"),

      pw.SizedBox(height: 20),

      pw.Text(
        "Operative Exposure",
        style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 8),

      pw.TableHelper.fromTextArray(
        headers: const ["Metric", "Count"],

        headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),

        cellStyle: const pw.TextStyle(fontSize: 8),

        columnWidths: {
          0: const pw.FlexColumnWidth(3),
          1: const pw.FixedColumnWidth(60),
        },

        data: [
          ["Total Cases", report.totalCases.toString()],
          ["Independent", report.independentCases.toString()],
          ["Supervised", report.supervisedCases.toString()],
          ["Assisted", report.assistedCases.toString()],
          ["Observed", report.observedCases.toString()],
        ],
      ),

      pw.SizedBox(height: 20),

      pw.Text(
        "Specialty Distribution",
        style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 8),

      if (report.specialtyDistribution.isEmpty)
        pw.Text("No specialty distribution data available.")
      else
        pw.TableHelper.fromTextArray(
          headers: const ["Specialty", "Cases"],

          headerStyle: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 8,
          ),

          cellStyle: const pw.TextStyle(fontSize: 8),

          columnWidths: {
            0: const pw.FlexColumnWidth(3),
            1: const pw.FixedColumnWidth(60),
          },

          data: report.specialtyDistribution.entries.map((entry) {
            return [entry.key, entry.value.toString()];
          }).toList(),
        ),
    ];
  }
}
