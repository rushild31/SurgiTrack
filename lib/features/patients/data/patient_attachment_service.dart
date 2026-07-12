import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PatientAttachmentService {
  Future<String> saveFile({
    required File file,
    required int patientId,
    required String fileName,
  }) async {
    final directory = await getApplicationDocumentsDirectory();

    final patientDirectory = Directory(
      path.join(directory.path, "patients", patientId.toString()),
    );

    if (!await patientDirectory.exists()) {
      await patientDirectory.create(recursive: true);
    }

    final extension = path.extension(file.path);

    final savedFile = File(
      path.join(patientDirectory.path, "$fileName$extension"),
    );

    await file.copy(savedFile.path);

    return savedFile.path;
  }

  Future<void> deleteFile(String filePath) async {
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
    }
  }
}
