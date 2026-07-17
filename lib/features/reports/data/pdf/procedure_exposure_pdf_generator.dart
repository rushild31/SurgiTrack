import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';

class ProcedureExposurePdfGenerator {
  List<pw.Widget> build(List<ProcedureExposureReport> reports) {
    if (reports.isEmpty) {
      return [
        pw.Text(
          "Procedure Exposure Report",
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 20),
        pw.Text("No procedure exposure data available."),
      ];
    }

    return [
      pw.Text(
        "Procedure Exposure Report",
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: const [
          "Procedure",
          "Total",
          "Observed",
          "Assisted",
          "Supervised",
          "Independent",
        ],

        headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),

        cellStyle: const pw.TextStyle(fontSize: 8),

        cellAlignment: pw.Alignment.centerLeft,

        columnWidths: {
          0: const pw.FlexColumnWidth(3),
          1: const pw.FixedColumnWidth(35),
          2: const pw.FixedColumnWidth(45),
          3: const pw.FixedColumnWidth(45),
          4: const pw.FixedColumnWidth(55),
          5: const pw.FixedColumnWidth(55),
        },

        data: reports.map((report) {
          return [
            report.procedureName,
            report.totalCases.toString(),
            report.observed.toString(),
            report.assisted.toString(),
            report.supervised.toString(),
            report.independent.toString(),
          ];
        }).toList(),
      ),
    ];
  }
}
