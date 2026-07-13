import 'package:flutter/material.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback? onTap;

  const PatientCard({super.key, required this.patient, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.badge_outlined, size: 18),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      patient.hospitalId.isEmpty
                          ? "No MRD"
                          : patient.hospitalId,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  const Icon(Icons.cake_outlined, size: 18),
                  const SizedBox(width: 6),
                  Text("${patient.age} years"),
                ],
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  const Icon(Icons.bloodtype_outlined, size: 18),
                  const SizedBox(width: 6),
                  Text(patient.bloodGroup ?? "-"),
                ],
              ),

              if (patient.comorbidities.isNotEmpty) ...[
                const SizedBox(height: 12),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: patient.comorbidities
                      .take(3)
                      .map(
                        (c) => Chip(
                          label: Text(c),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      )
                      .toList(),
                ),

                if (patient.comorbidities.length > 3)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "+${patient.comorbidities.length - 3} more",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
