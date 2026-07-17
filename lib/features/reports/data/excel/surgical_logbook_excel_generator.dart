import 'package:excel/excel.dart';

import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';

class SurgicalLogbookExcelGenerator {
  Excel build(MonthlyOperativeLogReport report) {
    final excel = Excel.createExcel();

    final sheet = excel['Surgical Logbook'];

    sheet.appendRow([
      TextCellValue('Sr No'),
      TextCellValue('Patient Name'),
      TextCellValue('Hospital ID / MRD'),
      TextCellValue('Age / Sex'),
      TextCellValue('Admission Date'),
      TextCellValue('Diagnosis'),
      TextCellValue('Surgery Date'),
      TextCellValue('Procedure(s)'),
      TextCellValue('Operative Role'),
    ]);

    for (final entry in report.entries) {
      sheet.appendRow([
        IntCellValue(entry.serialNumber),
        TextCellValue(entry.patientName),
        TextCellValue(entry.hospitalId),
        TextCellValue(entry.ageSex),
        TextCellValue(entry.admissionDate?.toString().split(' ').first ?? ''),
        TextCellValue(entry.diagnosis),
        TextCellValue(entry.surgeryDate.toString().split(' ').first),
        TextCellValue(entry.procedures.join(', ')),
        TextCellValue(entry.operativeRole),
      ]);
    }

    return excel;
  }
}
