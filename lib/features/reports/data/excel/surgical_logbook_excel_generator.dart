import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';

class SurgicalLogbookExcelGenerator {
  Excel build(List<SurgicalLogbookEntry> entries) {
    final excel = Excel.createExcel();

    final sheet = excel['Surgical Logbook'];

    sheet.appendRow([
      TextCellValue('Sr No'),
      TextCellValue('Surgery Date'),
      TextCellValue('Diagnosis'),
      TextCellValue('Procedure(s)'),
      TextCellValue('Specialty'),
      TextCellValue('Operative Role'),
      TextCellValue('Approach'),
      TextCellValue('Case Type'),
      TextCellValue('Complexity'),
    ]);

    for (int i = 0; i < entries.length; i++) {
      final entry = entries[i];

      sheet.appendRow([
        IntCellValue(i + 1),

        TextCellValue(entry.surgeryDate.toString().split(' ').first),

        TextCellValue(entry.diagnosis),

        TextCellValue(entry.procedures.join(', ')),

        TextCellValue(entry.specialty),

        TextCellValue(entry.operativeRole),

        TextCellValue(entry.approach),

        TextCellValue(entry.caseType),

        TextCellValue(entry.complexity),
      ]);
    }

    return excel;
  }
}
