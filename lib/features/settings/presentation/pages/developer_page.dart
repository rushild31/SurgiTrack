import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Developer")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "SurgiTrack Development Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          _infoCard(
            title: "Application",
            rows: [
              "Name: SurgiTrack",
              "Purpose: Surgical Training Portfolio & Logbook",
              "Architecture: Flutter + Drift Database",
            ],
          ),

          const SizedBox(height: 16),

          _infoCard(
            title: "Database",
            rows: [
              "Local Database: Enabled",
              "Backup System: Planned",
              "Cloud Sync: Supabase Integration Planned",
            ],
          ),

          const SizedBox(height: 16),

          _infoCard(
            title: "Development Tools",
            rows: [
              "Framework: Flutter",
              "State Management: Riverpod",
              "Database Layer: Drift ORM",
            ],
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(Icons.build),
              title: const Text("Maintenance Tools"),
              subtitle: const Text(
                "Future tools for diagnostics, database repair and migration management",
              ),
              trailing: const Icon(Icons.lock_outline),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({required String title, required List<String> rows}) {
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

            const SizedBox(height: 10),

            ...rows.map(
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),

                child: Text(row),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
