import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/surgeon_profile.dart';

part 'surgeon_profile_dao.g.dart';

@DriftAccessor(tables: [SurgeonProfile])
class SurgeonProfileDao extends DatabaseAccessor<AppDatabase>
    with _$SurgeonProfileDaoMixin {
  SurgeonProfileDao(super.db);

  Future<SurgeonProfileData?> getProfile() {
    return (select(surgeonProfile)..limit(1)).getSingleOrNull();
  }

  Future<int> saveProfile(SurgeonProfileCompanion profile) async {
    final existing = await getProfile();

    if (existing == null) {
      return into(surgeonProfile).insert(profile);
    }

    return update(surgeonProfile).write(profile);
  }

  Future<void> deleteProfile() async {
    await delete(surgeonProfile).go();
  }
}
