import 'package:flutter/material.dart';

class CasesEmptyState extends StatelessWidget {
  const CasesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            const Icon(Icons.medical_services_outlined, size: 70),

            const SizedBox(height: 20),

            Text(
              "No surgical cases logged yet",

              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),

              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            const Text(
              "Cases are added from an individual patient profile.\n\n"
              "Open a patient → Add Case → Select procedure",

              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
