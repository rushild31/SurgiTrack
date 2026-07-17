import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';

class MonthlyLogPdfGenerator {
  List<pw.Widget> build(MonthlyOperativeLogReport report) {
    return [
      pw.Text(
        "Monthly Operative Log",
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 10),

      pw.Text("${report.month} (${report.totalCases} Cases)"),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: const [
          "Sr",
          "Patient",
          "Hospital ID",
          "Age/Sex",
          "Admission",
          "Diagnosis",
          "Surgery Date",
          "Procedure",
          "Role",
        ],

        headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),

        cellStyle: const pw.TextStyle(fontSize: 7),

        cellAlignment: pw.Alignment.centerLeft,

        columnWidths: {
          0: const pw.FixedColumnWidth(20),
          1: const pw.FlexColumnWidth(2),
          2: const pw.FlexColumnWidth(1.5),
          3: const pw.FlexColumnWidth(1),
          4: const pw.FlexColumnWidth(1.2),
          5: const pw.FlexColumnWidth(2),
          6: const pw.FlexColumnWidth(1.2),
          7: const pw.FlexColumnWidth(2),
          8: const pw.FlexColumnWidth(1.3),
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
            entry.procedures.join(", "),
            entry.operativeRole,
          ];
        }).toList(),
      ),
    ];
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "-";

    return "${date.day}-${date.month}-${date.year}";
  }
}
