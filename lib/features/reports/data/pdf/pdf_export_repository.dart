import 'dart:typed_data';

import 'package:surgitrack/features/reports/data/pdf/pdf_service.dart';

import 'package:surgitrack/features/reports/data/pdf/monthly_log_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/portfolio_snapshot_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/procedure_exposure_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/surgical_logbook_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/technical_skill_pdf_generator.dart';
import 'package:surgitrack/features/reports/data/pdf/training_summary_pdf_generator.dart';

import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';
import 'package:surgitrack/features/reports/domain/portfolio_snapshot_data.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';
import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';

class PdfExportRepository {
  final PdfService _pdfService = PdfService();

  Future<Uint8List> exportMonthlyOperativeLog(
    MonthlyOperativeLogReport report,
  ) async {
    final content = MonthlyLogPdfGenerator().build(report);

    return _pdfService.generatePdf(
      content: content,
      title: 'Monthly Operative Log',
    );
  }

  Future<Uint8List> exportPortfolioSnapshot(PortfolioSnapshotData data) async {
    final content = PortfolioSnapshotPdfGenerator().build(data);

    return _pdfService.generatePdf(
      content: content,
      title: 'Training Portfolio Snapshot',
    );
  }

  Future<Uint8List> exportProcedureExposure(
    List<ProcedureExposureReport> reports,
  ) async {
    final content = ProcedureExposurePdfGenerator().build(reports);

    return _pdfService.generatePdf(
      content: content,
      title: 'Procedure Exposure Report',
    );
  }

  Future<Uint8List> exportSurgicalLogbook(
    List<SurgicalLogbookEntry> entries,
  ) async {
    final content = SurgicalLogbookPdfGenerator().build(entries);

    return _pdfService.generatePdf(content: content, title: 'Surgical Logbook');
  }

  Future<Uint8List> exportTechnicalSkill(
    List<TechnicalSkillReport> reports,
  ) async {
    final content = TechnicalSkillPdfGenerator().build(reports);

    return _pdfService.generatePdf(
      content: content,
      title: 'Technical Skill Exposure Report',
    );
  }

  Future<Uint8List> exportTrainingSummary(TrainingPeriodReport report) async {
    final content = TrainingSummaryPdfGenerator().build(report);

    return _pdfService.generatePdf(
      content: content,
      title: 'Training Summary Report',
    );
  }
}
