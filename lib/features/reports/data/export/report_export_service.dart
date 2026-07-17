import 'package:flutter/foundation.dart';

import 'package:share_plus/share_plus.dart';

import 'package:universal_html/html.dart' as html;

import 'package:path_provider/path_provider.dart';

import 'dart:io';

class ReportExportService {
  static Future<void> exportPdf({
    required Uint8List bytes,
    required String fileName,
  }) async {
    await _exportFile(
      bytes: bytes,
      fileName: fileName,
      mimeType: "application/pdf",
    );
  }

  static Future<void> exportExcel({
    required Uint8List bytes,
    required String fileName,
  }) async {
    await _exportFile(
      bytes: bytes,
      fileName: fileName,
      mimeType:
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    );
  }

  static Future<void> _exportFile({
    required Uint8List bytes,
    required String fileName,
    required String mimeType,
  }) async {
    // =====================================================
    // WEB
    // =====================================================

    if (kIsWeb) {
      final blob = html.Blob([bytes], mimeType);

      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();

      html.Url.revokeObjectUrl(url);

      return;
    }

    // =====================================================
    // MOBILE / DESKTOP
    // =====================================================

    final directory = await getTemporaryDirectory();

    final file = File("${directory.path}/$fileName");

    await file.writeAsBytes(bytes);

    await Share.shareXFiles([XFile(file.path, mimeType: mimeType)]);
  }
}
