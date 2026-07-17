import 'package:excel/excel.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

class PatientDatabaseExcelGenerator {
  Excel build(List<Patient> patients) {
    final excel = Excel.createExcel();

    final sheet = excel['Patient Database'];

    sheet.appendRow([
      TextCellValue('Sr No'),
      TextCellValue('Patient ID'),
      TextCellValue('Patient Name'),
      TextCellValue('Hospital ID / MRD'),
      TextCellValue('Date of Birth'),
      TextCellValue('Blood Group'),
      TextCellValue('Comorbidities'),
      TextCellValue('Address'),
      TextCellValue('Admission Date'),
      TextCellValue('Past Operative History'),
      TextCellValue('Created'),
      TextCellValue('Last Updated'),
    ]);

    for (int i = 0; i < patients.length; i++) {
      final patient = patients[i];

      sheet.appendRow([
        IntCellValue(i + 1),
        TextCellValue(patient.patientId),
        TextCellValue(patient.name),
        TextCellValue(patient.hospitalId),
        TextCellValue(patient.dateOfBirth.toString().split(' ').first),
        TextCellValue(patient.bloodGroup ?? ''),
        TextCellValue(patient.comorbidities.join(', ')),
        TextCellValue(patient.address ?? ''),
        TextCellValue(patient.admissionDate?.toString().split(' ').first ?? ''),
        TextCellValue(patient.pastOperativeHistory ?? ''),
        TextCellValue(patient.createdAt.toString().split(' ').first),
        TextCellValue(patient.updatedAt.toString().split(' ').first),
      ]);
    }

    return excel;
  }
}
