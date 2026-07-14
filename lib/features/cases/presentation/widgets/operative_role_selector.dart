import 'package:flutter/material.dart';

import 'package:surgitrack/core/enums/surgeon_role.dart';

class OperativeRoleSelector extends StatelessWidget {
  final SurgeonRole value;

  final ValueChanged<SurgeonRole> onChanged;

  const OperativeRoleSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SurgeonRole>(
      initialValue: value,

      decoration: const InputDecoration(labelText: "Operative Role"),

      items: SurgeonRole.values.map((role) {
        return DropdownMenuItem(value: role, child: Text(role.label));
      }).toList(),

      onChanged: (selected) {
        if (selected != null) {
          onChanged(selected);
        }
      },
    );
  }
}
