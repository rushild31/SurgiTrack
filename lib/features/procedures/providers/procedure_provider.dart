import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/procedures/data/procedure_repository.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

final procedureRepositoryProvider = Provider<ProcedureRepository>((ref) {
  return ProcedureRepository(ref.watch(databaseProvider));
});

//
// Complete procedure library stream
//
final procedureListProvider = StreamProvider<List<ProcedureEntity>>((ref) {
  return ref.watch(procedureRepositoryProvider).watchProcedures();
});

//
// Root level procedures
//
final rootProcedureProvider = FutureProvider<List<ProcedureEntity>>((
  ref,
) async {
  return ref.watch(procedureRepositoryProvider).getRootProcedures();
});

//
// Child procedures
//
final childProcedureProvider =
    FutureProvider.family<List<ProcedureEntity>, int>((ref, parentId) async {
      return ref
          .watch(procedureRepositoryProvider)
          .getChildProcedures(parentId);
    });

//
// Single procedure lookup
//
final procedureByIdProvider = FutureProvider.family<ProcedureEntity?, int>((
  ref,
  id,
) async {
  return ref.watch(procedureRepositoryProvider).getProcedureById(id);
});

//
// Lookup by stable procedure id
//
// Examples:
// CABG
// BENTALL_PROCEDURE
// MIDCAB
//
final procedureByProcedureIdProvider =
    FutureProvider.family<ProcedureEntity?, String>((ref, procedureId) async {
      return ref
          .watch(procedureRepositoryProvider)
          .getProcedureByProcedureId(procedureId);
    });

//
// Search procedures
//
final procedureSearchProvider =
    FutureProvider.family<List<ProcedureEntity>, String>((ref, query) async {
      final repository = ref.watch(procedureRepositoryProvider);

      if (query.trim().isEmpty) {
        return repository.getProcedures();
      }

      return repository.searchProcedures(query.trim());
    });
