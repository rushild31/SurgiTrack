import 'package:flutter/material.dart';

import '../widgets/report_card.dart';

class ReportsOverviewPage extends StatelessWidget {
  const ReportsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reports & Export")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Generate portfolio reports",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          ReportCard(
            title: "Surgical Logbook",

            description: "Complete operative case listing",

            icon: Icons.menu_book,
          ),

          ReportCard(
            title: "Procedure Exposure",

            description: "Procedure-wise operative experience",

            icon: Icons.analytics,
          ),

          ReportCard(
            title: "Technical Skills",

            description: "Technical step exposure",

            icon: Icons.build,
          ),

          ReportCard(
            title: "Training Summary",

            description: "Monthly and residency progress",

            icon: Icons.timeline,
          ),
        ],
      ),
    );
  }
}
