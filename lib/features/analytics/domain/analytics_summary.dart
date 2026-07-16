class AnalyticsSummary {
  // =========================
  // Overall Numbers
  // =========================

  final int totalPatients;

  final int totalCases;

  final int totalProcedures;

  final double averageProceduresPerCase;

  // =========================
  // Specialty Distribution
  // =========================

  final Map<String, int> specialtyDistribution;

  // =========================
  // Age Group Distribution
  // =========================

  final Map<String, int> ageGroupDistribution;

  // =========================
  // Operative Role Distribution
  // =========================

  final Map<String, int> operativeRoleDistribution;

  // =========================
  // Surgical Approach Distribution
  // =========================

  final Map<String, int> approachDistribution;

  // =========================
  // Procedure Distribution
  // =========================

  final Map<String, int> procedureDistribution;

  // =========================
  // Timeline Data
  // =========================

  final List<MonthlyCaseStatistic> monthlyStatistics;

  const AnalyticsSummary({
    required this.totalPatients,

    required this.totalCases,

    required this.totalProcedures,

    required this.averageProceduresPerCase,

    required this.specialtyDistribution,

    required this.ageGroupDistribution,

    required this.operativeRoleDistribution,

    required this.approachDistribution,

    required this.procedureDistribution,

    required this.monthlyStatistics,
  });
}

class MonthlyCaseStatistic {
  final String month;

  final int cases;

  final int procedures;

  const MonthlyCaseStatistic({
    required this.month,

    required this.cases,

    required this.procedures,
  });
}
