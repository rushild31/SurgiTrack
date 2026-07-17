import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/training_period_report.dart';

class TrainingSummaryExcelGenerator {
  Excel build(TrainingPeriodReport report) {
    final excel = Excel.createExcel();

    final sheet = excel['Training Summary'];

    sheet.appendRow([TextCellValue('Parameter'), TextCellValue('Value')]);

    sheet.appendRow([
      TextCellValue('Training Period'),
      TextCellValue(report.period),
    ]);

    sheet.appendRow([
      TextCellValue('Total Cases'),
      IntCellValue(report.totalCases),
    ]);

    sheet.appendRow([]);

    sheet.appendRow([TextCellValue('Operative Role'), TextCellValue('Cases')]);

    sheet.appendRow([
      TextCellValue('Independent'),
      IntCellValue(report.independentCases),
    ]);

    sheet.appendRow([
      TextCellValue('Supervised'),
      IntCellValue(report.supervisedCases),
    ]);

    sheet.appendRow([
      TextCellValue('Assisted'),
      IntCellValue(report.assistedCases),
    ]);

    sheet.appendRow([
      TextCellValue('Observed'),
      IntCellValue(report.observedCases),
    ]);

    sheet.appendRow([]);

    sheet.appendRow([TextCellValue('Specialty'), TextCellValue('Cases')]);

    for (final entry in report.specialtyDistribution.entries) {
      sheet.appendRow([TextCellValue(entry.key), IntCellValue(entry.value)]);
    }

    return excel;
  }
}
