// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_steps_dao.dart';

// ignore_for_file: type=lint
mixin _$ProcedureStepsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProcedureStepsTable get procedureSteps => attachedDatabase.procedureSteps;
  ProcedureStepsDaoManager get managers => ProcedureStepsDaoManager(this);
}

class ProcedureStepsDaoManager {
  final _$ProcedureStepsDaoMixin _db;
  ProcedureStepsDaoManager(this._db);
  $$ProcedureStepsTableTableManager get procedureSteps =>
      $$ProcedureStepsTableTableManager(
        _db.attachedDatabase,
        _db.procedureSteps,
      );
}
