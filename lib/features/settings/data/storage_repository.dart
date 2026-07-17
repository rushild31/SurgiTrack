import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:surgitrack/features/settings/domain/storage_statistics.dart';

class StorageRepository {
  Future<StorageStatistics> getStatistics() async {
    final directory = await getApplicationDocumentsDirectory();

    int databaseSize = 0;

    if (directory.existsSync()) {
      final files = directory.listSync(recursive: true);

      for (final file in files) {
        if (file is File) {
          databaseSize += await file.length();
        }
      }
    }

    return StorageStatistics(
      databaseSizeBytes: databaseSize,

      attachmentCount: 0,

      attachmentSizeBytes: 0,
    );
  }
}
