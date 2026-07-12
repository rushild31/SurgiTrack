import 'package:drift/drift.dart';

class CaseAttachments extends Table {
  TextColumn get id => text()();

  TextColumn get caseId => text()();

  TextColumn get filePath => text()();

  TextColumn get type => text()();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
