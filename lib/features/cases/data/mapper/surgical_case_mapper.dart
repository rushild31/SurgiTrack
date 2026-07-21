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

      approach: data.approach,

      caseType: data.caseType,

      complexity: data.complexity,

      operativeRole: data.operativeRole,

      technicalSteps: data.technicalSteps,

      cardiopulmonaryBypassUsed: data.cardiopulmonaryBypassUsed,

      bypassTimeMinutes: data.bypassTimeMinutes,

      crossClampTimeMinutes: data.crossClampTimeMinutes,

      graftConduitImplant: data.graftConduitImplant,

      outcome: data.outcome,

      complications: data.complications,

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

      approach: Value(surgicalCase.approach),

      caseType: Value(surgicalCase.caseType),

      complexity: Value(surgicalCase.complexity),

      operativeRole: Value(surgicalCase.operativeRole),

      technicalSteps: Value(surgicalCase.technicalSteps),

      cardiopulmonaryBypassUsed: Value(surgicalCase.cardiopulmonaryBypassUsed),

      bypassTimeMinutes: Value(surgicalCase.bypassTimeMinutes),

      crossClampTimeMinutes: Value(surgicalCase.crossClampTimeMinutes),

      graftConduitImplant: Value(surgicalCase.graftConduitImplant),

      outcome: Value(surgicalCase.outcome),

      complications: Value(surgicalCase.complications),

      notes: Value(surgicalCase.notes),

      // Automatic timestamp handling
      createdAt: surgicalCase.id == null
          ? const Value.absent()
          : Value(surgicalCase.createdAt),

      updatedAt: Value(surgicalCase.updatedAt),
    );
  }
}
