class SurgeonProfile {
  final int? id;

  final String name;

  final String? email;

  final String? phone;

  final String? profilePhotoPath;

  final String? specialty;

  final String? department;

  final String? institution;

  final String? trainingYear;

  final DateTime? residencyStartDate;

  final DateTime? residencyEndDate;

  final String? registrationNumber;

  final String? memberships;

  final DateTime createdAt;

  final DateTime updatedAt;

  const SurgeonProfile({
    this.id,
    required this.name,
    this.email,
    this.phone,
    this.profilePhotoPath,
    this.specialty,
    this.department,
    this.institution,
    this.trainingYear,
    this.residencyStartDate,
    this.residencyEndDate,
    this.registrationNumber,
    this.memberships,
    required this.createdAt,
    required this.updatedAt,
  });
}
