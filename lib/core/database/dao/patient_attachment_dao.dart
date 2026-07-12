import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/patient_attachments.dart';

part 'patient_attachment_dao.g.dart';

@DriftAccessor(tables: [PatientAttachments])
class PatientAttachmentDao extends DatabaseAccessor<AppDatabase>
    with _$PatientAttachmentDaoMixin {
  PatientAttachmentDao(super.db);

  Stream<List<PatientAttachmentData>> watchAttachments(int patientId) {
    return (select(patientAttachments)
          ..where((tbl) => tbl.patientId.equals(patientId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .watch();
  }

  Future<int> insertAttachment(PatientAttachmentsCompanion attachment) {
    return into(patientAttachments).insert(attachment);
  }

  Future<int> deleteAttachment(int id) {
    return (delete(patientAttachments)..where((tbl) => tbl.id.equals(id))).go();
  }
}
