import 'package:flutter/material.dart';

import '../domain/procedure.dart';

class ProcedureSearch extends StatelessWidget {
  final List<ProcedureEntity> procedures;

  final ValueChanged<String> onChanged;

  const ProcedureSearch({
    super.key,

    required this.procedures,

    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Search Procedure",

        prefixIcon: Icon(Icons.search),

        border: OutlineInputBorder(),
      ),

      onChanged: onChanged,
    );
  }
}
