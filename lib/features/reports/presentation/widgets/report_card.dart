import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;

  final String description;

  final IconData icon;

  final VoidCallback? onTap;

  const ReportCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text(description),

        trailing: const Icon(Icons.chevron_right),

        onTap: onTap,
      ),
    );
  }
}
