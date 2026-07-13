import 'package:flutter/material.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

class ProcedureTile extends StatelessWidget {
  final ProcedureEntity procedure;

  final VoidCallback? onTap;

  const ProcedureTile({super.key, required this.procedure, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),

      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          child: Text(procedure.name.substring(0, 1).toUpperCase()),
        ),

        title: Text(
          procedure.name,

          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 4),

            Text(procedure.category),

            Text(
              procedure.specialty,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),

        trailing: procedure.isActive
            ? const Icon(Icons.check_circle_outline)
            : const Icon(Icons.block),
      ),
    );
  }
}
