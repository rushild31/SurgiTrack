import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/tables/procedures.dart';

part 'procedure_dao.g.dart';

@DriftAccessor(tables: [Procedures])
class ProcedureDao extends DatabaseAccessor<AppDatabase>
    with _$ProcedureDaoMixin {
  ProcedureDao(super.db);

  Future<List<ProcedureData>> getAllProcedures() {
    return (select(
      procedures,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.name)])).get();
  }

  Stream<List<ProcedureData>> watchProcedures() {
    return (select(
      procedures,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.name)])).watch();
  }

  Future<ProcedureData?> getProcedureById(int id) {
    return (select(
      procedures,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<ProcedureData>> searchProcedures(String query) {
    return (select(
      procedures,
    )..where((tbl) => tbl.name.like("%$query%"))).get();
  }

  Future<List<ProcedureData>> getBySpecialty(String specialty) {
    return (select(
      procedures,
    )..where((tbl) => tbl.specialty.equals(specialty))).get();
  }

  Future<int> insertProcedure(ProceduresCompanion procedure) {
    return into(procedures).insert(procedure);
  }

  Future<bool> updateProcedure(ProceduresCompanion procedure) {
    return update(procedures).replace(procedure);
  }

  Future<int> deleteProcedure(int id) {
    return (delete(procedures)..where((tbl) => tbl.id.equals(id))).go();
  }
}
