import 'package:drift/drift.dart';

import 'patients.dart';

@DataClassName('PatientTagData')
class PatientTags extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get patientId => integer().references(Patients, #id)();

  TextColumn get tag => text()();

  DateTimeColumn get createdAt => dateTime()();
}
