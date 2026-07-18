import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';
import 'package:surgitrack/features/cases/domain/surgical_case_list_item.dart';

final caseLogbookProvider = StreamProvider<List<SurgicalCaseListItem>>((ref) {
  final database = ref.watch(databaseProvider);

  return database.surgicalCaseDao.watchCaseLogbook();
});
