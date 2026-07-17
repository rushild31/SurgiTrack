import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/training_period_report.dart';

class TrainingSummaryExcelGenerator {
  Excel build(TrainingPeriodReport report) {
    final excel = Excel.createExcel();

    final sheet = excel['Training Summary'];

    sheet.appendRow([TextCellValue('Metric'), TextCellValue('Count')]);

    final metrics = [
      ['Period', report.period],

      ['Total Cases', report.totalCases.toString()],

      ['Independent Cases', report.independentCases.toString()],

      ['Supervised Cases', report.supervisedCases.toString()],

      ['Assisted Cases', report.assistedCases.toString()],

      ['Observed Cases', report.observedCases.toString()],
    ];

    for (final row in metrics) {
      sheet.appendRow([TextCellValue(row[0]), TextCellValue(row[1])]);
    }

    final specialtySheet = excel['Specialty Distribution'];

    specialtySheet.appendRow([
      TextCellValue('Specialty'),

      TextCellValue('Cases'),
    ]);

    report.specialtyDistribution.forEach((key, value) {
      specialtySheet.appendRow([TextCellValue(key), IntCellValue(value)]);
    });

    return excel;
  }
}
