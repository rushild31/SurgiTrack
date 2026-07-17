import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import '../domain/patient.dart';

class PatientMapper {
  static Patient fromData(PatientData data) {
    return Patient(
      id: data.id,

      patientId: data.patientId,

      name: data.name,

      hospitalId: data.hospitalId,

      dateOfBirth: data.dateOfBirth,

      sex: data.sex,

      bloodGroup: data.bloodGroup,

      comorbidities: data.comorbidities == null
          ? []
          : List<String>.from(jsonDecode(data.comorbidities!)),

      address: data.address,

      admissionDate: data.admissionDate,

      ejectionFraction: data.ejectionFraction,

      pastOperativeHistory: data.pastOperativeHistory,

      createdAt: data.createdAt,

      updatedAt: data.updatedAt,
    );
  }

  static PatientsCompanion toCompanion(Patient patient) {
    return PatientsCompanion(
      id: patient.id == null ? const Value.absent() : Value(patient.id!),

      patientId: Value(patient.patientId),

      name: Value(patient.name),

      hospitalId: Value(patient.hospitalId),

      dateOfBirth: Value(patient.dateOfBirth),

      sex: Value(patient.sex),

      bloodGroup: Value(patient.bloodGroup),

      comorbidities: Value(jsonEncode(patient.comorbidities)),

      address: Value(patient.address),

      admissionDate: Value(patient.admissionDate),

      ejectionFraction: Value(patient.ejectionFraction),

      pastOperativeHistory: Value(patient.pastOperativeHistory),

      createdAt: Value(patient.createdAt),

      updatedAt: Value(patient.updatedAt),
    );
  }
}
