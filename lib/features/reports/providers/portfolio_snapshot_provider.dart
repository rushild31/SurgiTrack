import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/domain/portfolio_snapshot_data.dart';

import 'package:surgitrack/features/reports/providers/report_repository_provider.dart';

import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';

final portfolioSnapshotProvider = FutureProvider<PortfolioSnapshotData>((
  ref,
) async {
  final repository = ref.watch(reportRepositoryProvider);

  final statistics = await repository.analyticsRepository.getStatistics(
    filter: AnalyticsReportFilter.empty,
  );

  final roles = await repository.analyticsRepository
      .getOperativeRoleDistribution(filter: AnalyticsReportFilter.empty);

  final roleMap = {for (final role in roles) role.role: role.count};

  return PortfolioSnapshotData(
    totalCases: statistics.totalCases,

    totalPatients: statistics.totalPatients,

    totalProcedures: statistics.totalProcedures,

    cardiacCases: statistics.cardiacCases,

    thoracicCases: statistics.thoracicCases,

    vascularCases: statistics.vascularCases,

    independentCases: roleMap['performed_independently'] ?? 0,

    supervisedCases: roleMap['performed_under_supervision'] ?? 0,

    assistedCases: roleMap['assisted'] ?? 0,

    observedCases: roleMap['observed'] ?? 0,
  );
});
