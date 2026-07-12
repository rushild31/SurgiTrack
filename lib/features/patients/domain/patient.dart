class Patient {
  final int? id;

  final String patientId;

  final String name;

  final String hospitalId;

  final DateTime dateOfBirth;

  final String? bloodGroup;

  final List<String> comorbidities;

  final String? address;

  final DateTime? admissionDate;

  final double? ejectionFraction;

  final String? pastOperativeHistory;

  final DateTime createdAt;

  final DateTime updatedAt;

  const Patient({
    this.id,
    required this.patientId,
    required this.name,
    required this.hospitalId,
    required this.dateOfBirth,
    this.bloodGroup,
    this.comorbidities = const [],
    this.address,
    this.admissionDate,
    this.ejectionFraction,
    this.pastOperativeHistory,
    required this.createdAt,
    required this.updatedAt,
  });

  int get age {
    final today = DateTime.now();

    int years = today.year - dateOfBirth.year;

    if (today.month < dateOfBirth.month ||
        (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      years--;
    }

    return years;
  }
}
