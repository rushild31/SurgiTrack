import 'package:drift/drift.dart';

import 'surgical_cases.dart';

class CaseAttachments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get caseId => integer().references(SurgicalCases, #id)();

  TextColumn get displayName => text()();

  TextColumn get filePath => text()();

  TextColumn get fileType => text()();

  DateTimeColumn get createdAt => dateTime()();
}
