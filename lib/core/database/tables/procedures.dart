import 'package:drift/drift.dart';

@DataClassName('ProcedureData')
class Procedures extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get procedureId => text().unique()();

  TextColumn get name => text()();

  TextColumn get category => text()();

  TextColumn get specialty =>
      text().withDefault(const Constant("Cardiothoracic Surgery"))();

  IntColumn get parentId => integer().nullable().references(Procedures, #id)();

  TextColumn get aliases => text().nullable()();

  TextColumn get description => text().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
