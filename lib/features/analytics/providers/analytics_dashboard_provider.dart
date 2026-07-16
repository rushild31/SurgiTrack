import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/analytics/domain/analytics_dashboard.dart';

import 'package:surgitrack/features/analytics/domain/specialty_distribution.dart';

import 'package:surgitrack/features/analytics/providers/analytics_provider.dart';

final analyticsDashboardProvider = FutureProvider<AnalyticsDashboard>((
  ref,
) async {
  final statistics = await ref.watch(analyticsStatisticsProvider.future);

  final procedureExposure = await ref.watch(procedureExposureProvider.future);

  final technicalStepExposure = await ref.watch(
    technicalStepExposureProvider.future,
  );

  final monthlyCaseTrend = await ref.watch(monthlyCaseTrendProvider.future);

  final operativeRoleDistribution = await ref.watch(
    operativeRoleDistributionProvider.future,
  );

  final specialtyDistribution = [
    SpecialtyDistribution(specialty: 'Cardiac', count: statistics.cardiacCases),

    SpecialtyDistribution(
      specialty: 'Thoracic',
      count: statistics.thoracicCases,
    ),

    SpecialtyDistribution(
      specialty: 'Vascular',
      count: statistics.vascularCases,
    ),
  ];

  return AnalyticsDashboard(
    statistics: statistics,

    procedureExposure: procedureExposure,

    technicalStepExposure: technicalStepExposure,

    monthlyCaseTrend: monthlyCaseTrend,

    operativeRoleDistribution: operativeRoleDistribution,

    specialtyDistribution: specialtyDistribution,
  );
});
