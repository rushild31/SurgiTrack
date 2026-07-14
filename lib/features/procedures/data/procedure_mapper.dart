import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

class ProcedureMapper {
  static ProcedureEntity fromData(ProcedureData data) {
    return ProcedureEntity(
      id: data.id,

      procedureId: data.procedureId,

      name: data.name,

      shortName: data.shortName,

      specialty: data.specialty,

      category: data.category,

      parentId: data.parentId,

      nodeType: data.nodeType,

      aliases: data.aliases == null
          ? const []
          : List<String>.from(jsonDecode(data.aliases!)),

      description: data.description,

      template: data.template,

      supportsCPB: data.supportsCPB,

      supportsRedo: data.supportsRedo,

      supportsEmergency: data.supportsEmergency,

      supportsTechnicalSteps: data.supportsTechnicalSteps,

      supportsAssociatedProcedures: data.supportsAssociatedProcedures,

      dynamicFields: List<String>.from(jsonDecode(data.dynamicFields)),

      technicalSteps: List<String>.from(jsonDecode(data.technicalSteps)),

      associatedProcedures: List<String>.from(
        jsonDecode(data.associatedProcedures),
      ),

      isActive: data.isActive,

      createdAt: data.createdAt,
    );
  }

  static ProceduresCompanion toCompanion(ProcedureEntity procedure) {
    return ProceduresCompanion(
      id: procedure.id == null ? const Value.absent() : Value(procedure.id!),

      procedureId: Value(procedure.procedureId),

      name: Value(procedure.name),

      shortName: Value(procedure.shortName),

      specialty: Value(procedure.specialty),

      category: Value(procedure.category),

      parentId: Value(procedure.parentId),

      nodeType: Value(procedure.nodeType),

      aliases: Value(jsonEncode(procedure.aliases)),

      description: Value(procedure.description),

      template: Value(procedure.template),

      supportsCPB: Value(procedure.supportsCPB),

      supportsRedo: Value(procedure.supportsRedo),

      supportsEmergency: Value(procedure.supportsEmergency),

      supportsTechnicalSteps: Value(procedure.supportsTechnicalSteps),

      supportsAssociatedProcedures: Value(
        procedure.supportsAssociatedProcedures,
      ),

      dynamicFields: Value(jsonEncode(procedure.dynamicFields)),

      technicalSteps: Value(jsonEncode(procedure.technicalSteps)),

      associatedProcedures: Value(jsonEncode(procedure.associatedProcedures)),

      isActive: Value(procedure.isActive),

      createdAt: Value(procedure.createdAt),
    );
  }

  static ProcedureEntity fromJson(
    Map<String, dynamic> json, {
    required String specialty,
    required String category,
  }) {
    return ProcedureEntity(
      procedureId: json['id'],

      name: json['name'],

      shortName: json['shortName'],

      specialty: specialty,

      category: category,

      aliases: [
        if (json['shortName'] != null) json['shortName'],
        if (json['aliases'] != null) ...List<String>.from(json['aliases']),
      ],

      description: json['template'],

      template: json['template'],

      supportsCPB: json['supportsCPB'] ?? false,

      supportsRedo: json['supportsRedo'] ?? false,

      supportsEmergency: json['supportsEmergency'] ?? false,

      supportsTechnicalSteps: json['supportsTechnicalSteps'] ?? false,

      supportsAssociatedProcedures:
          json['supportsAssociatedProcedures'] ?? false,

      dynamicFields: json['dynamicFields'] == null
          ? const []
          : List<String>.from(json['dynamicFields']),

      technicalSteps: json['technicalSteps'] == null
          ? const []
          : List<String>.from(json['technicalSteps']),

      associatedProcedures: json['associatedProcedures'] == null
          ? const []
          : List<String>.from(json['associatedProcedures']),

      createdAt: DateTime.now(),
    );
  }
}
