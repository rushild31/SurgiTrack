import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

class CaseProcedureRepository {
  final AppDatabase database;

  CaseProcedureRepository(this.database);

  Future<int> addProcedureToCase({
    required int caseId,

    required int procedureId,
  }) {
    return database
        .into(database.caseProcedures)
        .insert(
          CaseProceduresCompanion(
            caseId: Value(caseId),

            procedureId: Value(procedureId),
          ),
        );
  }

  Future<List<CaseProcedureData>> getProceduresForCase(int caseId) {
    return (database.select(
      database.caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).get();
  }

  Future<void> deleteCaseProcedures(int caseId) async {
    await (database.delete(
      database.caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).go();
  }
}
