import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import '../data/procedure_repository.dart';
import '../domain/procedure.dart';

final procedureRepositoryProvider = Provider<ProcedureRepository>((ref) {
  final db = ref.watch(databaseProvider);

  return ProcedureRepository(db);
});

/// Live procedure library stream
final procedureListProvider = StreamProvider<List<ProcedureEntity>>((ref) {
  return ref.watch(procedureRepositoryProvider).watchProcedures();
});

/// Fetch single procedure
final procedureByIdProvider = FutureProvider.family<ProcedureEntity?, int>((
  ref,
  id,
) {
  return ref.watch(procedureRepositoryProvider).getProcedureById(id);
});

/// Add procedure
final addProcedureProvider = Provider((ref) {
  return (ProcedureEntity procedure) async {
    await ref.read(procedureRepositoryProvider).addProcedure(procedure);
  };
});

/// Update procedure
final updateProcedureProvider = Provider((ref) {
  return (ProcedureEntity procedure) async {
    await ref.read(procedureRepositoryProvider).updateProcedure(procedure);
  };
});

/// Delete procedure
final deleteProcedureProvider = Provider((ref) {
  return (int id) async {
    await ref.read(procedureRepositoryProvider).deleteProcedure(id);
  };
});
