import 'package:pdf/widgets.dart' as pw;

import 'package:surgitrack/features/reports/domain/portfolio_snapshot_data.dart';

class PortfolioSnapshotPdfGenerator {
  List<pw.Widget> build(PortfolioSnapshotData data) {
    return [
      pw.Text(
        "Portfolio Snapshot Report",
        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
      ),

      pw.SizedBox(height: 20),

      pw.TableHelper.fromTextArray(
        headers: ["Metric", "Count"],

        data: [
          ["Total Cases", data.totalCases.toString()],

          ["Total Patients", data.totalPatients.toString()],

          ["Total Procedures", data.totalProcedures.toString()],

          ["Cardiac Cases", data.cardiacCases.toString()],

          ["Thoracic Cases", data.thoracicCases.toString()],

          ["Vascular Cases", data.vascularCases.toString()],

          ["Independent", data.independentCases.toString()],

          ["Supervised", data.supervisedCases.toString()],

          ["Assisted", data.assistedCases.toString()],

          ["Observed", data.observedCases.toString()],
        ],
      ),
    ];
  }
}
