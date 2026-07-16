class SurgicalLogbookEntry {
  final DateTime surgeryDate;

  /// Internal portfolio identifier, not patient-sensitive information
  final String patientIdentifier;

  final String diagnosis;

  final List<String> procedures;

  final String specialty;

  final String operativeRole;

  final String approach;

  final String caseType;

  final String complexity;

  const SurgicalLogbookEntry({
    required this.surgeryDate,
    required this.patientIdentifier,
    required this.diagnosis,
    required this.procedures,
    required this.specialty,
    required this.operativeRole,
    required this.approach,
    required this.caseType,
    required this.complexity,
  });
}
