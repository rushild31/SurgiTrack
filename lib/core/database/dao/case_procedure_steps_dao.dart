import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/tables/case_procedure_steps.dart';
import 'package:surgitrack/core/database/tables/procedure_steps.dart';
import 'package:surgitrack/core/database/tables/procedures.dart';
import 'package:surgitrack/core/database/tables/case_procedures.dart';
import 'package:surgitrack/core/database/tables/surgical_cases.dart';

part 'case_procedure_steps_dao.g.dart';

// =====================================================
// CASE PROCEDURE STEP DETAILS
// =====================================================

class CaseProcedureStepWithDetails {
  final CaseProcedureStepData caseStep;

  final ProcedureStepData procedureStep;

  CaseProcedureStepWithDetails({
    required this.caseStep,
    required this.procedureStep,
  });
}

// =====================================================
// CASE PROCEDURE STEP + PROCEDURE + CASE DETAILS
// =====================================================

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

  // =====================================================
  // INSERT SINGLE TECHNICAL STEP EXPOSURE
  // =====================================================

  Future<int> insertCaseProcedureStep(CaseProcedureStepsCompanion companion) {
    return into(caseProcedureSteps).insert(companion);
  }

  // =====================================================
  // INSERT MULTIPLE TECHNICAL STEP EXPOSURES
  // =====================================================

  Future<void> insertMultipleCaseProcedureSteps(
    List<CaseProcedureStepsCompanion> steps,
  ) async {
    if (steps.isEmpty) {
      return;
    }

    await batch((batch) {
      batch.insertAll(caseProcedureSteps, steps);
    });
  }

  // =====================================================
  // GET TECHNICAL STEPS FOR ONE CASE PROCEDURE
  //
  // Ordered according to the procedure's defined
  // technical step sequence.
  // =====================================================

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

  // =====================================================
  // GET ALL TECHNICAL STEP EXPOSURES
  //
  // Includes:
  // - Case technical-step exposure
  // - Procedure step definition
  // - Procedure details
  // - Parent surgical case ID
  //
  // Used for:
  // - Technical exposure analytics
  // - Reports
  // - Portfolio statistics
  // =====================================================

  Future<List<CaseProcedureStepWithProcedureDetails>>
  getAllCaseProcedureSteps() {
    final query =
        select(caseProcedureSteps).join([
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
        ])..orderBy([
          OrderingTerm.asc(surgicalCases.surgeryDate),
          OrderingTerm.asc(procedureSteps.orderIndex),
        ]);

    return query.map((row) {
      final surgicalCase = row.readTable(surgicalCases);

      return CaseProcedureStepWithProcedureDetails(
        caseStep: row.readTable(caseProcedureSteps),
        procedureStep: row.readTable(procedureSteps),
        procedure: row.readTable(procedures),
        caseId: surgicalCase.id,
      );
    }).get();
  }

  // =====================================================
  // WATCH TECHNICAL STEPS FOR ONE CASE PROCEDURE
  // =====================================================

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

  // =====================================================
  // UPDATE SINGLE TECHNICAL STEP EXPOSURE
  // =====================================================

  Future<bool> updateCaseProcedureStep(CaseProcedureStepsCompanion step) {
    return update(caseProcedureSteps).replace(step);
  }

  // =====================================================
  // DELETE SINGLE TECHNICAL STEP EXPOSURE
  // =====================================================

  Future<int> deleteCaseProcedureStep(int id) {
    return (delete(caseProcedureSteps)..where((tbl) => tbl.id.equals(id))).go();
  }

  // =====================================================
  // DELETE ALL TECHNICAL STEP EXPOSURE
  // FOR ONE CASE PROCEDURE
  // =====================================================

  Future<int> deleteForCaseProcedure(int caseProcedureId) {
    return (delete(
      caseProcedureSteps,
    )..where((tbl) => tbl.caseProcedureId.equals(caseProcedureId))).go();
  }

  // =====================================================
  // GET ONE TECHNICAL STEP EXPOSURE
  // =====================================================

  Future<CaseProcedureStepData?> getCaseProcedureStep({
    required int caseProcedureId,
    required int procedureStepId,
  }) {
    return (select(caseProcedureSteps)..where(
          (tbl) =>
              tbl.caseProcedureId.equals(caseProcedureId) &
              tbl.procedureStepId.equals(procedureStepId),
        ))
        .getSingleOrNull();
  }
}
