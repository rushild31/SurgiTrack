import 'dart:typed_data';

import 'package:surgitrack/features/reports/data/excel/excel_service.dart';

import 'package:surgitrack/features/reports/data/excel/patient_database_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/surgical_logbook_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/procedure_exposure_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/portfolio_snapshot_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/training_summary_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/technical_skill_excel_generator.dart';
import 'package:surgitrack/features/reports/data/excel/monthly_operative_log_excel_generator.dart';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';
import 'package:surgitrack/features/reports/data/pdf/monthly_log_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/portfolio_snapshot_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/procedure_exposure_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/surgical_logbook_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/technical_skill_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/training_summary_pdf_generator.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';
import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';
import 'package:surgitrack/features/reports/domain/portfolio_snapshot_data.dart';

class ExportRepository {
  final ExcelService _excelService = ExcelService();

  final PdfService _pdfService = PdfService();

  // =====================================================
  // EXCEL EXPORTS
  // =====================================================

  Future<Uint8List> exportPatientDatabase(List<Patient> patients) async {
    final workbook = PatientDatabaseExcelGenerator().build(patients);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportMonthlyOperativeLog(
    MonthlyOperativeLogReport report,
  ) async {
    final workbook = MonthlyOperativeLogExcelGenerator().build(report);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportSurgicalLogbook(
    List<SurgicalLogbookEntry> entries,
  ) async {
    final workbook = SurgicalLogbookExcelGenerator().build(entries);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportProcedureExposure(
    List<ProcedureExposureReport> reports,
  ) async {
    final workbook = ProcedureExposureExcelGenerator().build(reports);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportTechnicalSkill(
    List<TechnicalSkillReport> reports,
  ) async {
    final workbook = TechnicalSkillExcelGenerator().build(reports);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportTrainingSummary(TrainingPeriodReport report) async {
    final workbook = TrainingSummaryExcelGenerator().build(report);

    return _excelService.generateExcel(workbook: workbook);
  }

  Future<Uint8List> exportPortfolioSnapshot(PortfolioSnapshotData data) async {
    final workbook = PortfolioSnapshotExcelGenerator().build(data);

    return _excelService.generateExcel(workbook: workbook);
  }

  // =====================================================
  // PDF EXPORTS
  // =====================================================

  Future<Uint8List> exportMonthlyOperativeLogPdf(
    MonthlyOperativeLogReport report,
  ) async {
    return _pdfService.generatePdf(
      title: 'Monthly Operative Log',
      content: MonthlyLogPdfGenerator().build(report),
    );
  }

  Future<Uint8List> exportSurgicalLogbookPdf(
    List<SurgicalLogbookEntry> entries,
  ) async {
    return _pdfService.generatePdf(
      title: 'Surgical Logbook',
      content: SurgicalLogbookPdfGenerator().build(entries),
    );
  }

  Future<Uint8List> exportProcedureExposurePdf(
    List<ProcedureExposureReport> reports,
  ) async {
    return _pdfService.generatePdf(
      title: 'Procedure Exposure Report',
      content: ProcedureExposurePdfGenerator().build(reports),
    );
  }

  Future<Uint8List> exportTechnicalSkillPdf(
    List<TechnicalSkillReport> reports,
  ) async {
    return _pdfService.generatePdf(
      title: 'Technical Skill Exposure Report',
      content: TechnicalSkillPdfGenerator().build(reports),
    );
  }

  Future<Uint8List> exportTrainingSummaryPdf(
    TrainingPeriodReport report,
  ) async {
    return _pdfService.generatePdf(
      title: 'Training Summary Report',
      content: TrainingSummaryPdfGenerator().build(report),
    );
  }

  Future<Uint8List> exportPortfolioSnapshotPdf(
    PortfolioSnapshotData data,
  ) async {
    return _pdfService.generatePdf(
      title: 'Training Portfolio Snapshot',
      content: PortfolioSnapshotPdfGenerator().build(data),
    );
  }

  // =====================================================
  // PDF PREVIEW
  // =====================================================

  Future<void> previewPdf(Uint8List pdfBytes) async {
    await _pdfService.previewPdf(pdfBytes: pdfBytes);
  }
}
