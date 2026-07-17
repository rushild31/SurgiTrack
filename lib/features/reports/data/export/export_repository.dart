import 'dart:typed_data';

import 'package:surgitrack/features/reports/data/excel/excel_service.dart';

import 'package:surgitrack/features/reports/data/excel/patient_database_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/surgical_logbook_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/procedure_exposure_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/portfolio_snapshot_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/training_summary_excel_generator.dart';

import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

class ExportRepository {
  final ExcelService _excelService = ExcelService();

  Future<Uint8List> exportPatientDatabase(List<Patient> patients) async {
    final workbook = PatientDatabaseExcelGenerator().build(patients);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportSurgicalLogbook(
    MonthlyOperativeLogReport report,
  ) async {
    final workbook = SurgicalLogbookExcelGenerator().build(report);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportProcedureExposure(
    List<ProcedureExposureReport> reports,
  ) async {
    final workbook = ProcedureExposureExcelGenerator().build(reports);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportPortfolioSnapshot(PortfolioSnapshotData data) async {
    final workbook = PortfolioSnapshotExcelGenerator().build(data);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportTrainingSummary(TrainingPeriodReport report) async {
    final workbook = TrainingSummaryExcelGenerator().build(report);

    return _excelService.generateExcel(workbook: workbook);
  }
}
