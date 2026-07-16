import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';

import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';

import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';

import 'package:surgitrack/features/analytics/domain/specialty_distribution.dart';

import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';

class AnalyticsDashboard {
  final AnalyticsStatistics statistics;

  final List<ProcedureExposure> procedureExposure;

  final List<TechnicalStepExposure> technicalStepExposure;

  final List<SpecialtyDistribution> specialtyDistribution;

  final List<OperativeRoleDistribution> operativeRoleDistribution;

  final List<MonthlyCaseTrend> monthlyCaseTrend;

  const AnalyticsDashboard({
    required this.statistics,

    required this.procedureExposure,

    required this.technicalStepExposure,

    required this.specialtyDistribution,

    required this.operativeRoleDistribution,

    required this.monthlyCaseTrend,
  });

  int get totalCases => statistics.totalCases;

  int get totalPatients => statistics.totalPatients;

  int get totalProcedures => statistics.totalProcedures;

  List<ProcedureExposure> get topProcedures {
    final result = [...procedureExposure];

    result.sort((a, b) => b.totalCases.compareTo(a.totalCases));

    return result.take(5).toList();
  }

  List<ProcedureExposure> get independentlyPerformedProcedures {
    return procedureExposure.where((procedure) {
      return (procedure.roleCounts['performed_independently'] ?? 0) > 0;
    }).toList();
  }
}
