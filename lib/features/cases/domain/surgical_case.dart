import 'package:equatable/equatable.dart';

class SurgicalCase extends Equatable {
  final int? id;

  /// Link to patient table
  final int patientId;

  /// Internal case identifier
  final String caseId;

  /// Surgery details
  final DateTime surgeryDate;

  final String diagnosis;

  final String urgency;

  final String surgeryType;

  final String specialty;

  /// Linked procedures stored in CaseProcedures table
  final List<int> procedureIds;

  final String? surgicalApproach;

  /// Resident participation
  final String operativeRole;

  /// JSON encoded technical steps
  final String? technicalSteps;

  /// Graft / conduit / implant details
  final String? graftConduitImplant;

  final String outcome;

  final String? notes;

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

    required this.operativeRole,

    this.technicalSteps,

    this.graftConduitImplant,

    required this.outcome,

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
    operativeRole,
    technicalSteps,
    graftConduitImplant,
    outcome,
    notes,
    createdAt,
    updatedAt,
  ];
}
