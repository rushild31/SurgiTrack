import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

final patientCasesProvider = Provider.family<List<SurgicalCase>, int>((
  ref,
  patientId,
) {
  final casesAsync = ref.watch(surgicalCaseListProvider);

  return casesAsync.when(
    data: (cases) {
      return cases
          .where((surgicalCase) => surgicalCase.patientId == patientId)
          .toList();
    },
    loading: () => [],
    error: (_, _) => [],
  );
});
