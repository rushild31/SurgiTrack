import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';

class PdfService {
  Future<void> previewPdf({required Uint8List pdfBytes}) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        return pdfBytes;
      },
    );
  }

  Future<Uint8List> generatePdf({
    required List<pw.Widget> content,

    PdfPageFormat pageFormat = PdfPageFormat.a4,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: pageFormat,

        build: (context) {
          return content;
        },
      ),
    );

    return pdf.save();
  }
}
