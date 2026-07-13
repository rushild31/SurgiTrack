import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class CaseAttachmentService {
  Future<String> saveFile({
    required File file,
    required int caseId,
    required String fileName,
  }) async {
    final directory = await getApplicationDocumentsDirectory();

    final caseDirectory = Directory(
      path.join(directory.path, "cases", caseId.toString()),
    );

    if (!await caseDirectory.exists()) {
      await caseDirectory.create(recursive: true);
    }

    final extension = path.extension(file.path);

    final savedFile = File(
      path.join(caseDirectory.path, "$fileName$extension"),
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
