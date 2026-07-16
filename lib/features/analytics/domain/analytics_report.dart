import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';
import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';
import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';
import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';
import 'package:surgitrack/features/analytics/domain/specialty_distribution.dart';
import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';

class AnalyticsReport {
  final DateTime fromDate;

  final DateTime toDate;

  final AnalyticsStatistics statistics;

  final List<SpecialtyDistribution> specialtyDistribution;

  final List<OperativeRoleDistribution> operativeRoleDistribution;

  final List<MonthlyCaseTrend> monthlyCaseTrend;

  final List<ProcedureExposure> procedureExposure;

  final List<TechnicalStepExposure> technicalStepExposure;

  const AnalyticsReport({
    required this.fromDate,
    required this.toDate,
    required this.statistics,
    required this.specialtyDistribution,
    required this.operativeRoleDistribution,
    required this.monthlyCaseTrend,
    required this.procedureExposure,
    required this.technicalStepExposure,
  });
}
