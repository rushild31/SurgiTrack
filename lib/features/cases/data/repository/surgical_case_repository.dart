import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart' as domain;

import 'package:surgitrack/features/cases/data/mapper/surgical_case_mapper.dart';

import 'package:surgitrack/features/procedures/domain/procedure_selection.dart';

class SurgicalCaseRepository {
  final AppDatabase database;

  SurgicalCaseRepository(this.database);

  // =====================================================
  // WATCH ALL CASES
  // =====================================================

  Stream<List<domain.SurgicalCase>> watchCases() {
    return database.surgicalCaseDao.watchCases().map(
      (rows) => rows.map(SurgicalCaseMapper.fromData).toList(),
    );
  }

  // =====================================================
  // GET SINGLE CASE
  // =====================================================

  Future<domain.SurgicalCase?> getCaseById(int id) async {
    final row = await database.surgicalCaseDao.getCaseById(id);

    if (row == null) {
      return null;
    }

    return SurgicalCaseMapper.fromData(row);
  }

  // =====================================================
  // GENERATE PORTFOLIO ID
  //
  // Format:
  // CTVS-2026-0001
  //
  // Sequential and deletion-safe
  // =====================================================

  Future<String> generateCaseId() async {
    final year = DateTime.now().year;

    final cases = await database.surgicalCaseDao.getAllCases();

    var highestNumber = 0;

    for (final surgicalCase in cases) {
      final id = surgicalCase.caseId;

      if (!id.startsWith("CTVS-$year-")) {
        continue;
      }

      final parts = id.split("-");

      if (parts.length != 3) {
        continue;
      }

      final number = int.tryParse(parts.last);

      if (number != null && number > highestNumber) {
        highestNumber = number;
      }
    }

    final nextNumber = highestNumber + 1;

    return "CTVS-$year-${nextNumber.toString().padLeft(4, "0")}";
  }

  // =====================================================
  // ADD NEW CASE
  //
  // Creates:
  // 1. Surgical case
  // 2. Primary procedure link
  // 3. Associated procedure links
  //
  // Atomic transaction
  // =====================================================

  Future<void> addCase(
    domain.SurgicalCase surgicalCase,
    ProcedureSelection selection,
  ) async {
    await database.transaction(() async {
      final caseId = await database.surgicalCaseDao.insertCase(
        SurgicalCaseMapper.toCompanion(surgicalCase),
      );

      // -------------------------------------------------
      // PRIMARY PROCEDURE
      // -------------------------------------------------

      final primary = selection.primaryProcedure;

      if (primary != null && primary.id != null) {
        await database.caseProcedureDao.insertCaseProcedure(
          CaseProceduresCompanion(
            caseId: Value(caseId),
            procedureId: Value(primary.id!),
            type: const Value("PRIMARY"),
          ),
        );
      }

      // -------------------------------------------------
      // ASSOCIATED PROCEDURES
      // -------------------------------------------------

      for (final procedure in selection.associatedProcedures) {
        if (procedure.id == null) {
          continue;
        }

        await database.caseProcedureDao.insertCaseProcedure(
          CaseProceduresCompanion(
            caseId: Value(caseId),
            procedureId: Value(procedure.id!),
            type: const Value("ASSOCIATED"),
          ),
        );
      }
    });
  }

  // =====================================================
  // UPDATE CASE
  //
  // Updates:
  // 1. Surgical case details
  // 2. Deletes all existing procedure links
  // 3. Inserts new primary procedure link
  // 4. Inserts new associated procedure links
  //
  // Atomic transaction
  // =====================================================

  Future<void> updateCase(
    domain.SurgicalCase surgicalCase,
    ProcedureSelection selection,
  ) async {
    final caseId = surgicalCase.id;

    if (caseId == null) {
      throw Exception("Cannot update a surgical case without a database ID.");
    }

    await database.transaction(() async {
      // -------------------------------------------------
      // UPDATE SURGICAL CASE
      // -------------------------------------------------

      await database.surgicalCaseDao.updateCase(
        SurgicalCaseMapper.toCompanion(surgicalCase),
      );

      // -------------------------------------------------
      // REMOVE EXISTING PROCEDURE LINKS
      //
      // This allows the user to:
      // - change the primary procedure
      // - add associated procedures
      // - remove associated procedures
      // - promote an associated procedure to primary
      //
      // -------------------------------------------------

      await database.caseProcedureDao.deleteForCase(caseId);

      // -------------------------------------------------
      // INSERT PRIMARY PROCEDURE
      // -------------------------------------------------

      final primary = selection.primaryProcedure;

      if (primary != null && primary.id != null) {
        await database.caseProcedureDao.insertCaseProcedure(
          CaseProceduresCompanion(
            caseId: Value(caseId),
            procedureId: Value(primary.id!),
            type: const Value("PRIMARY"),
          ),
        );
      }

      // -------------------------------------------------
      // INSERT ASSOCIATED PROCEDURES
      // -------------------------------------------------

      for (final procedure in selection.associatedProcedures) {
        if (procedure.id == null) {
          continue;
        }

        await database.caseProcedureDao.insertCaseProcedure(
          CaseProceduresCompanion(
            caseId: Value(caseId),
            procedureId: Value(procedure.id!),
            type: const Value("ASSOCIATED"),
          ),
        );
      }
    });
  }

  // =====================================================
  // DELETE CASE
  //
  // Removes:
  // 1. All procedure links
  // 2. Surgical case
  //
  // Atomic transaction
  // =====================================================

  Future<void> deleteCase(int id) async {
    await database.transaction(() async {
      // Remove linked procedures first
      await database.caseProcedureDao.deleteForCase(id);

      // Then delete the surgical case
      await database.surgicalCaseDao.deleteCase(id);
    });
  }
}
