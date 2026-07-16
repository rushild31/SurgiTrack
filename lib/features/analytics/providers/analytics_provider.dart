import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/analytics/data/analytics_repository.dart';

import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';
import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';
import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';
import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';
import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

import 'package:surgitrack/features/analytics/providers/analytics_filter_provider.dart';

// Repository

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository(ref.watch(databaseProvider));
});

// Current Filter

final currentAnalyticsFilterProvider = Provider((ref) {
  return ref.watch(analyticsFilterProvider);
});

// Statistics

final analyticsStatisticsProvider = FutureProvider<AnalyticsStatistics>((
  ref,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);

  final filter = ref.watch(currentAnalyticsFilterProvider);

  return repository.getStatistics(filter: filter);
});

// Procedure Exposure

final procedureExposureProvider = FutureProvider<List<ProcedureExposure>>((
  ref,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);

  final filter = ref.watch(currentAnalyticsFilterProvider);

  return repository.getProcedureExposure(filter: filter);
});

// Technical Steps

final technicalStepExposureProvider =
    FutureProvider<List<TechnicalStepExposure>>((ref) async {
      final repository = ref.watch(analyticsRepositoryProvider);

      final filter = ref.watch(currentAnalyticsFilterProvider);

      return repository.getTechnicalStepExposure(filter: filter);
    });

// Monthly Trend

final monthlyCaseTrendProvider = FutureProvider<List<MonthlyCaseTrend>>((
  ref,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);

  final filter = ref.watch(currentAnalyticsFilterProvider);

  return repository.getMonthlyCaseTrend(filter: filter);
});

// Operative Role

final operativeRoleDistributionProvider =
    FutureProvider<List<OperativeRoleDistribution>>((ref) async {
      final repository = ref.watch(analyticsRepositoryProvider);

      final filter = ref.watch(currentAnalyticsFilterProvider);

      return repository.getOperativeRoleDistribution(filter: filter);
    });
