import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

import 'procedure_mapper.dart';

class ProcedureRepository {
  final AppDatabase database;

  const ProcedureRepository(this.database);

  Stream<List<ProcedureEntity>> watchProcedures() {
    return database.procedureDao.watchProcedures().map(
      (rows) => rows.map(ProcedureMapper.fromData).toList(),
    );
  }

  Future<List<ProcedureEntity>> getProcedures() async {
    final rows = await database.procedureDao.getAllProcedures();

    return rows.map(ProcedureMapper.fromData).toList();
  }

  Future<List<ProcedureEntity>> getRootProcedures() async {
    final rows = await database.procedureDao.getRootProcedures();

    return rows.map(ProcedureMapper.fromData).toList();
  }

  Future<List<ProcedureEntity>> getChildProcedures(int parentId) async {
    final rows = await database.procedureDao.getChildProcedures(parentId);

    return rows.map(ProcedureMapper.fromData).toList();
  }

  Future<ProcedureEntity?> getProcedureById(int id) async {
    final row = await database.procedureDao.getProcedureById(id);

    if (row == null) return null;

    return ProcedureMapper.fromData(row);
  }

  /// Lookup using the stable JSON id
  /// Example:
  /// CABG
  /// BENTALL_PROCEDURE
  /// MIDCAB
  Future<ProcedureEntity?> getProcedureByProcedureId(String procedureId) async {
    final row = await database.procedureDao.getProcedureByProcedureId(
      procedureId,
    );

    if (row == null) return null;

    return ProcedureMapper.fromData(row);
  }

  Future<List<ProcedureEntity>> searchProcedures(String query) async {
    final rows = await database.procedureDao.searchProcedures(query);

    return rows.map(ProcedureMapper.fromData).toList();
  }

  Future<List<ProcedureEntity>> getBySpecialty(String specialty) async {
    final rows = await database.procedureDao.getBySpecialty(specialty);

    return rows.map(ProcedureMapper.fromData).toList();
  }

  Future<void> addProcedure(ProcedureEntity procedure) async {
    await database.procedureDao.insertProcedure(
      ProcedureMapper.toCompanion(procedure),
    );
  }

  Future<void> updateProcedure(ProcedureEntity procedure) async {
    await database.procedureDao.updateProcedure(
      ProcedureMapper.toCompanion(procedure),
    );
  }

  Future<void> deleteProcedure(int id) async {
    await database.procedureDao.deleteProcedure(id);
  }
}
