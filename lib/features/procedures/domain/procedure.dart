class ProcedureEntity {
  final int? id;

  final String procedureId;

  final String name;

  final String specialty;

  final String category;

  final int? parentId;

  final List<String> aliases;

  final String? description;

  final bool isActive;

  final DateTime createdAt;

  const ProcedureEntity({
    this.id,

    required this.procedureId,

    required this.name,

    required this.specialty,

    required this.category,

    this.parentId,

    this.aliases = const [],

    this.description,

    this.isActive = true,

    required this.createdAt,
  });
}
