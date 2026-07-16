import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/tables/case_procedure_steps.dart';
import 'package:surgitrack/core/database/tables/procedure_steps.dart';
import 'package:surgitrack/core/database/tables/procedures.dart';

part 'case_procedure_steps_dao.g.dart';

class CaseProcedureStepWithDetails {
  final CaseProcedureStepData caseStep;

  final ProcedureStepData procedureStep;

  CaseProcedureStepWithDetails({
    required this.caseStep,

    required this.procedureStep,
  });
}

class CaseProcedureStepWithProcedureDetails {
  final CaseProcedureStepData caseStep;

  final ProcedureStepData procedureStep;

  final ProcedureData procedure;

  CaseProcedureStepWithProcedureDetails({
    required this.caseStep,

    required this.procedureStep,

    required this.procedure,
  });
}

@DriftAccessor(tables: [CaseProcedureSteps, ProcedureSteps, Procedures])
class CaseProcedureStepsDao extends DatabaseAccessor<AppDatabase>
    with _$CaseProcedureStepsDaoMixin {
  CaseProcedureStepsDao(super.db);

  Future<int> insertCaseProcedureStep(CaseProcedureStepsCompanion companion) {
    return into(caseProcedureSteps).insert(companion);
  }

  Future<List<CaseProcedureStepWithDetails>> getStepsForCaseProcedure(
    int caseProcedureId,
  ) {
    final query =
        select(caseProcedureSteps).join([
            innerJoin(
              procedureSteps,
              procedureSteps.id.equalsExp(caseProcedureSteps.procedureStepId),
            ),
          ])
          ..where(caseProcedureSteps.caseProcedureId.equals(caseProcedureId))
          ..orderBy([OrderingTerm.asc(procedureSteps.orderIndex)]);

    return query.map((row) {
      return CaseProcedureStepWithDetails(
        caseStep: row.readTable(caseProcedureSteps),

        procedureStep: row.readTable(procedureSteps),
      );
    }).get();
  }

  // =========================
  // Analytics
  // =========================

  /// Returns all technical step exposure logs
  /// with parent procedure information
  Future<List<CaseProcedureStepWithProcedureDetails>>
  getAllCaseProcedureSteps() {
    final query = select(caseProcedureSteps).join([
      innerJoin(
        procedureSteps,
        procedureSteps.id.equalsExp(caseProcedureSteps.procedureStepId),
      ),

      innerJoin(
        procedures,
        procedures.id.equalsExp(procedureSteps.procedureId),
      ),
    ]);

    return query.map((row) {
      return CaseProcedureStepWithProcedureDetails(
        caseStep: row.readTable(caseProcedureSteps),

        procedureStep: row.readTable(procedureSteps),

        procedure: row.readTable(procedures),
      );
    }).get();
  }

  Stream<List<CaseProcedureStepWithDetails>> watchStepsForCaseProcedure(
    int caseProcedureId,
  ) {
    final query =
        select(caseProcedureSteps).join([
            innerJoin(
              procedureSteps,
              procedureSteps.id.equalsExp(caseProcedureSteps.procedureStepId),
            ),
          ])
          ..where(caseProcedureSteps.caseProcedureId.equals(caseProcedureId))
          ..orderBy([OrderingTerm.asc(procedureSteps.orderIndex)]);

    return query.map((row) {
      return CaseProcedureStepWithDetails(
        caseStep: row.readTable(caseProcedureSteps),

        procedureStep: row.readTable(procedureSteps),
      );
    }).watch();
  }

  Future<bool> updateCaseProcedureStep(CaseProcedureStepsCompanion step) {
    return update(caseProcedureSteps).replace(step);
  }

  Future<int> deleteCaseProcedureStep(int id) {
    return (delete(caseProcedureSteps)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteForCaseProcedure(int caseProcedureId) {
    return (delete(
      caseProcedureSteps,
    )..where((tbl) => tbl.caseProcedureId.equals(caseProcedureId))).go();
  }
}
