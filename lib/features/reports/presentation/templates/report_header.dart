import 'package:flutter/material.dart';

class ReportHeader extends StatelessWidget {
  final String title;

  final String? subtitle;

  const ReportHeader({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,

          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),

            child: Text(subtitle!, style: const TextStyle(fontSize: 14)),
          ),

        const Divider(),
      ],
    );
  }
}
