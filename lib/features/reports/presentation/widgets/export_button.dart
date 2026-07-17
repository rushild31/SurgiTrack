import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  final VoidCallback? onPdfExport;

  final VoidCallback? onExcelExport;

  const ExportButton({super.key, this.onPdfExport, this.onExcelExport});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.file_download),

      onSelected: (value) {
        switch (value) {
          case 'pdf':
            if (onPdfExport != null) {
              onPdfExport!();
            }

            break;

          case 'excel':
            if (onExcelExport != null) {
              onExcelExport!();
            }

            break;
        }
      },

      itemBuilder: (context) => [
        if (onPdfExport != null)
          const PopupMenuItem(
            value: 'pdf',

            child: Row(
              children: [
                Icon(Icons.picture_as_pdf),

                SizedBox(width: 10),

                Text("Export PDF"),
              ],
            ),
          ),

        if (onExcelExport != null)
          const PopupMenuItem(
            value: 'excel',

            child: Row(
              children: [
                Icon(Icons.table_chart),

                SizedBox(width: 10),

                Text("Export Excel"),
              ],
            ),
          ),
      ],
    );
  }
}
