// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_procedure_steps_dao.dart';

// ignore_for_file: type=lint
mixin _$CaseProcedureStepsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CaseProcedureStepsTable get caseProcedureSteps =>
      attachedDatabase.caseProcedureSteps;
  $ProcedureStepsTable get procedureSteps => attachedDatabase.procedureSteps;
  $ProceduresTable get procedures => attachedDatabase.procedures;
  CaseProcedureStepsDaoManager get managers =>
      CaseProcedureStepsDaoManager(this);
}

class CaseProcedureStepsDaoManager {
  final _$CaseProcedureStepsDaoMixin _db;
  CaseProcedureStepsDaoManager(this._db);
  $$CaseProcedureStepsTableTableManager get caseProcedureSteps =>
      $$CaseProcedureStepsTableTableManager(
        _db.attachedDatabase,
        _db.caseProcedureSteps,
      );
  $$ProcedureStepsTableTableManager get procedureSteps =>
      $$ProcedureStepsTableTableManager(
        _db.attachedDatabase,
        _db.procedureSteps,
      );
  $$ProceduresTableTableManager get procedures =>
      $$ProceduresTableTableManager(_db.attachedDatabase, _db.procedures);
}
