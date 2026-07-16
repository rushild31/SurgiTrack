import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/procedure_steps.dart';

part 'procedure_steps_dao.g.dart';

@DriftAccessor(tables: [ProcedureSteps])
class ProcedureStepsDao extends DatabaseAccessor<AppDatabase>
    with _$ProcedureStepsDaoMixin {
  ProcedureStepsDao(super.db);

  /// Get all technical steps for a procedure
  ///
  /// Example:
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

  /// Reactive stream for procedure step list
  Stream<List<ProcedureStepData>> watchStepsForProcedure(int procedureId) {
    return (select(procedureSteps)
          ..where((tbl) => tbl.procedureId.equals(procedureId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderIndex)]))
        .watch();
  }

  /// Single step lookup
  Future<ProcedureStepData?> getStepById(int id) {
    return (select(
      procedureSteps,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Insert technical step into library
  Future<int> insertStep(ProcedureStepsCompanion companion) {
    return into(procedureSteps).insert(companion);
  }

  /// Insert multiple steps during JSON import
  Future<void> insertMultipleSteps(List<ProcedureStepsCompanion> steps) async {
    await batch((batch) {
      batch.insertAll(procedureSteps, steps);
    });
  }

  /// Update step
  Future<bool> updateStep(ProcedureStepsCompanion step) {
    return update(procedureSteps).replace(step);
  }

  /// Delete all steps belonging to a procedure
  ///
  /// Useful during procedure library refresh
  Future<int> deleteStepsForProcedure(int procedureId) {
    return (delete(
      procedureSteps,
    )..where((tbl) => tbl.procedureId.equals(procedureId))).go();
  }
}
