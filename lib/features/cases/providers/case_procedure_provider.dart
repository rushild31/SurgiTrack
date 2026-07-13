import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import '../data/repository/case_procedure_repository.dart';

final caseProcedureRepositoryProvider = Provider<CaseProcedureRepository>((
  ref,
) {
  final database = ref.watch(databaseProvider);

  return CaseProcedureRepository(database);
});

final caseProceduresProvider = FutureProvider.family((ref, int caseId) async {
  final repository = ref.watch(caseProcedureRepositoryProvider);

  return repository.getProceduresForCase(caseId);
});
