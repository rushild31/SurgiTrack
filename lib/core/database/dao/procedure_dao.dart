import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/procedures.dart';

part 'procedure_dao.g.dart';

@DriftAccessor(tables: [Procedures])
class ProcedureDao extends DatabaseAccessor<AppDatabase>
    with _$ProcedureDaoMixin {
  ProcedureDao(super.db);

  Future<List<Procedure>> getAllProcedures() {
    return (select(
      procedures,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.name)])).get();
  }

  Stream<List<Procedure>> watchProcedures() {
    return (select(
      procedures,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.name)])).watch();
  }

  Future<Procedure?> getProcedureById(int id) {
    return (select(
      procedures,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
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
