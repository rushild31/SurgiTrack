class AnalyticsStatistics {
  // =========================
  // Core Counts
  // =========================

  final int totalCases;

  final int totalPatients;

  final int totalProcedures;

  // =========================
  // Specialty Counts
  // =========================

  final int cardiacCases;

  final int thoracicCases;

  final int vascularCases;

  // =========================
  // Derived Metrics
  // =========================

  final double averageProceduresPerCase;

  const AnalyticsStatistics({
    required this.totalCases,

    required this.totalPatients,

    required this.totalProcedures,

    required this.cardiacCases,

    required this.thoracicCases,

    required this.vascularCases,

    required this.averageProceduresPerCase,
  });
}
