import 'package:drift/drift.dart';

import 'connection/database_connection.dart';

import 'tables/patients.dart';
import 'tables/surgical_cases.dart';
import 'tables/case_attachments.dart';
import 'tables/patient_attachments.dart';
import 'tables/patient_tags.dart';

import 'dao/patient_dao.dart';
import 'dao/patient_attachment_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Patients,
    SurgicalCases,
    CaseAttachments,
    PatientAttachments,
    PatientTags,
  ],

  daos: [PatientDao, PatientAttachmentDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
