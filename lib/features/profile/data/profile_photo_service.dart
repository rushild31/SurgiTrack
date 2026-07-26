import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ProfilePhotoService {
  static const String _fileName = 'surgeon_profile_photo.jpg';

  Future<String> saveProfilePhoto(File sourceFile) async {
    final directory = await getApplicationDocumentsDirectory();

    final profilePhotoDirectory = Directory('${directory.path}/profile');

    if (!await profilePhotoDirectory.exists()) {
      await profilePhotoDirectory.create(recursive: true);
    }

    final destinationPath = '${profilePhotoDirectory.path}/$_fileName';

    final destinationFile = File(destinationPath);

    await sourceFile.copy(destinationFile.path);

    return destinationFile.path;
  }

  Future<void> deleteProfilePhoto(String? path) async {
    if (path == null || path.isEmpty) {
      return;
    }

    final file = File(path);

    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<bool> photoExists(String? path) async {
    if (path == null || path.isEmpty) {
      return false;
    }

    return File(path).exists();
  }
}
