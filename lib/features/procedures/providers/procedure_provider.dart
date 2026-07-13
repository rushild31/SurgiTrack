import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/procedures/data/procedure_repository.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

final procedureRepositoryProvider = Provider<ProcedureRepository>((ref) {
  return ProcedureRepository(ref.watch(databaseProvider));
});

final procedureListProvider = StreamProvider<List<ProcedureEntity>>((ref) {
  return ref.watch(procedureRepositoryProvider).watchProcedures();
});

final procedureByIdProvider = FutureProvider.family<ProcedureEntity?, int>((
  ref,
  id,
) async {
  return ref.watch(procedureRepositoryProvider).getProcedureById(id);
});

final procedureSearchProvider =
    FutureProvider.family<List<ProcedureEntity>, String>((ref, query) async {
      if (query.trim().isEmpty) {
        return [];
      }

      return ref.watch(procedureRepositoryProvider).searchProcedures(query);
    });
