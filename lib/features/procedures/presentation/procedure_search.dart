import 'package:flutter/material.dart';

class ProcedureSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;

  final String initialValue;

  const ProcedureSearchBar({
    super.key,
    required this.onChanged,
    this.initialValue = '',
  });

  @override
  State<ProcedureSearchBar> createState() => _ProcedureSearchBarState();
}

class _ProcedureSearchBarState extends State<ProcedureSearchBar> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      decoration: const InputDecoration(
        hintText: "Search procedures...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),

      onChanged: widget.onChanged,
    );
  }
}
