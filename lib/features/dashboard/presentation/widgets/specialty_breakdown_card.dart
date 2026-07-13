import 'package:flutter/material.dart';

class SpecialtyBreakdownCard extends StatelessWidget {
  final int cardiac;
  final int thoracic;
  final int vascular;

  const SpecialtyBreakdownCard({
    super.key,
    required this.cardiac,
    required this.thoracic,
    required this.vascular,
  });

  Widget _row(String title, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Specialty Distribution",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            _row("Cardiac", cardiac),
            _row("Thoracic", thoracic),
            _row("Vascular", vascular),
          ],
        ),
      ),
    );
  }
}
