import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class BackupRepository {
  Future<File> createBackup() async {
    final directory = await getTemporaryDirectory();

    final backupData = {
      "application": "SurgiTrack",
      "version": "MVP",
      "backupDate": DateTime.now().toIso8601String(),
      "type": "local_export",
      "status": "placeholder_backup",
    };

    final json = const JsonEncoder.withIndent("  ").convert(backupData);

    final file = File(
      "${directory.path}/SurgiTrack_Backup_${DateTime.now().millisecondsSinceEpoch}.json",
    );

    await file.writeAsString(json);

    return file;
  }
}
