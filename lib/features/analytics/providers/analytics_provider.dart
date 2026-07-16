import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/analytics/data/analytics_repository.dart';

import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';

import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';

import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';

import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';

import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository(ref.watch(databaseProvider));
});

// =========================
// Overall Statistics
// =========================

final analyticsStatisticsProvider = FutureProvider<AnalyticsStatistics>((
  ref,
) async {
  return ref.watch(analyticsRepositoryProvider).getStatistics();
});

// =========================
// Procedure Exposure
// =========================

final procedureExposureProvider = FutureProvider<List<ProcedureExposure>>((
  ref,
) async {
  return ref.watch(analyticsRepositoryProvider).getProcedureExposure();
});

// =========================
// Technical Step Exposure
// =========================

final technicalStepExposureProvider =
    FutureProvider<List<TechnicalStepExposure>>((ref) async {
      return ref.watch(analyticsRepositoryProvider).getTechnicalStepExposure();
    });

// =========================
// Monthly Case Trend
// =========================

final monthlyCaseTrendProvider = FutureProvider<List<MonthlyCaseTrend>>((
  ref,
) async {
  return ref.watch(analyticsRepositoryProvider).getMonthlyCaseTrend();
});

// =========================
// Operative Role Distribution
// =========================

final operativeRoleDistributionProvider =
    FutureProvider<List<OperativeRoleDistribution>>((ref) async {
      return ref
          .watch(analyticsRepositoryProvider)
          .getOperativeRoleDistribution();
    });
