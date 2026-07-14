class CaseProcedure {
  final int? id;

  final int caseId;

  final int procedureId;

  final String type;

  const CaseProcedure({
    this.id,

    required this.caseId,

    required this.procedureId,

    this.type = "PRIMARY",
  });

  bool get isPrimary => type == "PRIMARY";

  bool get isAssociated => type == "ASSOCIATED";

  bool get isConcomitant => type == "CONCOMITANT";

  bool get isStaged => type == "STAGED";
}
