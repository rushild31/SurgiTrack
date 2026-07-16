import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';

class ProcedureExposurePdfGenerator {
  List<pw.Widget> build(List<ProcedureExposureReport> reports) {
    return [
      pw.Text(
        "Procedure Exposure Report",

        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: [
          "Procedure",

          "Total",

          "Observed",

          "Assisted",

          "Supervised",

          "Independent",
        ],

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
