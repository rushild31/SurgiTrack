import 'package:drift/drift.dart';

class Procedures extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get category => text()();

  TextColumn get specialty =>
      text().withDefault(const Constant("Cardiothoracic Surgery"))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
