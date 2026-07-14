import 'dart:convert';

import 'package:flutter/services.dart';

class ProcedureJsonLoader {
  static Future<List<Map<String, dynamic>>> loadProcedures() async {
    final manifestString = await rootBundle.loadString(
      'assets/procedures/procedure_manifest.json',
    );

    final List<dynamic> files = jsonDecode(manifestString);

    final List<Map<String, dynamic>> result = [];

    for (final file in files) {
      final jsonString = await rootBundle.loadString('assets/procedures/$file');

      final data = jsonDecode(jsonString);

      result.addAll(List<Map<String, dynamic>>.from(data['procedures'] ?? []));
    }

    return result;
  }
}
