class TrainingPeriodReport {
  final String period;

  final int totalCases;

  final Map<String, int> specialtyDistribution;

  final int independentCases;

  final int supervisedCases;

  final int assistedCases;

  final int observedCases;

  const TrainingPeriodReport({
    required this.period,
    required this.totalCases,
    required this.specialtyDistribution,
    required this.independentCases,
    required this.supervisedCases,
    required this.assistedCases,
    required this.observedCases,
  });
}
