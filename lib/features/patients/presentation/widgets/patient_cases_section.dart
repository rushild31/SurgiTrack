import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/providers/patient_case_provider.dart';

class PatientCasesSection extends ConsumerWidget {
  final int patientId;

  const PatientCasesSection({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cases = ref.watch(patientCasesProvider(patientId));

    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Surgical Cases",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            if (cases.isEmpty)
              const Text("No surgical cases recorded")
            else
              ...cases.map((surgicalCase) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,

                  leading: const Icon(Icons.local_hospital_outlined),

                  title: Text(surgicalCase.diagnosis),

                  subtitle: Text(
                    "${surgicalCase.specialty} • "
                    "${surgicalCase.surgeryType} • "
                    "${surgicalCase.operativeRole}",
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
