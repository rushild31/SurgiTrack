import 'package:equatable/equatable.dart';

class SurgicalCase extends Equatable {
  final int? id;

  /// Link to patient table
  final int patientId;

  /// Internal SurgiTrack case identifier
  final String caseId;

  // =========================
  // Surgery Details
  // =========================

  final DateTime surgeryDate;

  final String diagnosis;

  final String urgency;

  final String surgeryType;

  final String specialty;

  final List<int> procedureIds;

  final String? surgicalApproach;

  final String? caseType;

  final String? complexity;

  final String? approach;

  // =========================
  // Resident Participation
  // =========================

  final String operativeRole;

  /// JSON encoded technical steps
  final String? technicalSteps;

  // =========================
  // Perfusion Details
  // =========================

  final bool cardiopulmonaryBypassUsed;

  final int? bypassTimeMinutes;

  final int? crossClampTimeMinutes;

  // =========================
  // Graft / Implant
  // =========================

  final String? graftConduitImplant;

  // =========================
  // Outcome
  // =========================

  final String outcome;

  final String? complications;

  final String? notes;

  // =========================
  // Metadata
  // =========================

  final DateTime createdAt;

  final DateTime updatedAt;

  const SurgicalCase({
    this.id,

    required this.patientId,

    required this.caseId,

    required this.surgeryDate,

    required this.diagnosis,

    required this.urgency,

    required this.surgeryType,

    required this.specialty,

    this.procedureIds = const [],

    this.surgicalApproach,

    this.approach,

    this.caseType,

    this.complexity,

    required this.operativeRole,

    this.technicalSteps,

    required this.cardiopulmonaryBypassUsed,

    this.bypassTimeMinutes,

    this.crossClampTimeMinutes,

    this.graftConduitImplant,

    required this.outcome,

    this.complications,

    this.notes,

    required this.createdAt,

    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    patientId,
    caseId,
    surgeryDate,
    diagnosis,
    urgency,
    surgeryType,
    specialty,
    procedureIds,
    surgicalApproach,
    approach,
    caseType,
    complexity,
    operativeRole,
    technicalSteps,
    cardiopulmonaryBypassUsed,
    bypassTimeMinutes,
    crossClampTimeMinutes,
    graftConduitImplant,
    outcome,
    complications,
    notes,
    createdAt,
    updatedAt,
  ];
}
