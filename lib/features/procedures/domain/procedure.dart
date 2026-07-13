class ProcedureEntity {
  final int? id;

  final String name;

  final String category;

  final String specialty;

  final bool isActive;

  final DateTime createdAt;

  const ProcedureEntity({
    this.id,
    required this.name,
    required this.category,
    required this.specialty,
    required this.isActive,
    required this.createdAt,
  });
}
