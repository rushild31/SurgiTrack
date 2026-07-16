import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';

class TechnicalSkillPdfGenerator {
  List<pw.Widget> build(List<TechnicalSkillReport> reports) {
    return [
      pw.Text(
        "Technical Skill Exposure Report",

        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: [
          "Technical Skill",

          "Exposure",

          "Observed",

          "Assisted",

          "Supervised",

          "Independent",
        ],

        data: reports.map((report) {
          return [
            report.skillName,

            report.exposure.toString(),

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
