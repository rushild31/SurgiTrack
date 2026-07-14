class ProcedureEntity {
  final int? id;

  /// Database identifier
  final String procedureId;

  /// Category / Subcategory / Procedure
  final String nodeType;

  final String name;

  final String? shortName;

  final String specialty;

  final String category;

  final int? parentId;

  final List<String> aliases;

  final String? description;

  final String? template;

  final bool supportsCPB;

  final bool supportsRedo;

  final bool supportsEmergency;

  final bool supportsTechnicalSteps;

  final bool supportsAssociatedProcedures;

  final List<String> dynamicFields;

  final List<String> technicalSteps;

  final List<String> associatedProcedures;

  final bool isActive;

  final DateTime createdAt;

  const ProcedureEntity({
    this.id,

    required this.procedureId,

    this.nodeType = 'procedure',

    required this.name,

    this.shortName,

    required this.specialty,

    required this.category,

    this.parentId,

    this.aliases = const [],

    this.description,

    this.template,

    this.supportsCPB = false,

    this.supportsRedo = false,

    this.supportsEmergency = false,

    this.supportsTechnicalSteps = false,

    this.supportsAssociatedProcedures = false,

    this.dynamicFields = const [],

    this.technicalSteps = const [],

    this.associatedProcedures = const [],

    this.isActive = true,

    required this.createdAt,
  });
}
