import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/procedures/domain/procedure_tree_node.dart';

class ProcedureTreeBuilder {
  static List<ProcedureTreeNode> build(List<ProcedureEntity> procedures) {
    final nodes = <int, ProcedureTreeNode>{};

    for (final procedure in procedures) {
      nodes[procedure.id!] = ProcedureTreeNode(
        procedure: procedure,
        children: [],
      );
    }

    final roots = <ProcedureTreeNode>[];

    for (final procedure in procedures) {
      final node = nodes[procedure.id!]!;

      if (procedure.parentId == null) {
        roots.add(node);
      } else {
        final parent = nodes[procedure.parentId];

        if (parent != null) {
          parent.children.add(node);
        }
      }
    }

    return roots;
  }
}
