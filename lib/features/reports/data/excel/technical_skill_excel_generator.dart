import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';

class TechnicalSkillExcelGenerator {
  Excel build(List<TechnicalSkillReport> reports) {
    final excel = Excel.createExcel();

    final sheet = excel['Technical Skills'];

    sheet.appendRow([
      TextCellValue('Sr No'),
      TextCellValue('Skill Name'),
      TextCellValue('Total Exposure'),
      TextCellValue('Observed'),
      TextCellValue('Assisted'),
      TextCellValue('Supervised'),
      TextCellValue('Independent'),
    ]);

    for (var i = 0; i < reports.length; i++) {
      final report = reports[i];

      sheet.appendRow([
        IntCellValue(i + 1),
        TextCellValue(report.skillName),
        IntCellValue(report.exposure),
        IntCellValue(report.observed),
        IntCellValue(report.assisted),
        IntCellValue(report.supervised),
        IntCellValue(report.independent),
      ]);
    }

    return excel;
  }
}
