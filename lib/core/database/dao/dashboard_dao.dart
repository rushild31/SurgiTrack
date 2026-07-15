import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/patients.dart';
import 'package:surgitrack/core/database/tables/surgical_cases.dart';
import 'package:surgitrack/core/database/tables/case_procedures.dart';

part 'dashboard_dao.g.dart';

@DriftAccessor(tables: [Patients, SurgicalCases, CaseProcedures])
class DashboardDao extends DatabaseAccessor<AppDatabase>
    with _$DashboardDaoMixin {
  DashboardDao(super.db);

  Future<int> patientCount() async {
    final result = await (selectOnly(
      patients,
    )..addColumns([patients.id.count()])).getSingle();

    return result.read(patients.id.count()) ?? 0;
  }

  Future<int> caseCount() async {
    final result = await (selectOnly(
      surgicalCases,
    )..addColumns([surgicalCases.id.count()])).getSingle();

    return result.read(surgicalCases.id.count()) ?? 0;
  }

  Future<int> procedureCount() async {
    final result = await (selectOnly(
      caseProcedures,
    )..addColumns([caseProcedures.id.count()])).getSingle();

    return result.read(caseProcedures.id.count()) ?? 0;
  }

  Future<int> caseCountThisMonth() async {
    final now = DateTime.now();

    final start = DateTime(now.year, now.month, 1);

    final result =
        await (selectOnly(surgicalCases)
              ..addColumns([surgicalCases.id.count()])
              ..where(surgicalCases.surgeryDate.isBiggerOrEqualValue(start)))
            .getSingle();

    return result.read(surgicalCases.id.count()) ?? 0;
  }

  Future<List<SurgicalCaseData>> recentCases() {
    return (select(surgicalCases)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.surgeryDate)])
          ..limit(5))
        .get();
  }

  Future<List<SurgicalCaseData>> getAllCases() {
    return select(surgicalCases).get();
  }
}
