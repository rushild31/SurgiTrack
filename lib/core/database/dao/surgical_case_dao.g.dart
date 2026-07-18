// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surgical_case_dao.dart';

// ignore_for_file: type=lint
mixin _$SurgicalCaseDaoMixin on DatabaseAccessor<AppDatabase> {
  $SurgicalCasesTable get surgicalCases => attachedDatabase.surgicalCases;
  $PatientsTable get patients => attachedDatabase.patients;
  SurgicalCaseDaoManager get managers => SurgicalCaseDaoManager(this);
}

class SurgicalCaseDaoManager {
  final _$SurgicalCaseDaoMixin _db;
  SurgicalCaseDaoManager(this._db);
  $$SurgicalCasesTableTableManager get surgicalCases =>
      $$SurgicalCasesTableTableManager(_db.attachedDatabase, _db.surgicalCases);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db.attachedDatabase, _db.patients);
}
