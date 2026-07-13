import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/procedures/data/procedure_mapper.dart';

import 'package:surgitrack/features/procedures/data/procedure_seed_data.dart';

class ProcedureSeeder {
  static Future<void> seed(AppDatabase database) async {
    final existing = await database.procedureDao.getAllProcedures();

    if (existing.isNotEmpty) {
      return;
    }

    for (final procedure in ProcedureSeedData.procedures) {
      await database.procedureDao.insertProcedure(
        ProcedureMapper.toCompanion(procedure),
      );
    }
  }
}
