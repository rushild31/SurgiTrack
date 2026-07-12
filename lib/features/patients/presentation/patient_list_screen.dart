import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/providers/patient_provider.dart';
import 'package:surgitrack/features/patients/presentation/patient_form_screen.dart';

class PatientDetailsScreen extends ConsumerWidget {
  final Patient patient;

  const PatientDetailsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient.name),

        actions: [
          IconButton(
            icon: const Icon(Icons.edit),

            onPressed: () async {
              final updated = await Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => PatientFormScreen(patient: patient),
                ),
              );

              if (updated == true) {
                ref.invalidate(patientListProvider);
              }
            },
          ),

          IconButton(
            icon: const Icon(Icons.delete),

            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,

                builder: (context) => AlertDialog(
                  title: const Text("Delete Patient"),

                  content: const Text(
                    "This will permanently remove this patient record.",
                  ),

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

              await ref
                  .read(patientRepositoryProvider)
                  .deletePatient(patient.id!);

              ref.invalidate(patientListProvider);

              if (context.mounted) {
                Navigator.pop(context, true);
              }
            },
          ),
        ],
      ),

      body: _PatientInformation(patient: patient),
    );
  }
}

class _PatientInformation extends StatelessWidget {
  final Patient patient;

  const _PatientInformation({required this.patient});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: [
        _section("Basic Details", [
          _row("MRD", patient.hospitalId),

          _row("Age", "${patient.age} years"),

          _row(
            "DOB",
            "${patient.dateOfBirth.day}-${patient.dateOfBirth.month}-${patient.dateOfBirth.year}",
          ),

          _row("Blood Group", patient.bloodGroup ?? "-"),
        ]),

        _section("Clinical Profile", [
          _row(
            "EF",
            patient.ejectionFraction == null
                ? "-"
                : "${patient.ejectionFraction}%",
          ),

          _row("Address", patient.address ?? "-"),

          _row(
            "Admission",
            patient.admissionDate == null
                ? "-"
                : "${patient.admissionDate!.day}-${patient.admissionDate!.month}-${patient.admissionDate!.year}",
          ),
        ]),

        _section("Comorbidities", [
          Wrap(
            spacing: 8,

            children: patient.comorbidities
                .map((e) => Chip(label: Text(e)))
                .toList(),
          ),
        ]),

        _section("Past Operative History", [
          Text(
            patient.pastOperativeHistory?.isNotEmpty == true
                ? patient.pastOperativeHistory!
                : "No previous history",
          ),
        ]),
      ],
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ...children,
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        children: [
          SizedBox(
            width: 120,

            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
