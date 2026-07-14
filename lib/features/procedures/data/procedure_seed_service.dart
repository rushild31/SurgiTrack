import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

class ProcedureSeedService {
  static Future<void> seedProcedures(AppDatabase database) async {
    final existing = await database.procedureDao.getAllProcedures();

    if (existing.isNotEmpty) {
      return;
    }

    final manifestString = await rootBundle.loadString(
      'assets/procedures/procedure_manifest.json',
    );

    final List<dynamic> files = jsonDecode(manifestString);

    final Map<String, int> insertedIds = {};

    for (final file in files) {
      final jsonString = await rootBundle.loadString('assets/procedures/$file');

      final Map<String, dynamic> data = jsonDecode(jsonString);

      final String category = data['category'] ?? 'Unknown';

      final String specialty = data['specialty'] ?? _mapSpecialty(category);

      final String subcategory = data['subcategory'] ?? '';

      int categoryId;

      if (insertedIds.containsKey(category)) {
        categoryId = insertedIds[category]!;
      } else {
        categoryId = await database.procedureDao.insertProcedure(
          ProceduresCompanion(
            procedureId: Value(_generateId(category)),
            name: Value(category),
            category: Value(category),
            specialty: Value(specialty),
            nodeType: const Value("category"),
            aliases: const Value("[]"),
          ),
        );

        insertedIds[category] = categoryId;
      }

      int? subcategoryId;

      if (subcategory.isNotEmpty) {
        if (insertedIds.containsKey(subcategory)) {
          subcategoryId = insertedIds[subcategory];
        } else {
          subcategoryId = await database.procedureDao.insertProcedure(
            ProceduresCompanion(
              procedureId: Value(_generateId(subcategory)),
              name: Value(subcategory),
              category: Value(category),
              specialty: Value(specialty),
              parentId: Value(categoryId),
              nodeType: const Value("subcategory"),
              aliases: const Value("[]"),
            ),
          );

          insertedIds[subcategory] = subcategoryId;
        }
      }

      final List<dynamic> procedures = data['procedures'] ?? [];

      for (final item in procedures) {
        final String id = item['id'];

        if (insertedIds.containsKey(id)) {
          continue;
        }

        final aliases = <String>[
          if (item['shortName'] != null) item['shortName'],

          ...List<String>.from(item['aliases'] ?? []),

          id,
        ];

        final insertedId = await database.procedureDao.insertProcedure(
          ProceduresCompanion(
            procedureId: Value(id),

            name: Value(item['name']),

            shortName: Value(item['shortName']),

            category: Value(category),

            specialty: Value(specialty),

            parentId: Value(subcategoryId ?? categoryId),

            nodeType: const Value("procedure"),

            description: Value(item['description']),

            template: Value(item['template']),

            aliases: Value(jsonEncode(aliases.toSet().toList())),

            dynamicFields: Value(jsonEncode(item['dynamicFields'] ?? [])),

            technicalSteps: Value(jsonEncode(item['technicalSteps'] ?? [])),

            associatedProcedures: Value(
              jsonEncode(item['associatedProcedures'] ?? []),
            ),

            supportsCPB: Value(item['supportsCPB'] ?? false),

            supportsRedo: Value(item['supportsRedo'] ?? false),

            supportsEmergency: Value(item['supportsEmergency'] ?? false),

            supportsTechnicalSteps: Value(
              item['supportsTechnicalSteps'] ?? false,
            ),

            supportsAssociatedProcedures: Value(
              item['supportsAssociatedProcedures'] ?? false,
            ),
          ),
        );

        insertedIds[id] = insertedId;
      }
    }
  }

  static String _mapSpecialty(String category) {
    final value = category.toLowerCase();

    if (value.contains('thoracic')) {
      return 'Thoracic';
    }

    if (value.contains('vascular')) {
      return 'Vascular';
    }

    if (value.contains('congenital')) {
      return 'Congenital';
    }

    return 'Cardiac';
  }

  static String _generateId(String value) {
    return value
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z0-9]+'), '_')
        .replaceAll(RegExp(r'_+$'), '');
  }
}
