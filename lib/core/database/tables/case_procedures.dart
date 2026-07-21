import 'package:drift/drift.dart';

import 'surgical_cases.dart';
import 'procedures.dart';

@DataClassName('CaseProcedureData')
class CaseProcedures extends Table {
  /// Primary key
  IntColumn get id => integer().autoIncrement()();

  /// Linked surgical case
  IntColumn get caseId => integer().references(SurgicalCases, #id)();

  /// Linked procedure
  IntColumn get procedureId => integer().references(Procedures, #id)();

  /*
    Procedure relationship type:

    PRIMARY
    ASSOCIATED
    CONCOMITANT
    STAGED
  */

  TextColumn get type => text().withDefault(const Constant("PRIMARY"))();

  /// Audit timestamp
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// Prevent duplicate procedure mapping
  ///
  /// Example prevented:
  ///
  /// Case:
  /// CABG
  /// CABG
  /// CABG
  ///
  @override
  List<Set<Column>> get uniqueKeys => [
    {caseId, procedureId},
  ];
}
