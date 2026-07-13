import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import '../domain/procedure.dart';

class ProcedureMapper {
  static ProcedureEntity fromData(Procedure data) {
    return ProcedureEntity(
      id: data.id,
      name: data.name,
      category: data.category,
      specialty: data.specialty,
      isActive: data.isActive,
      createdAt: data.createdAt,
    );
  }

  static ProceduresCompanion toCompanion(ProcedureEntity procedure) {
    return ProceduresCompanion(
      id: procedure.id == null ? const Value.absent() : Value(procedure.id!),

      name: Value(procedure.name),

      category: Value(procedure.category),

      specialty: Value(procedure.specialty),

      isActive: Value(procedure.isActive),

      createdAt: Value(procedure.createdAt),
    );
  }
}
