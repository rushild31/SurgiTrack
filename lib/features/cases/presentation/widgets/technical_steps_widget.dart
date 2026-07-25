import 'package:flutter/material.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/enums/surgeon_role.dart';

class TechnicalStepsWidget extends StatelessWidget {
  final List<ProcedureStepData> steps;

  final Map<int, SurgeonRole> selectedRoles;

  final ValueChanged<Map<int, SurgeonRole>> onChanged;

  const TechnicalStepsWidget({
    super.key,
    required this.steps,
    required this.selectedRoles,
    required this.onChanged,
  });

  void _setRoleForAll(SurgeonRole role) {
    final updated = <int, SurgeonRole>{for (final step in steps) step.id: role};

    onChanged(updated);
  }

  void _setRole(int stepId, SurgeonRole role) {
    final updated = Map<int, SurgeonRole>.from(selectedRoles);

    updated[stepId] = role;

    onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('No technical steps available for this procedure.'),
      );
    }

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Select all steps as',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),

                PopupMenuButton<SurgeonRole>(
                  tooltip: 'Apply role to all steps',
                  onSelected: _setRoleForAll,
                  itemBuilder: (context) {
                    return SurgeonRole.values.map((role) {
                      return PopupMenuItem<SurgeonRole>(
                        value: role,
                        child: Text(role.label),
                      );
                    }).toList();
                  },
                  child: const Chip(
                    label: Text('Apply to all'),
                    avatar: Icon(Icons.done_all),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        ...steps.map((step) {
          final selectedRole = selectedRoles[step.id];

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${step.orderIndex}. ${step.stepName}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 8),

                  DropdownButtonFormField<SurgeonRole>(
                    initialValue: selectedRole,

                    decoration: const InputDecoration(
                      labelText: 'Operative Role',
                      border: OutlineInputBorder(),
                    ),

                    items: SurgeonRole.values.map((role) {
                      return DropdownMenuItem<SurgeonRole>(
                        value: role,
                        child: Text(role.label),
                      );
                    }).toList(),

                    onChanged: (role) {
                      if (role == null) {
                        return;
                      }

                      _setRole(step.id, role);
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
