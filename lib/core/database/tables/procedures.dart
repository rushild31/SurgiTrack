import 'package:drift/drift.dart';

@DataClassName('ProcedureData')
class Procedures extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get procedureId => text().unique()();

  TextColumn get name => text()();

  TextColumn get shortName => text().nullable()();

  TextColumn get category => text()();

  TextColumn get specialty => text().withDefault(const Constant('Cardiac'))();

  IntColumn get parentId => integer().nullable().references(Procedures, #id)();

  TextColumn get nodeType => text().withDefault(const Constant('procedure'))();

  TextColumn get aliases => text().nullable()();

  TextColumn get description => text().nullable()();

  /// JSON template id
  TextColumn get template => text().nullable()();

  BoolColumn get supportsCPB => boolean().withDefault(const Constant(false))();

  BoolColumn get supportsRedo => boolean().withDefault(const Constant(false))();

  BoolColumn get supportsEmergency =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get supportsTechnicalSteps =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get supportsAssociatedProcedures =>
      boolean().withDefault(const Constant(false))();

  /// Stored as JSON arrays

  TextColumn get dynamicFields => text().withDefault(const Constant('[]'))();

  TextColumn get technicalSteps => text().withDefault(const Constant('[]'))();

  TextColumn get associatedProcedures =>
      text().withDefault(const Constant('[]'))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
