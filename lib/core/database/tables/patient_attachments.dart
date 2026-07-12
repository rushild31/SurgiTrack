import 'package:drift/drift.dart';

import 'patients.dart';

@DataClassName('PatientAttachmentData')
class PatientAttachments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get patientId => integer().references(Patients, #id)();

  TextColumn get displayName => text()();

  TextColumn get filePath => text()();

  TextColumn get fileType => text()();

  DateTimeColumn get createdAt => dateTime()();
}
