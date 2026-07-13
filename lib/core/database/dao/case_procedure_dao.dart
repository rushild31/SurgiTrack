import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/case_procedures.dart';

part 'case_procedure_dao.g.dart';

@DriftAccessor(tables: [CaseProcedures])
class CaseProcedureDao extends DatabaseAccessor<AppDatabase>
    with _$CaseProcedureDaoMixin {
  CaseProcedureDao(super.db);

  Future<int> insertCaseProcedure(CaseProceduresCompanion companion) {
    return into(caseProcedures).insert(companion);
  }

  Future<List<CaseProcedure>> getProceduresForCase(int caseId) {
    return (select(
      caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).get();
  }

  Future<void> deleteForCase(int caseId) async {
    await (delete(
      caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).go();
  }
}
