import 'dart:convert';

import 'package:flutter/services.dart';

class ProcedureAssetLoader {
  static Future<List<Map<String, dynamic>>> loadFile(String path) async {
    final jsonString = await rootBundle.loadString('assets/procedures/$path');

    final jsonData = jsonDecode(jsonString);

    return List<Map<String, dynamic>>.from(jsonData['procedures']);
  }
}
