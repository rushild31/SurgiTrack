// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_attachment_dao.dart';

// ignore_for_file: type=lint
mixin _$CaseAttachmentDaoMixin on DatabaseAccessor<AppDatabase> {
  $CaseAttachmentsTable get caseAttachments => attachedDatabase.caseAttachments;
  CaseAttachmentDaoManager get managers => CaseAttachmentDaoManager(this);
}

class CaseAttachmentDaoManager {
  final _$CaseAttachmentDaoMixin _db;
  CaseAttachmentDaoManager(this._db);
  $$CaseAttachmentsTableTableManager get caseAttachments =>
      $$CaseAttachmentsTableTableManager(
        _db.attachedDatabase,
        _db.caseAttachments,
      );
}
