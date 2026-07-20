import 'package:drift/drift.dart';

@DataClassName('PatientData')
class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get patientId => text().unique()();

  TextColumn get name => text()();

  TextColumn get hospitalId => text()();

  DateTimeColumn get dateOfBirth => dateTime()();

  TextColumn get sex => text().withDefault(const Constant('Male'))();

  TextColumn get bloodGroup => text().nullable()();

  TextColumn get comorbidities => text().nullable()();

  TextColumn get address => text().nullable()();

  DateTimeColumn get admissionDate => dateTime().nullable()();

  RealColumn get ejectionFraction => real().nullable()();

  TextColumn get pastOperativeHistory => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
