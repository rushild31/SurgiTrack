import 'package:drift/drift.dart';

import 'surgical_cases.dart';
import 'procedures.dart';

class CaseProcedures extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get caseId => integer().references(SurgicalCases, #id)();

  IntColumn get procedureId => integer().references(Procedures, #id)();

  TextColumn get type => text().withDefault(const Constant("PRIMARY"))();
}
