import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';

class SurgicalLogbookPdfGenerator {
  List<pw.Widget> build(List<SurgicalLogbookEntry> entries) {
    return [
      pw.Text(
        'Surgical Logbook',
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 6),

      pw.Text(
        '${entries.length} Total Cases',
        style: const pw.TextStyle(fontSize: 10),
      ),

      pw.SizedBox(height: 18),

      if (entries.isEmpty)
        pw.Text(
          'No surgical cases available.',
          style: const pw.TextStyle(fontSize: 11),
        )
      else
        pw.TableHelper.fromTextArray(
          headers: const [
            'Date',
            'Diagnosis',
            'Procedure',
            'Specialty',
            'Role',
            'Approach',
            'Case Type',
            'Complexity',
          ],

          headerStyle: pw.TextStyle(
            fontSize: 7,
            fontWeight: pw.FontWeight.bold,
          ),

          cellStyle: const pw.TextStyle(fontSize: 7),

          cellPadding: const pw.EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),

          cellAlignment: pw.Alignment.centerLeft,

          border: pw.TableBorder.all(width: 0.5),

          columnWidths: {
            0: const pw.FlexColumnWidth(1.2),
            1: const pw.FlexColumnWidth(2.3),
            2: const pw.FlexColumnWidth(2.5),
            3: const pw.FlexColumnWidth(1.3),
            4: const pw.FlexColumnWidth(1.5),
            5: const pw.FlexColumnWidth(1.5),
            6: const pw.FlexColumnWidth(1.5),
            7: const pw.FlexColumnWidth(1.3),
          },

          data: entries.map((entry) {
            return [
              _formatDate(entry.surgeryDate),
              entry.diagnosis,
              entry.procedures.join(', '),
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.year}';
  }
}
