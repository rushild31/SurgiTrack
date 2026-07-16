import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/tables/case_procedure_steps.dart';
import 'package:surgitrack/core/database/tables/procedure_steps.dart';
import 'package:surgitrack/core/database/tables/procedures.dart';
import 'package:surgitrack/core/database/tables/case_procedures.dart';
import 'package:surgitrack/core/database/tables/surgical_cases.dart';

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

  final int caseId;

  CaseProcedureStepWithProcedureDetails({
    required this.caseStep,
    required this.procedureStep,
    required this.procedure,
    required this.caseId,
  });
}

@DriftAccessor(
  tables: [
    CaseProcedureSteps,
    ProcedureSteps,
    Procedures,
    CaseProcedures,
    SurgicalCases,
  ],
)
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

      innerJoin(
        caseProcedures,
        caseProcedures.id.equalsExp(caseProcedureSteps.caseProcedureId),
      ),

      innerJoin(
        surgicalCases,
        surgicalCases.id.equalsExp(caseProcedures.caseId),
      ),
    ]);

    return query.map((row) {
      return CaseProcedureStepWithProcedureDetails(
        caseStep: row.readTable(caseProcedureSteps),

        procedureStep: row.readTable(procedureSteps),

        procedure: row.readTable(procedures),

        caseId: row.readTable(surgicalCases).id,
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
