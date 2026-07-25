import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/procedures/data/procedure_repository.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

final procedureRepositoryProvider = Provider<ProcedureRepository>((ref) {
  final database = ref.watch(databaseProvider);

  return ProcedureRepository(database);
});

final procedureListProvider = FutureProvider<List<ProcedureEntity>>((
  ref,
) async {
  final repository = ref.watch(procedureRepositoryProvider);

  return repository.getProcedures();
});

final procedureByIdProvider = FutureProvider.family<ProcedureEntity?, int>((
  ref,
  id,
) async {
  final repository = ref.watch(procedureRepositoryProvider);

  return repository.getProcedureById(id);
});

final procedureStepsProvider =
    FutureProvider.family<List<ProcedureStepData>, int>((
      ref,
      procedureId,
    ) async {
      final database = ref.watch(databaseProvider);

      return database.procedureStepsDao.getStepsForProcedure(procedureId);
    });
