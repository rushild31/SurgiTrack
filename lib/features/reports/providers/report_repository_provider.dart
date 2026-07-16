import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/analytics/data/analytics_repository.dart';

import 'package:surgitrack/features/reports/data/report_repository.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  final database = ref.watch(databaseProvider);

  final analyticsRepository = AnalyticsRepository(database);

  return ReportRepository(
    database: database,
    analyticsRepository: analyticsRepository,
  );
});
