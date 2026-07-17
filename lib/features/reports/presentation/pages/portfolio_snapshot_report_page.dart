import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/data/export/export_repository.dart';
import 'package:surgitrack/features/reports/domain/portfolio_snapshot_data.dart';

class PortfolioSnapshotReportPage extends ConsumerWidget {
  const PortfolioSnapshotReportPage({super.key});

  Future<void> exportExcel(
    BuildContext context,
    PortfolioSnapshotData data,
  ) async {
    final repository = ExportRepository();

    final bytes = await repository.exportPortfolioSnapshot(data);

    debugPrint("Portfolio Snapshot Excel generated: ${bytes.length} bytes");

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Portfolio Snapshot Excel generated")),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
      Placeholder data for MVP wiring.

      Later this will come from:
      - AnalyticsRepository
      - Dashboard statistics
      - ReportRepository

      No database change required.
    */

    const snapshot = PortfolioSnapshotData(
      totalCases: 0,
      totalPatients: 0,
      totalProcedures: 0,
      cardiacCases: 0,
      thoracicCases: 0,
      vascularCases: 0,
      independentCases: 0,
      supervisedCases: 0,
      assistedCases: 0,
      observedCases: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio Snapshot"),

        actions: [
          IconButton(
            icon: const Icon(Icons.table_chart),
            onPressed: () => exportExcel(context, snapshot),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Training Portfolio Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          SnapshotCard(
            title: "Total Exposure",
            rows: [
              SnapshotRow(label: "Cases", value: snapshot.totalCases),
              SnapshotRow(label: "Patients", value: snapshot.totalPatients),
              SnapshotRow(label: "Procedures", value: snapshot.totalProcedures),
            ],
          ),

          const SizedBox(height: 16),

          SnapshotCard(
            title: "Specialty Distribution",
            rows: [
              SnapshotRow(label: "Cardiac", value: snapshot.cardiacCases),
              SnapshotRow(label: "Thoracic", value: snapshot.thoracicCases),
              SnapshotRow(label: "Vascular", value: snapshot.vascularCases),
            ],
          ),

          const SizedBox(height: 16),

          SnapshotCard(
            title: "Operative Role Distribution",
            rows: [
              SnapshotRow(
                label: "Independent",
                value: snapshot.independentCases,
              ),
              SnapshotRow(label: "Supervised", value: snapshot.supervisedCases),
              SnapshotRow(label: "Assisted", value: snapshot.assistedCases),
              SnapshotRow(label: "Observed", value: snapshot.observedCases),
            ],
          ),
        ],
      ),
    );
  }
}

class SnapshotCard extends StatelessWidget {
  final String title;
  final List<SnapshotRow> rows;

  const SnapshotCard({super.key, required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ...rows.map(
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [Text(row.label), Text(row.value.toString())],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnapshotRow {
  final String label;
  final int value;

  const SnapshotRow({required this.label, required this.value});
}
