import 'package:drift/drift.dart';

import 'patients.dart';

@DataClassName('SurgicalCaseData')
class SurgicalCases extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Internal SurgiTrack case identifier
  TextColumn get caseId => text().unique()();

  /// Link to patient
  IntColumn get patientId => integer().references(Patients, #id)();

  // =========================
  // Surgery Details
  // =========================

  DateTimeColumn get surgeryDate => dateTime()();

  /// Preoperative diagnosis
  TextColumn get diagnosis => text()();

  /// Planned / Emergency
  TextColumn get urgency => text()();

  /// Primary / Redo
  TextColumn get surgeryType => text()();

  /// Cardiac / Thoracic / Vascular
  TextColumn get specialty => text()();

  /// Surgical approach
  TextColumn get surgicalApproach => text().nullable()();

  TextColumn get approach => text().nullable()();

  TextColumn get caseType => text().nullable()();

  TextColumn get complexity => text().nullable()();

  // =========================
  // Resident Participation
  // =========================

  /// Personal operative role
  ///
  /// Allowed values:
  /// observed
  /// assisted
  /// performed_under_supervision
  /// performed_independently
  TextColumn get operativeRole => text()();

  /// JSON encoded list of technical steps
  TextColumn get technicalSteps => text().nullable()();

  // =========================
  // Perfusion Details
  // =========================

  BoolColumn get cardiopulmonaryBypassUsed =>
      boolean().withDefault(const Constant(false))();

  IntColumn get bypassTimeMinutes => integer().nullable()();

  IntColumn get crossClampTimeMinutes => integer().nullable()();

  // =========================
  // Graft / Implant
  // =========================

  TextColumn get graftConduitImplant => text().nullable()();

  // =========================
  // Outcome
  // =========================

  TextColumn get outcome => text()();

  TextColumn get complications => text().nullable()();

  TextColumn get notes => text().nullable()();

  // =========================
  // Metadata
  // =========================

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
