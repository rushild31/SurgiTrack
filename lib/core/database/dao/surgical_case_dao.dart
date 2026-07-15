import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/surgical_cases.dart';

part 'surgical_case_dao.g.dart';

@DriftAccessor(tables: [SurgicalCases])
class SurgicalCaseDao extends DatabaseAccessor<AppDatabase>
    with _$SurgicalCaseDaoMixin {
  SurgicalCaseDao(super.db);

  Future<List<SurgicalCaseData>> getAllCases() {
    return (select(
      surgicalCases,
    )..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])).get();
  }

  Stream<List<SurgicalCaseData>> watchCases() {
    return (select(
      surgicalCases,
    )..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])).watch();
  }

  Future<SurgicalCaseData?> getCaseById(int id) {
    return (select(
      surgicalCases,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertCase(SurgicalCasesCompanion surgicalCase) {
    return into(surgicalCases).insert(surgicalCase);
  }

  Future<bool> updateCase(SurgicalCasesCompanion surgicalCase) {
    return update(surgicalCases).replace(surgicalCase);
  }

  Future<int> deleteCase(int id) {
    return (delete(surgicalCases)..where((tbl) => tbl.id.equals(id))).go();
  }
}
