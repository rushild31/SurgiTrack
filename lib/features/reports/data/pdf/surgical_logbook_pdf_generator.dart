import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';

class SurgicalLogbookPdfGenerator {
  List<pw.Widget> build(List<SurgicalLogbookEntry> entries) {
    return [
      pw.Text(
        "Surgical Logbook",
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: [
          "Date",
          "Diagnosis",
          "Procedure",
          "Specialty",
          "Role",
          "Approach",
          "Case Type",
          "Complexity",
        ],

        data: entries.map((entry) {
          return [
            entry.surgeryDate.toString().split(" ").first,
            entry.diagnosis,
            entry.procedures.join(", "),
            entry.specialty,
            entry.operativeRole,
            entry.approach,
            entry.caseType,
            entry.complexity,
          ];
        }).toList(),
      ),
    ];
  }
}
