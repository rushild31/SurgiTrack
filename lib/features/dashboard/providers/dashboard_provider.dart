import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/dashboard/data/dashboard_repository.dart';

import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';
import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(databaseProvider));
});

// ===============================
// CORE KPI STATISTICS
// ===============================

final dashboardStatisticsProvider = FutureProvider<DashboardStatistics>((ref) {
  return ref.watch(dashboardRepositoryProvider).getStatistics();
});

// ===============================
// RECENT CASES
// ===============================

final recentCasesProvider = FutureProvider<List<SurgicalCaseData>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getRecentCases();
});

// ===============================
// SPECIALITY DISTRIBUTION
// Cardiac / Thoracic / Vascular
// ===============================

final specialtyBreakdownProvider = FutureProvider<Map<String, int>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getSpecialtyBreakdown();
});

// ===============================
// TOP 5 PROCEDURES
// ===============================

final topProceduresProvider = FutureProvider<Map<String, int>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getTopProcedures();
});

// ===============================
// OPERATIVE ROLE ANALYTICS
// ===============================

final operativeRoleBreakdownProvider = FutureProvider<Map<String, int>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getOperativeRoleBreakdown();
});

// ===============================
// MONTHLY TREND
// ===============================

final monthlyCaseDataProvider = FutureProvider<List<MonthlyCaseData>>((ref) {
  return ref.watch(dashboardRepositoryProvider).getMonthlyCaseData();
});
