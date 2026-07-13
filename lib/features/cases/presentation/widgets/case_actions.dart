import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';

import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

class CaseActions {
  static Future<void> deleteCase(
    BuildContext context,
    WidgetRef ref,
    SurgicalCase surgicalCase,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,

      builder: (_) => AlertDialog(
        title: const Text("Delete Case"),

        content: const Text("This will permanently remove this surgical case."),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),

            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),

            child: const Text("Delete"),
          ),
        ],
      ),
    );

    if (confirm != true) {
      return;
    }

    await ref.read(surgicalCaseRepositoryProvider).deleteCase(surgicalCase.id!);

    ref.invalidate(surgicalCaseListProvider);

    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
