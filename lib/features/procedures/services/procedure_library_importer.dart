import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/dao/procedure_dao.dart';
import 'package:surgitrack/core/database/dao/procedure_steps_dao.dart';

import 'package:surgitrack/features/procedures/data/procedure_json_loader.dart';
import 'package:surgitrack/features/procedures/data/procedure_mapper.dart';

class ProcedureLibraryImporter {
  final ProcedureDao procedureDao;
  final ProcedureStepsDao procedureStepsDao;

  const ProcedureLibraryImporter({
    required this.procedureDao,
    required this.procedureStepsDao,
  });

  Future<void> importLibrary() async {
    final files = await ProcedureJsonLoader.loadProcedureFiles();

    for (final file in files) {
      for (final json in file.procedures) {
        //----------------------------------------------------------
        // Skip if already imported
        //----------------------------------------------------------

        final existing = await procedureDao.getProcedureByProcedureId(
          json['id'],
        );

        if (existing != null) {
          continue;
        }

        //----------------------------------------------------------
        // Create ProcedureEntity
        //----------------------------------------------------------

        final entity = ProcedureMapper.fromJson(
          json,
          specialty: file.specialty,
          category: file.category,
        );

        //----------------------------------------------------------
        // Insert Procedure
        //----------------------------------------------------------

        final procedureDbId = await procedureDao.insertProcedure(
          ProcedureMapper.toCompanion(entity),
        );

        //----------------------------------------------------------
        // Insert Technical Steps
        //----------------------------------------------------------

        final technicalSteps = json['technicalSteps'] == null
            ? const <dynamic>[]
            : List<dynamic>.from(json['technicalSteps']);

        final companions = <ProcedureStepsCompanion>[];

        for (var i = 0; i < technicalSteps.length; i++) {
          final step = technicalSteps[i];

          companions.add(
            ProcedureStepsCompanion(
              procedureId: Value(procedureDbId),

              stepId: Value(
                step
                    .toString()
                    .toUpperCase()
                    .replaceAll(' ', '_')
                    .replaceAll('-', '_'),
              ),

              stepName: Value(step.toString()),

              orderIndex: Value(i + 1),
            ),
          );
        }

        if (companions.isNotEmpty) {
          await procedureStepsDao.insertMultipleSteps(companions);
        }
      }
    }
  }
}
