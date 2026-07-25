import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

import 'procedure_provider.dart';

final procedureSearchProvider =
    FutureProvider.family<List<ProcedureEntity>, String>((ref, query) async {
      final repository = ref.watch(procedureRepositoryProvider);

      return repository.searchProcedures(query);
    });
