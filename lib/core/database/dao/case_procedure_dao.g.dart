// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_procedure_dao.dart';

// ignore_for_file: type=lint
mixin _$CaseProcedureDaoMixin on DatabaseAccessor<AppDatabase> {
  $CaseProceduresTable get caseProcedures => attachedDatabase.caseProcedures;
  $ProceduresTable get procedures => attachedDatabase.procedures;
  CaseProcedureDaoManager get managers => CaseProcedureDaoManager(this);
}

class CaseProcedureDaoManager {
  final _$CaseProcedureDaoMixin _db;
  CaseProcedureDaoManager(this._db);
  $$CaseProceduresTableTableManager get caseProcedures =>
      $$CaseProceduresTableTableManager(
        _db.attachedDatabase,
        _db.caseProcedures,
      );
  $$ProceduresTableTableManager get procedures =>
      $$ProceduresTableTableManager(_db.attachedDatabase, _db.procedures);
}
