import 'package:flutter/material.dart';

import 'package:surgitrack/features/procedures/domain/procedure_tree_node.dart';

class ProcedureTreeTile extends StatelessWidget {
  final ProcedureTreeNode node;

  final VoidCallback? onTap;

  const ProcedureTreeTile({super.key, required this.node, this.onTap});

  @override
  Widget build(BuildContext context) {
    final procedure = node.procedure;

    if (node.hasChildren) {
      return ExpansionTile(
        leading: const Icon(Icons.folder_outlined),

        title: Text(procedure.name),

        children: node.children
            .map(
              (child) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ProcedureTreeTile(node: child, onTap: onTap),
              ),
            )
            .toList(),
      );
    }

    return ListTile(
      leading: const Icon(Icons.medical_services_outlined),

      title: Text(procedure.name),

      subtitle: Text(procedure.procedureId),

      onTap: onTap,
    );
  }
}
