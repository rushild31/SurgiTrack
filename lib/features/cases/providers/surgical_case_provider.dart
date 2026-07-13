import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/cases/data/repository/surgical_case_repository.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';

final surgicalCaseRepositoryProvider = Provider<SurgicalCaseRepository>((ref) {
  final database = ref.watch(databaseProvider);

  return SurgicalCaseRepository(database);
});

final surgicalCaseListProvider = StreamProvider<List<SurgicalCase>>((ref) {
  final repository = ref.watch(surgicalCaseRepositoryProvider);

  return repository.watchCases();
});

final surgicalCaseByIdProvider = FutureProvider.family<SurgicalCase?, int>((
  ref,
  id,
) async {
  final repository = ref.watch(surgicalCaseRepositoryProvider);

  return repository.getCaseById(id);
});
