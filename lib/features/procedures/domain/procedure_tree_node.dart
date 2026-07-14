import 'procedure.dart';

class ProcedureTreeNode {
  final ProcedureEntity procedure;

  final List<ProcedureTreeNode> children;

  ProcedureTreeNode({
    required this.procedure,
    List<ProcedureTreeNode>? children,
  }) : children = children ?? [];

  bool get hasChildren => children.isNotEmpty;
}
