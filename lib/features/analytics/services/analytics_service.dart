import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';
import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';
import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';

class AnalyticsService {
  const AnalyticsService();

  // =========================
  // Dashboard Summary
  // =========================

  Map<String, dynamic> buildSummaryCards(AnalyticsStatistics statistics) {
    return {
      'Total Patients': statistics.totalPatients,

      'Total Cases': statistics.totalCases,

      'Total Procedures': statistics.totalProcedures,

      'Average Procedures / Case': statistics.averageProceduresPerCase
          .toStringAsFixed(2),
    };
  }

  // =========================
  // Specialty Distribution
  // =========================

  Map<String, int> buildSpecialtyDistribution(AnalyticsStatistics statistics) {
    return {
      'Cardiac': statistics.cardiacCases,

      'Thoracic': statistics.thoracicCases,

      'Vascular': statistics.vascularCases,
    };
  }

  // =========================
  // Procedure Exposure Sorting
  // =========================

  List<ProcedureExposure> sortProcedureExposure(
    List<ProcedureExposure> exposure,
  ) {
    final result = [...exposure];

    result.sort((a, b) => b.totalCases.compareTo(a.totalCases));

    return result;
  }

  // =========================
  // Technical Step Exposure Sorting
  // =========================

  List<TechnicalStepExposure> sortTechnicalStepExposure(
    List<TechnicalStepExposure> exposure,
  ) {
    final result = [...exposure];

    result.sort((a, b) {
      final aTotal = a.roleCounts.values.fold(0, (sum, value) => sum + value);

      final bTotal = b.roleCounts.values.fold(0, (sum, value) => sum + value);

      return bTotal.compareTo(aTotal);
    });

    return result;
  }
}
