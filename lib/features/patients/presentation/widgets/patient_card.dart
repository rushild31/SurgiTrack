import 'package:flutter/material.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback? onTap;

  const PatientCard({super.key, required this.patient, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(radius: 22, child: Icon(Icons.person)),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text(
                          "${patient.age} years",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),

              const SizedBox(height: 16),

              /// MRD
              Row(
                children: [
                  const Icon(Icons.badge_outlined, size: 18),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      patient.hospitalId.isEmpty
                          ? "MRD not available"
                          : "MRD: ${patient.hospitalId}",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Blood Group
              Row(
                children: [
                  const Icon(Icons.bloodtype_outlined, size: 18),

                  const SizedBox(width: 8),

                  Text(
                    patient.bloodGroup == null
                        ? "Blood Group: -"
                        : "Blood Group: ${patient.bloodGroup}",
                  ),
                ],
              ),

              if (patient.comorbidities.isNotEmpty) ...[
                const SizedBox(height: 16),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: patient.comorbidities
                      .take(4)
                      .map(
                        (item) => Chip(
                          label: Text(item),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      )
                      .toList(),
                ),

                if (patient.comorbidities.length > 4)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      "+${patient.comorbidities.length - 4} more",
                      style: theme.textTheme.bodySmall,
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
