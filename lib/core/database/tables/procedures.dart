import 'package:drift/drift.dart';

@DataClassName('ProcedureData')
class Procedures extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Unique procedure identifier
  TextColumn get procedureId => text().unique()();

  /// Display name
  TextColumn get name => text()();

  /// Cardiac / Thoracic / Vascular / Congenital
  TextColumn get specialty => text().withDefault(const Constant("Cardiac"))();

  /// CABG, Valve, Aortic, etc.
  TextColumn get category => text()();

  /// Parent procedure for hierarchy
  /// Example:
  /// Valve Surgery -> AVR
  IntColumn get parentId => integer().nullable()();

  /// Additional search terms
  /// Stored as JSON array
  TextColumn get aliases => text().nullable()();

  TextColumn get description => text().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
