class SurgicalCaseListItem {
  final int id;

  final String caseId;

  final String patientName;

  final String hospitalId;

  final DateTime surgeryDate;

  final String diagnosis;

  final String specialty;

  final String operativeRole;

  const SurgicalCaseListItem({
    required this.id,
    required this.caseId,
    required this.patientName,
    required this.hospitalId,
    required this.surgeryDate,
    required this.diagnosis,
    required this.specialty,
    required this.operativeRole,
  });
}
