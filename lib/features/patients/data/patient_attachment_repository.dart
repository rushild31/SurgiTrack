import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/features/patients/data/patient_attachment_service.dart';

class PatientAttachmentRepository {
  final AppDatabase db;

  PatientAttachmentRepository(this.db);

  Stream<List<PatientAttachmentData>> watchAttachments(int patientId) {
    return db.patientAttachmentDao.watchAttachments(patientId);
  }

  Future<void> addAttachment(PatientAttachmentsCompanion attachment) async {
    await db.patientAttachmentDao.insertAttachment(attachment);
  }

  Future<void> deleteAttachment(PatientAttachmentData attachment) async {
    await PatientAttachmentService().deleteFile(attachment.filePath);

    await db.patientAttachmentDao.deleteAttachment(attachment.id);
  }
}
