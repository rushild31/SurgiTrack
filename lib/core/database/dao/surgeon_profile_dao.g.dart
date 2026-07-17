// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surgeon_profile_dao.dart';

// ignore_for_file: type=lint
mixin _$SurgeonProfileDaoMixin on DatabaseAccessor<AppDatabase> {
  $SurgeonProfileTable get surgeonProfile => attachedDatabase.surgeonProfile;
  SurgeonProfileDaoManager get managers => SurgeonProfileDaoManager(this);
}

class SurgeonProfileDaoManager {
  final _$SurgeonProfileDaoMixin _db;
  SurgeonProfileDaoManager(this._db);
  $$SurgeonProfileTableTableManager get surgeonProfile =>
      $$SurgeonProfileTableTableManager(
        _db.attachedDatabase,
        _db.surgeonProfile,
      );
}
