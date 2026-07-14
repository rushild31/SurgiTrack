import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/procedures/domain/procedure_selection.dart';

import 'package:surgitrack/features/procedures/providers/procedure_provider.dart';

import 'procedure_picker.dart';

class ProcedurePickerScreen extends ConsumerStatefulWidget {
  final ProcedureSelection? initialSelection;

  final ValueChanged<ProcedureSelection>? onChanged;

  const ProcedurePickerScreen({
    super.key,
    this.initialSelection,
    this.onChanged,
  });

  @override
  ConsumerState<ProcedurePickerScreen> createState() =>
      _ProcedurePickerScreenState();
}

class _ProcedurePickerScreenState extends ConsumerState<ProcedurePickerScreen> {
  ProcedureSelection selection = const ProcedureSelection();

  @override
  void initState() {
    super.initState();

    selection = widget.initialSelection ?? const ProcedureSelection();
  }

  @override
  Widget build(BuildContext context) {
    final proceduresAsync = ref.watch(procedureListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Select Procedure")),

      body: proceduresAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (procedures) {
          return Padding(
            padding: const EdgeInsets.all(16),

            child: ProcedurePicker(
              procedures: procedures,

              initialSelection: selection,

              onChanged: (value) {
                setState(() {
                  selection = value;
                });

                widget.onChanged?.call(value);
              },
            ),
          );
        },
      ),
    );
  }
}
