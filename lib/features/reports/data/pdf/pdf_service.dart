import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfService {
  Future<Uint8List> generatePdf({
    required List<pw.Widget> content,
    String? title,
  }) async {
    final pdf = pw.Document(
      title: title ?? "SurgiTrack Report",
      author: "SurgiTrack",
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => content,
      ),
    );

    return pdf.save();
  }

  Future<void> previewPdf({required Uint8List pdfBytes}) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        return pdfBytes;
      },
    );
  }
}
