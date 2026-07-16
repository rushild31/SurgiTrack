import 'dart:convert';

import 'package:flutter/services.dart';

class ProcedureJsonFile {
  final String specialty;

  final String category;

  final List<Map<String, dynamic>> procedures;

  const ProcedureJsonFile({
    required this.specialty,
    required this.category,
    required this.procedures,
  });
}

class ProcedureJsonLoader {
  static Future<List<ProcedureJsonFile>> loadProcedureFiles() async {
    final manifestString = await rootBundle.loadString(
      'assets/procedures/procedure_manifest.json',
    );

    final List<dynamic> files = jsonDecode(manifestString);

    final result = <ProcedureJsonFile>[];

    for (final file in files) {
      final jsonString = await rootBundle.loadString('assets/procedures/$file');

      final Map<String, dynamic> data = jsonDecode(jsonString);

      result.add(
        ProcedureJsonFile(
          specialty: data['category'] ?? '',
          category: data['subcategory'] ?? '',
          procedures: List<Map<String, dynamic>>.from(data['procedures'] ?? []),
        ),
      );
    }

    return result;
  }
}
