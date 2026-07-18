import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final bool requiredField;
  final int? maxLines;
  final bool enabled;

  const AppTextField({
    super.key,

    required this.controller,

    required this.label,

    this.hint,

    this.keyboardType,

    this.requiredField = false,

    this.maxLines = 1,

    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      enabled: enabled,

      keyboardType: keyboardType,

      maxLines: maxLines,

      decoration: InputDecoration(
        labelText: label,

        hintText: hint,

        border: const OutlineInputBorder(),
      ),

      validator: requiredField
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return "$label is required";
              }

              return null;
            }
          : null,
    );
  }
}
