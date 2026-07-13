import 'package:flutter/material.dart';

class EmptyPatientState extends StatelessWidget {
  const EmptyPatientState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.people_outline, size: 64),

            const SizedBox(height: 16),

            Text(
              "No patients added yet",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 8),

            Text(
              "Add your first patient to start building your surgical portfolio.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
