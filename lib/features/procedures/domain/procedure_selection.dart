import 'procedure.dart';

class ProcedureSelection {
  final ProcedureEntity? primaryProcedure;

  final List<ProcedureEntity> associatedProcedures;

  const ProcedureSelection({
    this.primaryProcedure,

    this.associatedProcedures = const [],
  });
}
