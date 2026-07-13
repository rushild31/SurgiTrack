import 'package:flutter/material.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

class ProcedureSelector extends StatelessWidget {
  final List<ProcedureEntity> procedures;

  final ProcedureEntity? selected;

  final ValueChanged<ProcedureEntity?> onChanged;

  const ProcedureSelector({
    super.key,
    required this.procedures,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ProcedureEntity>(
      initialValue: selected,

      isExpanded: true,

      decoration: const InputDecoration(
        labelText: "Primary Procedure",
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
  }
}
