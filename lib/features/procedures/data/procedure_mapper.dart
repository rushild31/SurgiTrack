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

      specialty: data.specialty,

      category: data.category,

      parentId: data.parentId,

      aliases: data.aliases == null
          ? []
          : List<String>.from(jsonDecode(data.aliases!)),

      description: data.description,

      isActive: data.isActive,

      createdAt: data.createdAt,
    );
  }

  static ProceduresCompanion toCompanion(ProcedureEntity procedure) {
    return ProceduresCompanion(
      id: procedure.id == null ? const Value.absent() : Value(procedure.id!),

      procedureId: Value(procedure.procedureId),

      name: Value(procedure.name),

      specialty: Value(procedure.specialty),

      category: Value(procedure.category),

      parentId: Value(procedure.parentId),

      aliases: Value(jsonEncode(procedure.aliases)),

      description: Value(procedure.description),

      isActive: Value(procedure.isActive),

      createdAt: Value(procedure.createdAt),
    );
  }
}
