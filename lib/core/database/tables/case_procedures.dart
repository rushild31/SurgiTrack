import 'package:drift/drift.dart';

import 'surgical_cases.dart';
import 'procedures.dart';

@DataClassName('CaseProcedureData')
class CaseProcedures extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get caseId => integer().references(SurgicalCases, #id)();

  IntColumn get procedureId => integer().references(Procedures, #id)();

  /*
    PRIMARY
    ASSOCIATED
    CONCOMITANT
    STAGED
  */

  TextColumn get type => text().withDefault(const Constant("PRIMARY"))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
