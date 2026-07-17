import 'package:surgitrack/core/database/dao/surgeon_profile_dao.dart';

import '../domain/surgeon_profile.dart';
import 'surgeon_profile_mapper.dart';

class SurgeonProfileRepository {
  final SurgeonProfileDao dao;

  SurgeonProfileRepository(this.dao);

  Future<SurgeonProfile?> getProfile() async {
    final data = await dao.getProfile();

    if (data == null) {
      return null;
    }

    return SurgeonProfileMapper.fromData(data);
  }

  Future<void> saveProfile(SurgeonProfile profile) async {
    final companion = SurgeonProfileMapper.toCompanion(profile);

    await dao.saveProfile(companion);
  }

  Future<void> deleteProfile() async {
    await dao.deleteProfile();
  }
}
