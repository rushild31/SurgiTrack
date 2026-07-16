import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_repository_provider.dart';

import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';

import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';

final surgicalLogbookReportProvider =
    FutureProvider<List<SurgicalLogbookEntry>>((ref) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getSurgicalLogbook();
    });

final procedureExposureReportProvider =
    FutureProvider<List<ProcedureExposureReport>>((ref) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getProcedureExposureReport();
    });

final technicalSkillReportProvider = FutureProvider<List<TechnicalSkillReport>>(
  (ref) async {
    final repository = ref.watch(reportRepositoryProvider);

    return repository.getTechnicalSkillReport();
  },
);

final trainingPeriodReportProvider =
    FutureProvider.family<TrainingPeriodReport, AnalyticsReportFilter>((
      ref,
      filter,
    ) async {
      final repository = ref.watch(reportRepositoryProvider);

      return repository.getTrainingPeriodReport(filter: filter);
    });
