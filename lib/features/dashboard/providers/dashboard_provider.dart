import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/dashboard/data/dashboard_repository.dart';

import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';
import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(databaseProvider));
});

/// Core KPIs
final dashboardStatisticsProvider =
    FutureProvider.autoDispose<DashboardStatistics>((ref) {
      return ref.watch(dashboardRepositoryProvider).getStatistics();
    });

/// Recent cases
final recentCasesProvider = FutureProvider.autoDispose<List<SurgicalCaseData>>((
  ref,
) {
  return ref.watch(dashboardRepositoryProvider).getRecentCases();
});

/// Specialty breakdown
final specialtyBreakdownProvider = FutureProvider.autoDispose<Map<String, int>>(
  (ref) {
    return ref.watch(dashboardRepositoryProvider).getSpecialtyBreakdown();
  },
);

/// Operative role breakdown
final operativeRoleBreakdownProvider =
    FutureProvider.autoDispose<List<OperativeRoleDistribution>>((ref) {
      return ref
          .watch(dashboardRepositoryProvider)
          .getOperativeRoleDistribution();
    });

/// Monthly case trend
final monthlyCaseDataProvider =
    FutureProvider.autoDispose<List<MonthlyCaseData>>((ref) {
      return ref.watch(dashboardRepositoryProvider).getMonthlyCaseData();
    });
