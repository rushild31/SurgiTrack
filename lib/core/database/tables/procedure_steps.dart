import 'package:drift/drift.dart';

import 'procedures.dart';

@DataClassName('ProcedureStepData')
class ProcedureSteps extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get procedureId => integer().references(Procedures, #id)();

  /// Stable identifier from JSON library
  /// Example:
  /// DISTAL_ANASTOMOSIS
  TextColumn get stepId => text()();

  TextColumn get stepName => text()();

  IntColumn get orderIndex => integer()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
