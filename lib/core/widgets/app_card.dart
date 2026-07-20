import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AppCard({super.key, required this.child, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final card = Card(
      margin: EdgeInsets.zero,

      elevation: theme.cardTheme.elevation,

      color: theme.cardTheme.color,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),

        child: child,
      ),
    );

    if (onTap == null) {
      return card;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: onTap,

      child: card,
    );
  }
}
