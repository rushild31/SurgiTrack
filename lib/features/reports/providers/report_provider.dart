import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_repository_provider.dart';

import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';
import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';

import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';

// =====================================================
// SURGICAL LOGBOOK REPORT
// =====================================================

final surgicalLogbookReportProvider =
    FutureProvider<List<SurgicalLogbookEntry>>((ref) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getSurgicalLogbook();
    });

// =====================================================
// PROCEDURE EXPOSURE REPORT
// =====================================================

final procedureExposureReportProvider =
    FutureProvider<List<ProcedureExposureReport>>((ref) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getProcedureExposureReport();
    });

// =====================================================
// TECHNICAL SKILL REPORT
// =====================================================

final technicalSkillReportProvider = FutureProvider<List<TechnicalSkillReport>>(
  (ref) async {
    final repository = ref.watch(reportRepositoryProvider);

    return repository.getTechnicalSkillReport();
  },
);

// =====================================================
// TRAINING PERIOD REPORT
// =====================================================

final trainingPeriodReportProvider =
    FutureProvider.family<TrainingPeriodReport, AnalyticsReportFilter>((
      ref,
      filter,
    ) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getTrainingPeriodReport(filter: filter);
    });

// =====================================================
// MONTHLY OPERATIVE LOG REPORT
// =====================================================

final monthlyOperativeLogReportProvider =
    FutureProvider.family<MonthlyOperativeLogReport, DateTimeRange>((
      ref,
      range,
    ) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getMonthlyOperativeLogReport(
        from: range.start,

        to: range.end,
      );
    });
