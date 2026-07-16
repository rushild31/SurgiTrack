import 'package:flutter/material.dart';

class ReportSectionTitle extends StatelessWidget {
  final String title;

  const ReportSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),

      child: Text(
        title,

        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
