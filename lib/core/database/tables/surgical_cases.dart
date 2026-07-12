import 'package:drift/drift.dart';

import 'patients.dart';

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

  TextColumn get diagnosis => text()();

  /// Planned / Emergency
  TextColumn get urgency => text()();

  /// Primary / Redo
  TextColumn get surgeryType => text()();

  /// Cardiac / Thoracic / Vascular
  TextColumn get specialty => text()();

  /// Selected procedure name
  TextColumn get procedure => text()();

  /// Surgical approach
  TextColumn get surgicalApproach => text().nullable()();

  // =========================
  // Resident Participation
  // =========================

  /// Observer / Assistant /
  /// Supervised / Independent
  TextColumn get operativeRole => text()();

  /// JSON encoded list of technical step participation
  TextColumn get technicalSteps => text().nullable()();

  // =========================
  // Graft / Implant
  // =========================

  TextColumn get graftConduitImplant => text().nullable()();

  // =========================
  // Outcome
  // =========================

  TextColumn get outcome => text()();

  TextColumn get notes => text().nullable()();

  // =========================
  // Metadata
  // =========================

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
