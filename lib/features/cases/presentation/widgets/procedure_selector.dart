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
      loading: () => const CircularProgressIndicator(),

      error: (error, stack) => Text(error.toString()),

      data: (procedures) {
        return DropdownButtonFormField<ProcedureEntity>(
          initialValue: selected,

          decoration: const InputDecoration(labelText: "Procedure"),

          items: procedures.map((procedure) {
            return DropdownMenuItem<ProcedureEntity>(
              value: procedure,

              child: Text(procedure.name),
            );
          }).toList(),

          onChanged: onChanged,
        );
      },
    );
  }
}
