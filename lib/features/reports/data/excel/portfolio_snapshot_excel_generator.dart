import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/portfolio_snapshot_data.dart';

class PortfolioSnapshotExcelGenerator {
  Excel build(PortfolioSnapshotData data) {
    final excel = Excel.createExcel();

    final sheet = excel['Portfolio Snapshot'];

    sheet.appendRow([TextCellValue('Parameter'), TextCellValue('Value')]);

    final rows = [
      ['Total Cases', data.totalCases],
      ['Total Patients', data.totalPatients],
      ['Total Procedures', data.totalProcedures],

      ['Cardiac Cases', data.cardiacCases],
      ['Thoracic Cases', data.thoracicCases],
      ['Vascular Cases', data.vascularCases],

      ['Independent Cases', data.independentCases],
      ['Supervised Cases', data.supervisedCases],
      ['Assisted Cases', data.assistedCases],
      ['Observed Cases', data.observedCases],
    ];

    for (final row in rows) {
      sheet.appendRow([
        TextCellValue(row[0].toString()),
        IntCellValue(row[1] as int),
      ]);
    }

    return excel;
  }
}
