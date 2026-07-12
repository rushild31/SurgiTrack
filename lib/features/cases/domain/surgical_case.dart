import 'package:equatable/equatable.dart';

import 'package:surgitrack/core/enums/case_priority.dart';
import 'package:surgitrack/core/enums/case_type.dart';
import 'package:surgitrack/core/enums/outcome.dart';
import 'package:surgitrack/core/enums/specialty.dart';
import 'package:surgitrack/core/enums/surgeon_role.dart';
import 'package:surgitrack/core/enums/surgical_approach.dart';

class SurgicalCase extends Equatable {
  final String id;

  /// FK → Patient.id
  final String patientId;

  /// Admission
  final DateTime admissionDate;

  /// Operation
  final DateTime surgeryDate;

  final String diagnosis;

  final CasePriority priority;

  final CaseType caseType;

  final Specialty specialty;

  final String procedure;

  final SurgicalApproach surgicalApproach;

  final String consultant;

  /// Overall resident participation
  final SurgeonRole surgeonRole;

  /// Percentage (0–100)
  final int ejectionFraction;

  final String? graftConduitImplant;

  final Outcome outcome;

  final String notes;

  final DateTime createdAt;

  final DateTime updatedAt;

  const SurgicalCase({
    required this.id,
    required this.patientId,
    required this.admissionDate,
    required this.surgeryDate,
    required this.diagnosis,
    required this.priority,
    required this.caseType,
    required this.specialty,
    required this.procedure,
    required this.surgicalApproach,
    required this.consultant,
    required this.surgeonRole,
    required this.ejectionFraction,
    this.graftConduitImplant,
    required this.outcome,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    patientId,
    admissionDate,
    surgeryDate,
    diagnosis,
    priority,
    caseType,
    specialty,
    procedure,
    surgicalApproach,
    consultant,
    surgeonRole,
    ejectionFraction,
    graftConduitImplant,
    outcome,
    notes,
    createdAt,
    updatedAt,
  ];
}
