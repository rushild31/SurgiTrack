import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart' as database;

import 'package:surgitrack/features/cases/domain/surgical_case.dart' as domain;

class SurgicalCaseMapper {
  static domain.SurgicalCase fromData(database.SurgicalCaseData data) {
    return domain.SurgicalCase(
      id: data.id,

      patientId: data.patientId,

      caseId: data.caseId,

      surgeryDate: data.surgeryDate,

      diagnosis: data.diagnosis,

      urgency: data.urgency,

      surgeryType: data.surgeryType,

      specialty: data.specialty,

      surgicalApproach: data.surgicalApproach,

      operativeRole: data.operativeRole,

      technicalSteps: data.technicalSteps,

      graftConduitImplant: data.graftConduitImplant,

      outcome: data.outcome,

      notes: data.notes,

      createdAt: data.createdAt,

      updatedAt: data.updatedAt,
    );
  }

  static database.SurgicalCasesCompanion toCompanion(
    domain.SurgicalCase surgicalCase,
  ) {
    return database.SurgicalCasesCompanion(
      id: surgicalCase.id == null
          ? const Value.absent()
          : Value(surgicalCase.id!),

      patientId: Value(surgicalCase.patientId),

      caseId: Value(surgicalCase.caseId),

      surgeryDate: Value(surgicalCase.surgeryDate),

      diagnosis: Value(surgicalCase.diagnosis),

      urgency: Value(surgicalCase.urgency),

      surgeryType: Value(surgicalCase.surgeryType),

      specialty: Value(surgicalCase.specialty),

      surgicalApproach: Value(surgicalCase.surgicalApproach),

      operativeRole: Value(surgicalCase.operativeRole),

      technicalSteps: Value(surgicalCase.technicalSteps),

      graftConduitImplant: Value(surgicalCase.graftConduitImplant),

      outcome: Value(surgicalCase.outcome),

      notes: Value(surgicalCase.notes),

      createdAt: Value(surgicalCase.createdAt),

      updatedAt: Value(surgicalCase.updatedAt),
    );
  }
}
