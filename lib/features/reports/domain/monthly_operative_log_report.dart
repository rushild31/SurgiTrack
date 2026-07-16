class MonthlyOperativeLogEntry {
  final int serialNumber;

  final String patientName;

  final String hospitalId;

  final String ageSex;

  final DateTime? admissionDate;

  final String diagnosis;

  final DateTime surgeryDate;

  final List<String> procedures;

  final String operativeRole;

  const MonthlyOperativeLogEntry({
    required this.serialNumber,

    required this.patientName,

    required this.hospitalId,

    required this.ageSex,

    required this.admissionDate,

    required this.diagnosis,

    required this.surgeryDate,

    required this.procedures,

    required this.operativeRole,
  });
}

class MonthlyOperativeLogReport {
  final String month;

  final DateTime fromDate;

  final DateTime toDate;

  final List<MonthlyOperativeLogEntry> entries;

  const MonthlyOperativeLogReport({
    required this.month,

    required this.fromDate,

    required this.toDate,

    required this.entries,
  });

  int get totalCases => entries.length;
}
