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

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  void _openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports & Portfolio')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          const Text(
            'Surgical Training Portfolio',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 6),

          Text(
            'Review operative exposure, competency progression, '
            'and training milestones.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),

          _sectionTitle('Overview'),

          ReportCard(
            title: 'Portfolio Snapshot',
            description: 'Overall residency exposure and competency summary',
            icon: Icons.dashboard_outlined,
            onTap: () {
              _openPage(context, const PortfolioSnapshotReportPage());
            },
          ),

          _sectionTitle('Operative Records'),

          ReportCard(
            title: 'Monthly Operative Log',
            description:
                'Date-wise patient, procedure and operative role record',
            icon: Icons.table_chart_outlined,
            onTap: () {
              _openPage(context, const MonthlyOperativeLogPage());
            },
          ),

          ReportCard(
            title: 'Surgical Logbook',
            description: 'Complete operative case listing and details',
            icon: Icons.menu_book_outlined,
            onTap: () {
              _openPage(context, const SurgicalLogbookPage());
            },
          ),

          _sectionTitle('Competency Tracking'),

          ReportCard(
            title: 'Procedure Exposure',
            description:
                'Procedure-wise operative experience and role distribution',
            icon: Icons.analytics_outlined,
            onTap: () {
              _openPage(context, const ProcedureExposurePage());
            },
          ),

          ReportCard(
            title: 'Technical Skills',
            description: 'Technical step exposure and skill progression',
            icon: Icons.build_outlined,
            onTap: () {
              _openPage(context, const TechnicalSkillReportPage());
            },
          ),

          _sectionTitle('Training Reports'),

          ReportCard(
            title: 'Training Summary',
            description: 'Periodic residency progress and exposure summary',
            icon: Icons.timeline_outlined,
            onTap: () {
              _openPage(context, const TrainingSummaryReportPage());
            },
          ),
        ],
      ),
    );
  }
}
