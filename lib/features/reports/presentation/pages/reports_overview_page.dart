import 'package:flutter/material.dart';

import 'package:surgitrack/features/reports/presentation/widgets/report_card.dart';

import 'package:surgitrack/features/reports/presentation/pages/surgical_logbook_page.dart';
import 'package:surgitrack/features/reports/presentation/pages/procedure_exposure_page.dart';
import 'package:surgitrack/features/reports/presentation/pages/technical_skill_report_page.dart';
import 'package:surgitrack/features/reports/presentation/pages/training_summary_report_page.dart';
import 'package:surgitrack/features/reports/presentation/pages/monthly_operative_log_page.dart';
import 'package:surgitrack/features/reports/presentation/pages/portfolio_snapshot_report_page.dart';

class ReportsOverviewPage extends StatelessWidget {
  const ReportsOverviewPage({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),

      child: Text(
        title,

        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reports & Portfolio")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Surgical Training Portfolio",

            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          const Text(
            "Track operative exposure, competency progression and training milestones",
          ),

          sectionTitle("Overview"),

          ReportCard(
            title: "Portfolio Snapshot",

            description: "Overall residency exposure and competency summary",

            icon: Icons.dashboard_outlined,

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const PortfolioSnapshotReportPage(),
                ),
              );
            },
          ),

          sectionTitle("Operative Records"),

          ReportCard(
            title: "Monthly Operative Log",

            description:
                "Date-wise patient, procedure and operative role record",

            icon: Icons.table_chart_outlined,

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const MonthlyOperativeLogPage(),
                ),
              );
            },
          ),

          ReportCard(
            title: "Surgical Logbook",

            description: "Complete operative case listing and details",

            icon: Icons.menu_book_outlined,

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(builder: (_) => const SurgicalLogbookPage()),
              );
            },
          ),

          sectionTitle("Competency Tracking"),

          ReportCard(
            title: "Procedure Exposure",

            description:
                "Procedure-wise operative experience and role distribution",

            icon: Icons.analytics_outlined,

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const ProcedureExposurePage(),
                ),
              );
            },
          ),

          ReportCard(
            title: "Technical Skills",

            description: "Technical step exposure and skill progression",

            icon: Icons.build_outlined,

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const TechnicalSkillReportPage(),
                ),
              );
            },
          ),

          sectionTitle("Training Reports"),

          ReportCard(
            title: "Training Summary",

            description: "Periodic residency progress and exposure summary",

            icon: Icons.timeline_outlined,

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const TrainingSummaryReportPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
