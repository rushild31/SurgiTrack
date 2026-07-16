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

      pw.Text(
        "${report.month} "
        "(${report.totalCases} Cases)",
      ),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: [
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

        data: report.entries.map((entry) {
          return [
            entry.serialNumber.toString(),

            entry.patientName,

            entry.hospitalId,

            entry.ageSex,

            entry.admissionDate?.toString().split(" ").first ?? "-",

            entry.diagnosis,

            entry.surgeryDate.toString().split(" ").first,

            entry.procedures.join(", "),

            entry.operativeRole,
          ];
        }).toList(),
      ),
    ];
  }
}
