import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  final Future<void> Function()? onPdfExport;

  final Future<void> Function()? onExcelExport;

  const ExportButton({super.key, this.onPdfExport, this.onExcelExport});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.download),

      tooltip: "Export Report",

      onSelected: (value) async {
        switch (value) {
          case "pdf":
            if (onPdfExport != null) {
              await onPdfExport!();
            }
            break;

          case "excel":
            if (onExcelExport != null) {
              await onExcelExport!();
            }
            break;
        }
      },

      itemBuilder: (context) {
        return [
          if (onPdfExport != null)
            const PopupMenuItem(
              value: "pdf",
              child: Row(
                children: [
                  Icon(Icons.picture_as_pdf),
                  SizedBox(width: 8),
                  Text("Export PDF"),
                ],
              ),
            ),

          if (onExcelExport != null)
            const PopupMenuItem(
              value: "excel",
              child: Row(
                children: [
                  Icon(Icons.table_chart),
                  SizedBox(width: 8),
                  Text("Export Excel"),
                ],
              ),
            ),
        ];
      },
    );
  }
}
