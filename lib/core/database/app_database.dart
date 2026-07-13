import 'package:drift/drift.dart';

import 'connection/database_connection.dart';

import 'tables/patients.dart';
import 'tables/patient_attachments.dart';
import 'tables/patient_tags.dart';
import 'tables/procedures.dart';
import 'tables/surgical_cases.dart';
import 'tables/case_procedures.dart';
import 'tables/case_attachments.dart';

import 'dao/patient_dao.dart';
import 'dao/patient_attachment_dao.dart';
import 'dao/procedure_dao.dart';
import 'dao/surgical_case_dao.dart';
import 'dao/case_procedure_dao.dart';
import 'dao/case_attachment_dao.dart';
import 'dao/dashboard_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Patients,
    PatientAttachments,
    PatientTags,
    Procedures,
    SurgicalCases,
    CaseProcedures,
    CaseAttachments,
  ],
  daos: [
    PatientDao,
    PatientAttachmentDao,
    ProcedureDao,
    SurgicalCaseDao,
    CaseProcedureDao,
    CaseAttachmentDao,
    DashboardDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 3;
}
