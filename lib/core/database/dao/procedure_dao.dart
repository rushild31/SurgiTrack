import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/tables/procedures.dart';

part 'procedure_dao.g.dart';

@DriftAccessor(tables: [Procedures])
class ProcedureDao extends DatabaseAccessor<AppDatabase>
    with _$ProcedureDaoMixin {
  ProcedureDao(super.db);

  /// All procedures sorted alphabetically
  Future<List<ProcedureData>> getAllProcedures() {
    return (select(
      procedures,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.name)])).get();
  }

  /// Stream for reactive UI
  Stream<List<ProcedureData>> watchProcedures() {
    return (select(
      procedures,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.name)])).watch();
  }

  /// Single procedure lookup
  Future<ProcedureData?> getProcedureById(int id) {
    return (select(
      procedures,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Root nodes
  ///
  /// Example:
  ///
  /// Adult Cardiac Surgery
  /// Thoracic Surgery
  /// Vascular Surgery
  ///
  Future<List<ProcedureData>> getRootProcedures() {
    return (select(procedures)
          ..where((tbl) => tbl.parentId.isNull())
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]))
        .get();
  }

  /// Child procedures
  ///
  /// Example:
  ///
  /// Parent:
  /// Adult Cardiac Surgery
  ///
  /// Returns:
  /// Coronary Surgery
  /// Valve Surgery
  ///
  Future<List<ProcedureData>> getChildProcedures(int parentId) {
    return (select(procedures)
          ..where((tbl) => tbl.parentId.equals(parentId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]))
        .get();
  }

  /// Search across:
  ///
  /// - procedure name
  /// - category
  /// - specialty
  /// - aliases JSON
  ///
  Future<List<ProcedureData>> searchProcedures(String query) {
    final search = "%${query.toLowerCase()}%";

    return (select(procedures)..where(
          (tbl) =>
              tbl.name.lower().like(search) |
              tbl.procedureId.lower().like(search) |
              tbl.category.lower().like(search) |
              tbl.specialty.lower().like(search) |
              tbl.aliases.lower().like(search),
        ))
        .get();
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
