import 'package:excel/excel.dart';

class PortfolioSnapshotData {
  final String traineeName;

  final String trainingProgram;

  final String trainingPeriod;

  final int totalCases;

  final int totalPatients;

  final int totalProcedures;

  final int cardiacCases;

  final int thoracicCases;

  final int vascularCases;

  const PortfolioSnapshotData({
    required this.traineeName,
    required this.trainingProgram,
    required this.trainingPeriod,
    required this.totalCases,
    required this.totalPatients,
    required this.totalProcedures,
    required this.cardiacCases,
    required this.thoracicCases,
    required this.vascularCases,
  });
}

class PortfolioSnapshotExcelGenerator {
  Excel build(PortfolioSnapshotData data) {
    final excel = Excel.createExcel();

    final sheet = excel['Portfolio Snapshot'];

    sheet.appendRow([TextCellValue('Parameter'), TextCellValue('Value')]);

    final rows = [
      ['Trainee', data.traineeName],

      ['Training Program', data.trainingProgram],

      ['Training Period', data.trainingPeriod],

      ['Total Cases', data.totalCases.toString()],

      ['Total Patients', data.totalPatients.toString()],

      ['Total Procedures', data.totalProcedures.toString()],

      ['Cardiac Cases', data.cardiacCases.toString()],

      ['Thoracic Cases', data.thoracicCases.toString()],

      ['Vascular Cases', data.vascularCases.toString()],
    ];

    for (final row in rows) {
      sheet.appendRow([TextCellValue(row[0]), TextCellValue(row[1])]);
    }

    return excel;
  }
}
