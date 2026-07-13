import 'package:flutter/material.dart';

class ProcedureCategoryChip extends StatelessWidget {
  final String category;

  const ProcedureCategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(category), visualDensity: VisualDensity.compact);
  }
}
