class CaseProcedure {
  final int? id;

  final int caseId;

  final int procedureId;

  final String type;

  final DateTime createdAt;

  const CaseProcedure({
    this.id,

    required this.caseId,

    required this.procedureId,

    this.type = "PRIMARY",

    required this.createdAt,
  });

  bool get isPrimary => type == "PRIMARY";
}
