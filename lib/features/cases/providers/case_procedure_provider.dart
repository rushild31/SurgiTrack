import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/core/database/dao/case_procedure_dao.dart';

final caseProceduresProvider =
    FutureProvider.family<List<CaseProcedureWithProcedure>, int>((
      ref,
      caseId,
    ) async {
      final database = ref.watch(databaseProvider);

      return database.caseProcedureDao.getProceduresForCase(caseId);
    });
