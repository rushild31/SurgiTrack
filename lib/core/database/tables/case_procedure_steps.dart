import 'package:drift/drift.dart';

import 'case_procedures.dart';
import 'procedure_steps.dart';

@DataClassName('CaseProcedureStepData')
class CaseProcedureSteps extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get caseProcedureId => integer().references(CaseProcedures, #id)();

  IntColumn get procedureStepId => integer().references(ProcedureSteps, #id)();

  /// Personal technical step exposure role
  ///
  /// Allowed values:
  /// observed
  /// assisted
  /// performed_under_supervision
  /// performed_independently
  TextColumn get role => text()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
