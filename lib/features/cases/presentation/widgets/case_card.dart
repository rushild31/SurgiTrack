import 'package:flutter/material.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';

class CaseCard extends StatelessWidget {
  final SurgicalCase surgicalCase;

  final VoidCallback? onTap;

  const CaseCard({super.key, required this.surgicalCase, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(12),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    surgicalCase.caseId,

                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(surgicalCase.specialty),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                surgicalCase.diagnosis,

                maxLines: 2,

                overflow: TextOverflow.ellipsis,

                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),

                  const SizedBox(width: 6),

                  Text(
                    "${surgicalCase.surgeryDate.day}/"
                    "${surgicalCase.surgeryDate.month}/"
                    "${surgicalCase.surgeryDate.year}",
                  ),

                  const Spacer(),

                  Chip(label: Text(surgicalCase.operativeRole)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
