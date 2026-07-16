import 'package:flutter/material.dart';

import 'analytics_filter_sheet.dart';

class AnalyticsFilterButton extends StatelessWidget {
  const AnalyticsFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_alt),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return const AnalyticsFilterSheet();
          },
        );
      },
    );
  }
}
