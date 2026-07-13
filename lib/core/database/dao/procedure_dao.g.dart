// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_dao.dart';

// ignore_for_file: type=lint
mixin _$ProcedureDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProceduresTable get procedures => attachedDatabase.procedures;
  ProcedureDaoManager get managers => ProcedureDaoManager(this);
}

class ProcedureDaoManager {
  final _$ProcedureDaoMixin _db;
  ProcedureDaoManager(this._db);
  $$ProceduresTableTableManager get procedures =>
      $$ProceduresTableTableManager(_db.attachedDatabase, _db.procedures);
}
