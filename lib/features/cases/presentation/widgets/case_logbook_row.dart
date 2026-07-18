import 'package:flutter/material.dart';

import 'package:surgitrack/features/cases/domain/surgical_case_list_item.dart';

class CaseLogbookRow extends StatelessWidget {
  final SurgicalCaseListItem item;

  final VoidCallback? onTap;

  const CaseLogbookRow({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: Text(
                item.caseId,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    item.patientName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),

                  Text(
                    item.hospitalId,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Text(
                item.diagnosis,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(width: 80, child: _specialtyChip(context, item.specialty)),

            SizedBox(
              width: 90,
              child: Text(
                _date(item.surgeryDate),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ),

            SizedBox(
              width: 110,
              child: Text(
                item.operativeRole,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _specialtyChip(BuildContext context, String specialty) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),

        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),

      child: Text(
        specialty,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 11),
      ),
    );
  }

  String _date(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
