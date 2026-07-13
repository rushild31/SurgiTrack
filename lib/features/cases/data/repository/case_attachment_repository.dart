import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/features/cases/data/case_attachment_service.dart';

class CaseAttachmentRepository {
  final AppDatabase database;

  CaseAttachmentRepository(this.database);

  Stream<List<CaseAttachment>> watchAttachments(int caseId) {
    return database.caseAttachmentDao.watchAttachmentsForCase(caseId);
  }

  Future<void> addAttachment({
    required int caseId,
    required String displayName,
    required String filePath,
    required String fileType,
  }) async {
    await database.caseAttachmentDao.insertAttachment(
      CaseAttachmentsCompanion(
        caseId: Value(caseId),
        displayName: Value(displayName),
        filePath: Value(filePath),
        fileType: Value(fileType),
        createdAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteAttachment(CaseAttachment attachment) async {
    await CaseAttachmentService().deleteFile(attachment.filePath);

    await database.caseAttachmentDao.deleteAttachment(attachment.id);
  }
}
