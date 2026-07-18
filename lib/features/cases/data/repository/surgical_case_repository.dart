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

    if (row == null) {
      return null;
    }

    return SurgicalCaseMapper.fromData(row);
  }

  /// Generates SurgiTrack portfolio ID
  ///
  /// Format:
  /// CTVS-2026-0001
  ///
  /// Sequence is based on highest existing case number
  /// to prevent duplicate IDs after deletion.
  Future<String> generateCaseId() async {
    final year = DateTime.now().year;

    final cases = await database.surgicalCaseDao.getAllCases();

    var nextSequence = 1;

    for (final surgicalCase in cases) {
      final existingId = surgicalCase.caseId;

      if (!existingId.startsWith("CTVS-$year-")) {
        continue;
      }

      final parts = existingId.split("-");

      if (parts.length != 3) {
        continue;
      }

      final number = int.tryParse(parts[2]);

      if (number != null && number >= nextSequence) {
        nextSequence = number + 1;
      }
    }

    final formattedNumber = nextSequence.toString().padLeft(4, "0");

    return "CTVS-$year-$formattedNumber";
  }

  Future<void> addCase(
    domain.SurgicalCase surgicalCase,
    ProcedureSelection selection,
  ) async {
    await database.transaction(() async {
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
    });
  }

  Future<void> updateCase(domain.SurgicalCase surgicalCase) async {
    await database.transaction(() async {
      await database.surgicalCaseDao.updateCase(
        SurgicalCaseMapper.toCompanion(surgicalCase),
      );
    });
  }

  Future<void> deleteCase(int id) async {
    await database.transaction(() async {
      await database.caseProcedureDao.deleteForCase(id);

      await database.surgicalCaseDao.deleteCase(id);
    });
  }
}
