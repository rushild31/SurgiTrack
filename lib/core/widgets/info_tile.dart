import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;

  const InfoTile({
    super.key,

    required this.title,

    required this.value,

    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: icon != null ? Icon(icon) : null,

      title: Text(title, style: Theme.of(context).textTheme.bodySmall),

      subtitle: Text(
        value,

        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
