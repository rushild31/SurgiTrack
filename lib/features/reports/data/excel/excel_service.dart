import 'dart:typed_data';

import 'package:excel/excel.dart';

class ExcelService {
  Future<Uint8List> generateExcel({required Excel workbook}) async {
    final bytes = workbook.encode();

    if (bytes == null) {
      throw Exception('Failed to generate Excel workbook.');
    }

    return Uint8List.fromList(bytes);
  }
}
