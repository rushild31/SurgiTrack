import 'package:flutter/material.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

class ProcedureCard extends StatelessWidget {
  final ProcedureEntity procedure;

  final VoidCallback? onTap;

  const ProcedureCard({super.key, required this.procedure, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),

      child: InkWell(
        borderRadius: BorderRadius.circular(12),

        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(procedure.name.substring(0, 1).toUpperCase()),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      procedure.name,

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Icon(
                    procedure.isActive
                        ? Icons.check_circle_outline
                        : Icons.block,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                procedure.category,

                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 4),

              Text(
                procedure.specialty,

                style: Theme.of(context).textTheme.bodySmall,
              ),

              if (procedure.description != null &&
                  procedure.description!.isNotEmpty) ...[
                const SizedBox(height: 12),

                Text(
                  procedure.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
