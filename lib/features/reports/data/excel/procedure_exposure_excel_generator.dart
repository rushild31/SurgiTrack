import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';

class ProcedureExposureExcelGenerator {
  Excel build(List<ProcedureExposureReport> reports) {
    final excel = Excel.createExcel();

    final sheet = excel['Procedure Exposure'];

    sheet.appendRow([
      TextCellValue('Sr No'),

      TextCellValue('Procedure'),

      TextCellValue('Total Cases'),

      TextCellValue('Observed'),

      TextCellValue('Assisted'),

      TextCellValue('Supervised'),

      TextCellValue('Independent'),

      TextCellValue('Total Exposure'),
    ]);

    for (int i = 0; i < reports.length; i++) {
      final report = reports[i];

      sheet.appendRow([
        IntCellValue(i + 1),

        TextCellValue(report.procedureName),

        IntCellValue(report.totalCases),

        IntCellValue(report.observed),

        IntCellValue(report.assisted),

        IntCellValue(report.supervised),

        IntCellValue(report.independent),

        IntCellValue(report.totalExposure),
      ]);
    }

    return excel;
  }
}
