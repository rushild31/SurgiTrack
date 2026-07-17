import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import '../domain/surgeon_profile.dart';

class SurgeonProfileMapper {
  static SurgeonProfile fromData(SurgeonProfileData data) {
    return SurgeonProfile(
      id: data.id,

      name: data.name,

      email: data.email,

      phone: data.phone,

      profilePhotoPath: data.profilePhotoPath,

      specialty: data.specialty,

      department: data.department,

      institution: data.institution,

      trainingYear: data.trainingYear,

      residencyStartDate: data.residencyStartDate,

      residencyEndDate: data.residencyEndDate,

      registrationNumber: data.registrationNumber,

      memberships: data.memberships,

      createdAt: data.createdAt,

      updatedAt: data.updatedAt,
    );
  }

  static SurgeonProfileCompanion toCompanion(SurgeonProfile profile) {
    return SurgeonProfileCompanion(
      id: profile.id == null ? const Value.absent() : Value(profile.id!),

      name: Value(profile.name),

      email: Value(profile.email),

      phone: Value(profile.phone),

      profilePhotoPath: Value(profile.profilePhotoPath),

      specialty: Value(profile.specialty),

      department: Value(profile.department),

      institution: Value(profile.institution),

      trainingYear: Value(profile.trainingYear),

      residencyStartDate: Value(profile.residencyStartDate),

      residencyEndDate: Value(profile.residencyEndDate),

      registrationNumber: Value(profile.registrationNumber),

      memberships: Value(profile.memberships),

      createdAt: Value(profile.createdAt),

      updatedAt: Value(profile.updatedAt),
    );
  }
}
