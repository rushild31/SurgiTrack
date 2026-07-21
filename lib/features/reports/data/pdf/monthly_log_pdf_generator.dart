import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';

class MonthlyLogPdfGenerator {
  List<pw.Widget> build(MonthlyOperativeLogReport report) {
    return [
      pw.Text(
        'Monthly Operative Log',
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 6),

      pw.Text(
        '${report.month}  •  ${report.totalCases} Cases',
        style: const pw.TextStyle(fontSize: 10),
      ),

      pw.SizedBox(height: 18),

      if (report.entries.isEmpty)
        pw.Text(
          'No operative cases found for the selected period.',
          style: const pw.TextStyle(fontSize: 11),
        )
      else
        pw.TableHelper.fromTextArray(
          headers: const [
            'Sr',
            'Patient',
            'Hospital ID',
            'Age/Sex',
            'Admission',
            'Diagnosis',
            'Surgery Date',
            'Procedure',
            'Role',
          ],

          headerStyle: pw.TextStyle(
            fontSize: 7,
            fontWeight: pw.FontWeight.bold,
          ),

          cellStyle: const pw.TextStyle(fontSize: 7),

          cellAlignment: pw.Alignment.centerLeft,

          cellPadding: const pw.EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),

          border: pw.TableBorder.all(width: 0.5),

          columnWidths: {
            0: const pw.FixedColumnWidth(20),
            1: const pw.FlexColumnWidth(2.2),
            2: const pw.FlexColumnWidth(1.5),
            3: const pw.FlexColumnWidth(1),
            4: const pw.FlexColumnWidth(1.3),
            5: const pw.FlexColumnWidth(2.3),
            6: const pw.FlexColumnWidth(1.3),
            7: const pw.FlexColumnWidth(2.4),
            8: const pw.FlexColumnWidth(1.5),
          },

          data: report.entries.map((entry) {
            return [
              entry.serialNumber.toString(),
              entry.patientName,
              entry.hospitalId,
              entry.ageSex,
              _formatDate(entry.admissionDate),
              entry.diagnosis,
              _formatDate(entry.surgeryDate),
              entry.procedures.join(', '),
              entry.operativeRole,
            ];
          }).toList(),
        ),
    ];
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';

    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.year}';
  }
}
