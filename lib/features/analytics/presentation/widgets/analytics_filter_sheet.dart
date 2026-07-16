import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/analytics_filter_provider.dart';

class AnalyticsFilterSheet extends ConsumerWidget {
  const AnalyticsFilterSheet({super.key});

  Widget _dropdown({
    required BuildContext context,
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: [
        const DropdownMenuItem(value: null, child: Text('All')),

        ...items.map((e) => DropdownMenuItem(value: e, child: Text(e))),
      ],
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(analyticsFilterProvider);

    final notifier = ref.read(analyticsFilterProvider.notifier);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),

      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Analytics Filters',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _dropdown(
              context: context,
              label: 'Approach',
              value: filter.approach,
              items: ['Open', 'Hybrid', 'MIS', 'Robotic'],
              onChanged: notifier.setApproach,
            ),

            const SizedBox(height: 16),

            _dropdown(
              context: context,
              label: 'Case Type',
              value: filter.caseType,
              items: ['Primary', 'Redo'],
              onChanged: notifier.setCaseType,
            ),

            const SizedBox(height: 16),

            _dropdown(
              context: context,
              label: 'Urgency',
              value: filter.urgency,
              items: ['Elective', 'Emergency'],
              onChanged: notifier.setUrgency,
            ),

            const SizedBox(height: 16),

            _dropdown(
              context: context,
              label: 'Complexity',
              value: filter.complexity,
              items: ['Single', 'Dual', 'Complex'],
              onChanged: notifier.setComplexity,
            ),

            const SizedBox(height: 16),

            _dropdown(
              context: context,
              label: 'Operative Role',
              value: filter.operativeRole,
              items: [
                'Observed',
                'Assisted',
                'Performed Under Supervision',
                'Performed Independently',
              ],
              onChanged: notifier.setOperativeRole,
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),

            TextButton(
              onPressed: () {
                notifier.clear();
              },
              child: const Text('Clear Filters'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
