import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/core/database/dao/case_procedure_steps_dao.dart';

import 'package:surgitrack/features/cases/data/repository/case_procedure_steps_repository.dart';

final caseProcedureStepsRepositoryProvider =
    Provider<CaseProcedureStepsRepository>((ref) {
      final database = ref.watch(databaseProvider);

      return CaseProcedureStepsRepository(database);
    });

final caseProcedureStepsProvider =
    FutureProvider.family<List<CaseProcedureStepWithDetails>, int>((
      ref,
      caseProcedureId,
    ) async {
      final database = ref.watch(databaseProvider);

      return database.caseProcedureStepsDao.getStepsForCaseProcedure(
        caseProcedureId,
      );
    });

final watchCaseProcedureStepsProvider =
    StreamProvider.family<List<CaseProcedureStepWithDetails>, int>((
      ref,
      caseProcedureId,
    ) {
      final database = ref.watch(databaseProvider);

      return database.caseProcedureStepsDao.watchStepsForCaseProcedure(
        caseProcedureId,
      );
    });
