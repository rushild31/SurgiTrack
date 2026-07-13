import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/cases/data/mapper/surgical_case_mapper.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart' as domain;

class SurgicalCaseRepository {
  final AppDatabase database;

  SurgicalCaseRepository(this.database);

  Future<List<domain.SurgicalCase>> getCases() async {
    final rows = await database.surgicalCaseDao.getAllCases();

    return rows.map(SurgicalCaseMapper.fromData).toList();
  }

  Stream<List<domain.SurgicalCase>> watchCases() {
    return database.surgicalCaseDao.watchCases().map(
      (rows) => rows.map(SurgicalCaseMapper.fromData).toList(),
    );
  }

  Future<domain.SurgicalCase?> getCaseById(int id) async {
    final row = await database.surgicalCaseDao.getCaseById(id);

    if (row == null) {
      return null;
    }

    return SurgicalCaseMapper.fromData(row);
  }

  Future<int> addCase(domain.SurgicalCase surgicalCase) {
    return database.surgicalCaseDao.insertCase(
      SurgicalCaseMapper.toCompanion(surgicalCase),
    );
  }

  Future<bool> updateCase(domain.SurgicalCase surgicalCase) {
    return database.surgicalCaseDao.updateCase(
      SurgicalCaseMapper.toCompanion(surgicalCase),
    );
  }

  Future<int> deleteCase(int id) {
    return database.surgicalCaseDao.deleteCase(id);
  }

  // =====================================
  // Case - Procedure Relationship
  // =====================================

  Future<int> addProcedureToCase({
    required int caseId,
    required int procedureId,
    required bool primary,
  }) {
    return database.caseProcedureDao.addProcedureToCase(
      CaseProceduresCompanion(
        caseId: Value(caseId),
        procedureId: Value(procedureId),
        type: Value(primary ? "PRIMARY" : "ASSOCIATED"),
      ),
    );
  }

  Future<List<CaseProcedure>> getProceduresForCase(int caseId) {
    return database.caseProcedureDao.getProceduresForCase(caseId);
  }

  Future<void> removeAllProcedures(int caseId) {
    return database.caseProcedureDao.removeAllProceduresFromCase(caseId);
  }
}
