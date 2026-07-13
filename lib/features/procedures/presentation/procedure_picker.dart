import 'package:flutter/material.dart';

import '../domain/procedure.dart';
import '../domain/procedure_selection.dart';

class ProcedurePicker extends StatefulWidget {
  final List<ProcedureEntity> procedures;

  final ProcedureSelection? initialSelection;

  final ValueChanged<ProcedureSelection> onChanged;

  const ProcedurePicker({
    super.key,

    required this.procedures,

    required this.onChanged,

    this.initialSelection,
  });

  @override
  State<ProcedurePicker> createState() => _ProcedurePickerState();
}

class _ProcedurePickerState extends State<ProcedurePicker> {
  ProcedureEntity? primaryProcedure;

  final List<ProcedureEntity> associatedProcedures = [];

  String searchQuery = "";

  @override
  void initState() {
    super.initState();

    primaryProcedure = widget.initialSelection?.primaryProcedure;

    associatedProcedures.addAll(
      widget.initialSelection?.associatedProcedures ?? [],
    );
  }

  List<ProcedureEntity> get filteredProcedures {
    if (searchQuery.isEmpty) {
      return widget.procedures;
    }

    final query = searchQuery.toLowerCase();

    return widget.procedures.where((procedure) {
      return procedure.name.toLowerCase().contains(query) ||
          procedure.category.toLowerCase().contains(query) ||
          procedure.specialty.toLowerCase().contains(query);
    }).toList();
  }

  void updateSelection() {
    widget.onChanged(
      ProcedureSelection(
        primaryProcedure: primaryProcedure,

        associatedProcedures: List.unmodifiable(associatedProcedures),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: "Search Procedure",

            prefixIcon: Icon(Icons.search),
          ),

          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        ),

        const SizedBox(height: 16),

        const Text(
          "Primary Procedure",

          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        if (primaryProcedure != null)
          ListTile(
            leading: const Icon(Icons.check_circle),

            title: Text(primaryProcedure!.name),

            trailing: IconButton(
              icon: const Icon(Icons.close),

              onPressed: () {
                setState(() {
                  primaryProcedure = null;

                  updateSelection();
                });
              },
            ),
          ),

        ...filteredProcedures.map((procedure) {
          final selected = primaryProcedure?.id == procedure.id;

          return ListTile(
            leading: Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
            ),

            title: Text(procedure.name),

            subtitle: Text("${procedure.category} • ${procedure.specialty}"),

            selected: selected,

            onTap: () {
              setState(() {
                primaryProcedure = procedure;

                updateSelection();
              });
            },
          );
        }),

        const Divider(),

        const Text(
          "Associated Procedures",

          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        ...filteredProcedures.map((procedure) {
          if (procedure.id == primaryProcedure?.id) {
            return const SizedBox();
          }

          final selected = associatedProcedures.any(
            (item) => item.id == procedure.id,
          );

          return CheckboxListTile(
            value: selected,

            title: Text(procedure.name),

            subtitle: Text(procedure.category),

            onChanged: (value) {
              setState(() {
                if (value == true) {
                  associatedProcedures.add(procedure);
                } else {
                  associatedProcedures.removeWhere(
                    (item) => item.id == procedure.id,
                  );
                }

                updateSelection();
              });
            },
          );
        }),
      ],
    );
  }
}
