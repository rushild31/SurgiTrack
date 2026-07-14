import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart' as domain;

import 'package:surgitrack/features/cases/data/mapper/surgical_case_mapper.dart';

import 'package:surgitrack/features/procedures/domain/procedure_selection.dart';

class SurgicalCaseRepository {
  final AppDatabase database;

  SurgicalCaseRepository(this.database);

  Stream<List<domain.SurgicalCase>> watchCases() {
    return database.surgicalCaseDao.watchCases().map(
      (rows) => rows.map(SurgicalCaseMapper.fromData).toList(),
    );
  }

  Future<domain.SurgicalCase?> getCaseById(int id) async {
    final row = await database.surgicalCaseDao.getCaseById(id);

    if (row == null) return null;

    return SurgicalCaseMapper.fromData(row);
  }

  Future<void> addCase(
    domain.SurgicalCase surgicalCase,
    ProcedureSelection selection,
  ) async {
    final caseId = await database.surgicalCaseDao.insertCase(
      SurgicalCaseMapper.toCompanion(surgicalCase),
    );

    final primary = selection.primaryProcedure;

    if (primary != null) {
      await database.caseProcedureDao.insertCaseProcedure(
        CaseProceduresCompanion(
          caseId: Value(caseId),

          procedureId: Value(primary.id!),

          type: const Value("PRIMARY"),
        ),
      );
    }

    for (final procedure in selection.associatedProcedures) {
      await database.caseProcedureDao.insertCaseProcedure(
        CaseProceduresCompanion(
          caseId: Value(caseId),

          procedureId: Value(procedure.id!),

          type: const Value("ASSOCIATED"),
        ),
      );
    }
  }

  Future<void> updateCase(domain.SurgicalCase surgicalCase) async {
    await database.surgicalCaseDao.updateCase(
      SurgicalCaseMapper.toCompanion(surgicalCase),
    );
  }

  Future<void> deleteCase(int id) async {
    await database.caseProcedureDao.deleteForCase(id);

    await database.surgicalCaseDao.deleteCase(id);
  }
}
