class TechnicalStepExposure {
  /// Parent procedure identifier
  /// Example:
  /// CABG
  final String procedureId;

  final String procedureName;

  /// Stable technical step identifier
  /// Example:
  /// DISTAL_ANASTOMOSIS
  final String stepId;

  final String stepName;

  final int totalCases;

  /// Keys:
  /// observed
  /// assisted
  /// performed_under_supervision
  /// performed_independently
  final Map<String, int> roleCounts;

  const TechnicalStepExposure({
    required this.procedureId,

    required this.procedureName,

    required this.stepId,

    required this.stepName,

    required this.totalCases,

    required this.roleCounts,
  });
}
