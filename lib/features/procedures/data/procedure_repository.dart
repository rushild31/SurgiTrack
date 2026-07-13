import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'procedure_mapper.dart';

class ProcedureRepository {
  final AppDatabase db;

  ProcedureRepository(this.db);

  Future<List<ProcedureEntity>> getProcedures() async {
    final rows = await db.procedureDao.getAllProcedures();

    return rows.map(ProcedureMapper.fromData).toList();
  }

  Stream<List<ProcedureEntity>> watchProcedures() {
    return db.procedureDao.watchProcedures().map(
      (rows) => rows.map(ProcedureMapper.fromData).toList(),
    );
  }

  Future<ProcedureEntity?> getProcedureById(int id) async {
    final row = await db.procedureDao.getProcedureById(id);

    if (row == null) {
      return null;
    }

    return ProcedureMapper.fromData(row);
  }

  Future<void> addProcedure(ProcedureEntity procedure) async {
    await db.procedureDao.insertProcedure(
      ProcedureMapper.toCompanion(procedure),
    );
  }

  Future<void> updateProcedure(ProcedureEntity procedure) async {
    await db.procedureDao.updateProcedure(
      ProcedureMapper.toCompanion(procedure),
    );
  }

  Future<void> deleteProcedure(int id) async {
    await db.procedureDao.deleteProcedure(id);
  }
}
