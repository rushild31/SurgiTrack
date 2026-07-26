import 'package:drift/drift.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/core/database/tables/surgeon_profile.dart';

part 'surgeon_profile_dao.g.dart';

@DriftAccessor(tables: [SurgeonProfile])
class SurgeonProfileDao extends DatabaseAccessor<AppDatabase>
    with _$SurgeonProfileDaoMixin {
  SurgeonProfileDao(super.db);

  /// Returns the single surgeon profile.
  ///
  /// SurgiTrack is a personal surgical training portfolio,
  /// therefore only one profile should exist locally.
  Future<SurgeonProfileData?> getProfile() {
    return (select(surgeonProfile)..limit(1)).getSingleOrNull();
  }

  /// Creates the profile if one does not exist.
  ///
  /// Otherwise updates the existing profile only.
  Future<int> saveProfile(SurgeonProfileCompanion profile) async {
    final existing = await getProfile();

    if (existing == null) {
      return into(surgeonProfile).insert(profile);
    }

    await (update(
      surgeonProfile,
    )..where((tbl) => tbl.id.equals(existing.id))).write(profile);

    return existing.id;
  }

  /// Deletes the local surgeon profile.
  Future<void> deleteProfile() async {
    await delete(surgeonProfile).go();
  }
}
