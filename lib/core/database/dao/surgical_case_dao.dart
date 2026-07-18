import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/surgical_cases.dart';
import 'package:surgitrack/core/database/tables/patients.dart';

import 'package:surgitrack/features/cases/domain/surgical_case_list_item.dart';

part 'surgical_case_dao.g.dart';

@DriftAccessor(tables: [SurgicalCases, Patients])
class SurgicalCaseDao extends DatabaseAccessor<AppDatabase>
    with _$SurgicalCaseDaoMixin {
  SurgicalCaseDao(super.db);

  Future<List<SurgicalCaseData>> getAllCases() {
    return (select(
      surgicalCases,
    )..orderBy([(tbl) => OrderingTerm.desc(tbl.surgeryDate)])).get();
  }

  Stream<List<SurgicalCaseData>> watchCases() {
    return (select(
      surgicalCases,
    )..orderBy([(tbl) => OrderingTerm.desc(tbl.surgeryDate)])).watch();
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

  /// Surgical logbook query
  ///
  /// Returns compact case information with patient details
  /// for Case List / Operative Registry view.
  Stream<List<SurgicalCaseListItem>> watchCaseLogbook() {
    final query = select(surgicalCases).join([
      innerJoin(patients, patients.id.equalsExp(surgicalCases.patientId)),
    ])..orderBy([OrderingTerm.desc(surgicalCases.surgeryDate)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final surgicalCase = row.readTable(surgicalCases);

        final patient = row.readTable(patients);

        return SurgicalCaseListItem(
          id: surgicalCase.id,
          caseId: surgicalCase.caseId,
          patientName: patient.name,
          hospitalId: patient.hospitalId,
          surgeryDate: surgicalCase.surgeryDate,
          diagnosis: surgicalCase.diagnosis,
          specialty: surgicalCase.specialty,
          operativeRole: surgicalCase.operativeRole,
        );
      }).toList();
    });
  }
}
