import 'package:flutter/material.dart';

import 'package:surgitrack/features/cases/domain/surgical_case_list_item.dart';

class CaseListRow extends StatelessWidget {
  final SurgicalCaseListItem surgicalCase;
  final VoidCallback onTap;

  const CaseListRow({
    super.key,
    required this.surgicalCase,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

      child: InkWell(
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(12),

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

                  _specialtyChip(context, surgicalCase.specialty),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                surgicalCase.patientName,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 4),

              Text(
                surgicalCase.diagnosis,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 14),

                  const SizedBox(width: 5),

                  Text(_formatDate(surgicalCase.surgeryDate)),

                  const Spacer(),

                  Text(
                    surgicalCase.operativeRole,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specialtyChip(BuildContext context, String specialty) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),

      child: Text(specialty, style: const TextStyle(fontSize: 12)),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
