import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/case_procedures.dart';
import 'package:surgitrack/core/database/tables/procedures.dart';

part 'case_procedure_dao.g.dart';

class CaseProcedureWithProcedure {
  final CaseProcedureData caseProcedure;

  final ProcedureData procedure;

  CaseProcedureWithProcedure({
    required this.caseProcedure,
    required this.procedure,
  });
}

@DriftAccessor(tables: [CaseProcedures, Procedures])
class CaseProcedureDao extends DatabaseAccessor<AppDatabase>
    with _$CaseProcedureDaoMixin {
  CaseProcedureDao(super.db);

  Future<int> insertCaseProcedure(CaseProceduresCompanion companion) {
    return into(caseProcedures).insert(companion);
  }

  /// Get all procedures linked to a particular case
  Future<List<CaseProcedureWithProcedure>> getProceduresForCase(int caseId) {
    final query = select(caseProcedures).join([
      innerJoin(
        procedures,
        procedures.id.equalsExp(caseProcedures.procedureId),
      ),
    ])..where(caseProcedures.caseId.equals(caseId));

    return query.map((row) {
      return CaseProcedureWithProcedure(
        caseProcedure: row.readTable(caseProcedures),
        procedure: row.readTable(procedures),
      );
    }).get();
  }

  /// Analytics:
  /// Returns every procedure performed across all cases
  ///
  /// Used for:
  /// - total procedure count
  /// - procedure exposure analytics
  /// - role based procedure statistics
  Future<List<CaseProcedureWithProcedure>> getAllCaseProcedures() {
    final query = select(caseProcedures).join([
      innerJoin(
        procedures,
        procedures.id.equalsExp(caseProcedures.procedureId),
      ),
    ]);

    return query.map((row) {
      return CaseProcedureWithProcedure(
        caseProcedure: row.readTable(caseProcedures),
        procedure: row.readTable(procedures),
      );
    }).get();
  }

  Future<void> deleteForCase(int caseId) async {
    await (delete(
      caseProcedures,
    )..where((tbl) => tbl.caseId.equals(caseId))).go();
  }
}
