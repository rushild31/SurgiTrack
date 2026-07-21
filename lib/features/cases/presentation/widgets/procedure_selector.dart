import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/procedures/providers/procedure_provider.dart';

class ProcedureSelector extends ConsumerWidget {
  final ProcedureEntity? selected;

  final ValueChanged<ProcedureEntity?> onChanged;

  const ProcedureSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proceduresAsync = ref.watch(procedureListProvider);

    return proceduresAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(12),
        child: Center(child: CircularProgressIndicator()),
      ),

      error: (error, stack) => Text("Unable to load procedures"),

      data: (procedures) {
        return DropdownButtonFormField<ProcedureEntity>(
          initialValue: selected,

          isExpanded: true,

          decoration: const InputDecoration(
            labelText: "Select Procedure",
            border: OutlineInputBorder(),
          ),

          items: procedures.map((procedure) {
            return DropdownMenuItem<ProcedureEntity>(
              value: procedure,
              child: Text(procedure.name, overflow: TextOverflow.ellipsis),
            );
          }).toList(),

          onChanged: onChanged,
        );
      },
    );
  }
}
