class ProcedureExposure {
  /// Stable library identifier
  /// Example:
  /// CABG
  /// BENTALL_PROCEDURE
  final String procedureId;

  final String procedureName;

  final int totalCases;

  /// Keys:
  /// Observed
  /// Assisted
  /// Performed under Supervision
  /// Performed Independently
  final Map<String, int> roleCounts;

  const ProcedureExposure({
    required this.procedureId,
    required this.procedureName,
    required this.totalCases,
    required this.roleCounts,
  });
}
