import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/procedure_steps.dart';

part 'procedure_steps_dao.g.dart';

@DriftAccessor(tables: [ProcedureSteps])
class ProcedureStepsDao extends DatabaseAccessor<AppDatabase>
    with _$ProcedureStepsDaoMixin {
  ProcedureStepsDao(super.db);

  // =====================================================
  // GET ALL TECHNICAL STEPS FOR A PROCEDURE
  // =====================================================

  /// Returns all technical steps belonging to a procedure,
  /// ordered by their defined sequence.
  ///
  /// Example:
  ///
  /// CABG
  ///  ├── LIMA Harvest
  ///  ├── Distal Anastomosis
  ///  └── Proximal Anastomosis
  Future<List<ProcedureStepData>> getStepsForProcedure(int procedureId) {
    return (select(procedureSteps)
          ..where((tbl) => tbl.procedureId.equals(procedureId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderIndex)]))
        .get();
  }

  // =====================================================
  // WATCH TECHNICAL STEPS FOR A PROCEDURE
  // =====================================================

  /// Reactive stream for procedure-specific technical steps.
  Stream<List<ProcedureStepData>> watchStepsForProcedure(int procedureId) {
    return (select(procedureSteps)
          ..where((tbl) => tbl.procedureId.equals(procedureId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderIndex)]))
        .watch();
  }

  // =====================================================
  // GET SINGLE TECHNICAL STEP
  // =====================================================

  Future<ProcedureStepData?> getStepById(int id) {
    return (select(
      procedureSteps,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // =====================================================
  // INSERT TECHNICAL STEP
  // =====================================================

  Future<int> insertStep(ProcedureStepsCompanion companion) {
    return into(procedureSteps).insert(companion);
  }

  // =====================================================
  // INSERT MULTIPLE TECHNICAL STEPS
  // =====================================================

  /// Used during procedure-library import and refresh.
  Future<void> insertMultipleSteps(List<ProcedureStepsCompanion> steps) async {
    if (steps.isEmpty) {
      return;
    }

    await batch((batch) {
      batch.insertAll(procedureSteps, steps);
    });
  }

  // =====================================================
  // UPDATE TECHNICAL STEP
  // =====================================================

  Future<bool> updateStep(ProcedureStepsCompanion step) {
    return update(procedureSteps).replace(step);
  }

  // =====================================================
  // DELETE ALL STEPS FOR A PROCEDURE
  // =====================================================

  /// Deletes all technical-step definitions belonging to
  /// a procedure.
  ///
  /// This is intended for procedure-library refresh/import
  /// operations.
  ///
  /// Case-specific exposure records must be removed first
  /// before deleting procedure-step definitions.
  Future<int> deleteStepsForProcedure(int procedureId) {
    return (delete(
      procedureSteps,
    )..where((tbl) => tbl.procedureId.equals(procedureId))).go();
  }
}
