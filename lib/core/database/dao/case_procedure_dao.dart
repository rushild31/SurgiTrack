import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/case_procedures.dart';
import '../tables/procedures.dart';

part 'case_procedure_dao.g.dart';

@DriftAccessor(tables: [CaseProcedures, Procedures])
class CaseProcedureDao extends DatabaseAccessor<AppDatabase>
    with _$CaseProcedureDaoMixin {
  CaseProcedureDao(super.db);

  Future<List<CaseProcedure>> getProceduresForCase(int caseId) {
    return (select(
      caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).get();
  }

  Future<int> addProcedureToCase(CaseProceduresCompanion companion) {
    return into(caseProcedures).insert(companion);
  }

  Future<int> removeProcedureFromCase(int id) {
    return (delete(caseProcedures)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> removeAllProceduresFromCase(int caseId) {
    return (delete(
      caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).go();
  }
}
