import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/dashboard/data/dashboard_repository.dart';
import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(databaseProvider));
});

final dashboardStatisticsProvider = FutureProvider<DashboardStatistics>((ref) {
  return ref.watch(dashboardRepositoryProvider).getStatistics();
});
