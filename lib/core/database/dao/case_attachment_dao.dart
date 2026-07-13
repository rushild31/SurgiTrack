import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/case_attachments.dart';

part 'case_attachment_dao.g.dart';

@DriftAccessor(tables: [CaseAttachments])
class CaseAttachmentDao extends DatabaseAccessor<AppDatabase>
    with _$CaseAttachmentDaoMixin {
  CaseAttachmentDao(super.db);

  Future<int> insertAttachment(CaseAttachmentsCompanion attachment) {
    return into(caseAttachments).insert(attachment);
  }

  Stream<List<CaseAttachment>> watchAttachmentsForCase(int caseId) {
    return (select(caseAttachments)
          ..where((tbl) => tbl.caseId.equals(caseId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .watch();
  }

  Future<List<CaseAttachment>> getAttachmentsForCase(int caseId) {
    return (select(
      caseAttachments,
    )..where((tbl) => tbl.caseId.equals(caseId))).get();
  }

  Future<int> deleteAttachment(int id) {
    return (delete(caseAttachments)..where((tbl) => tbl.id.equals(id))).go();
  }
}
