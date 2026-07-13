// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dao.dart';

// ignore_for_file: type=lint
mixin _$DashboardDaoMixin on DatabaseAccessor<AppDatabase> {
  $PatientsTable get patients => attachedDatabase.patients;
  $SurgicalCasesTable get surgicalCases => attachedDatabase.surgicalCases;
  $CaseProceduresTable get caseProcedures => attachedDatabase.caseProcedures;
  DashboardDaoManager get managers => DashboardDaoManager(this);
}

class DashboardDaoManager {
  final _$DashboardDaoMixin _db;
  DashboardDaoManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db.attachedDatabase, _db.patients);
  $$SurgicalCasesTableTableManager get surgicalCases =>
      $$SurgicalCasesTableTableManager(_db.attachedDatabase, _db.surgicalCases);
  $$CaseProceduresTableTableManager get caseProcedures =>
      $$CaseProceduresTableTableManager(
        _db.attachedDatabase,
        _db.caseProcedures,
      );
}
