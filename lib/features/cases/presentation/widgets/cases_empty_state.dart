import 'package:flutter/material.dart';

class CasesEmptyState extends StatelessWidget {
  const CasesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          const Icon(Icons.medical_services_outlined, size: 60),

          const SizedBox(height: 16),

          Text(
            "No surgical cases logged yet",

            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          const Text("Start building your surgical portfolio"),
        ],
      ),
    );
  }
}
