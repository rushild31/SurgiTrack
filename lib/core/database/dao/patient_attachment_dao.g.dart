// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_attachment_dao.dart';

// ignore_for_file: type=lint
mixin _$PatientAttachmentDaoMixin on DatabaseAccessor<AppDatabase> {
  $PatientAttachmentsTable get patientAttachments =>
      attachedDatabase.patientAttachments;
  PatientAttachmentDaoManager get managers => PatientAttachmentDaoManager(this);
}

class PatientAttachmentDaoManager {
  final _$PatientAttachmentDaoMixin _db;
  PatientAttachmentDaoManager(this._db);
  $$PatientAttachmentsTableTableManager get patientAttachments =>
      $$PatientAttachmentsTableTableManager(
        _db.attachedDatabase,
        _db.patientAttachments,
      );
}
