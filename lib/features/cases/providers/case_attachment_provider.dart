import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/cases/data/repository/case_attachment_repository.dart';

final caseAttachmentRepositoryProvider = Provider<CaseAttachmentRepository>((
  ref,
) {
  final database = ref.watch(databaseProvider);

  return CaseAttachmentRepository(database);
});

final caseAttachmentsProvider =
    StreamProvider.family<List<CaseAttachment>, int>((ref, caseId) {
      final repository = ref.watch(caseAttachmentRepositoryProvider);

      return repository.watchAttachments(caseId);
    });
