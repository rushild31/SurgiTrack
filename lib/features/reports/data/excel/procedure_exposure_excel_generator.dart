import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';

class ProcedureExposureExcelGenerator {
  Excel build(List<ProcedureExposureReport> reports) {
    final excel = Excel.createExcel();

    final sheet = excel['Procedure Exposure'];

    // Header
    sheet.appendRow([
      TextCellValue('Procedure'),
      TextCellValue('Total Cases'),
      TextCellValue('Observed'),
      TextCellValue('Assisted'),
      TextCellValue('Supervised'),
      TextCellValue('Independent'),
    ]);

    // Data
    for (final report in reports) {
      sheet.appendRow([
        TextCellValue(report.procedureName),
        IntCellValue(report.totalCases),
        IntCellValue(report.observed),
        IntCellValue(report.assisted),
        IntCellValue(report.supervised),
        IntCellValue(report.independent),
      ]);
    }

    return excel;
  }
}
