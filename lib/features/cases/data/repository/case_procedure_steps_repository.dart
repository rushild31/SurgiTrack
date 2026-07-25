import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/dao/case_procedure_steps_dao.dart';

import 'package:surgitrack/core/utils/operative_role_utils.dart';

class CaseProcedureStepsRepository {
  final AppDatabase database;

  CaseProcedureStepsRepository(this.database);

  // =====================================================
  // GET TECHNICAL STEPS FOR A CASE PROCEDURE
  // =====================================================

  Future<List<CaseProcedureStepWithDetails>> getStepsForCaseProcedure(
    int caseProcedureId,
  ) {
    return database.caseProcedureStepsDao.getStepsForCaseProcedure(
      caseProcedureId,
    );
  }

  // =====================================================
  // WATCH TECHNICAL STEPS FOR A CASE PROCEDURE
  // =====================================================

  Stream<List<CaseProcedureStepWithDetails>> watchStepsForCaseProcedure(
    int caseProcedureId,
  ) {
    return database.caseProcedureStepsDao.watchStepsForCaseProcedure(
      caseProcedureId,
    );
  }

  // =====================================================
  // SAVE COMPLETE TECHNICAL EXPOSURE
  //
  // Deletes previous selections and writes the current
  // selection atomically.
  // =====================================================

  Future<void> saveTechnicalExposure({
    required int caseProcedureId,
    required Map<int, String> stepRoles,
  }) async {
    await database.transaction(() async {
      await database.caseProcedureStepsDao.deleteForCaseProcedure(
        caseProcedureId,
      );

      for (final entry in stepRoles.entries) {
        final procedureStepId = entry.key;

        final role = normalizeOperativeRole(entry.value);

        await database.caseProcedureStepsDao.insertCaseProcedureStep(
          CaseProcedureStepsCompanion(
            caseProcedureId: Value(caseProcedureId),

            procedureStepId: Value(procedureStepId),

            role: Value(role),
          ),
        );
      }
    });
  }

  // =====================================================
  // SAVE ONE TECHNICAL STEP
  // =====================================================

  Future<int> saveTechnicalStep({
    required int caseProcedureId,
    required int procedureStepId,
    required String role,
    String? notes,
  }) {
    return database.caseProcedureStepsDao.insertCaseProcedureStep(
      CaseProcedureStepsCompanion(
        caseProcedureId: Value(caseProcedureId),

        procedureStepId: Value(procedureStepId),

        role: Value(normalizeOperativeRole(role)),

        notes: Value(notes),
      ),
    );
  }

  // =====================================================
  // DELETE ALL TECHNICAL EXPOSURE
  // =====================================================

  Future<int> deleteTechnicalExposure(int caseProcedureId) {
    return database.caseProcedureStepsDao.deleteForCaseProcedure(
      caseProcedureId,
    );
  }
}
