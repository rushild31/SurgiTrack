import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/dashboard/data/dashboard_repository.dart';

import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';
import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(databaseProvider));
});

final dashboardStatisticsProvider = FutureProvider<DashboardStatistics>((ref) {
  return ref.watch(dashboardRepositoryProvider).getStatistics();
});

final recentCasesProvider = FutureProvider<List<SurgicalCaseData>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getRecentCases();
});

final specialtyBreakdownProvider = FutureProvider<Map<String, int>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getSpecialtyBreakdown();
});

final operativeRoleBreakdownProvider = FutureProvider<Map<String, int>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getOperativeRoleBreakdown();
});

final monthlyCaseDataProvider = FutureProvider<List<MonthlyCaseData>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getMonthlyCaseData();
});
