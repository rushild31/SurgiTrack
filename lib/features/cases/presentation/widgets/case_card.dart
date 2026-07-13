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

                  Text(
                    surgicalCase.specialty,

                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                surgicalCase.diagnosis,

                maxLines: 2,

                overflow: TextOverflow.ellipsis,

                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 16),

                  const SizedBox(width: 6),

                  Text(_date(surgicalCase.surgeryDate)),

                  const Spacer(),

                  Chip(label: Text(surgicalCase.operativeRole)),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  _smallInfo(context, surgicalCase.surgeryType),

                  if (surgicalCase.outcome.isNotEmpty) const SizedBox(width: 8),

                  if (surgicalCase.outcome.isNotEmpty)
                    _smallInfo(context, surgicalCase.outcome),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _smallInfo(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),

        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),

      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  String _date(DateTime date) {
    return "${date.day}/"
        "${date.month}/"
        "${date.year}";
  }
}
