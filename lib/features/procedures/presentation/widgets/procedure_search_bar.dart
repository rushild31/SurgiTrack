import 'package:flutter/material.dart';

class ProcedureSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  final String initialValue;

  const ProcedureSearchBar({
    super.key,
    required this.onChanged,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: initialValue),

      decoration: const InputDecoration(
        hintText: "Search procedures...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),

      onChanged: onChanged,
    );
  }
}
