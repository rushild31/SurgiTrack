class StorageStatistics {
  final int databaseSizeBytes;

  final int attachmentCount;

  final int attachmentSizeBytes;

  final DateTime? lastBackup;

  const StorageStatistics({
    required this.databaseSizeBytes,

    required this.attachmentCount,

    required this.attachmentSizeBytes,

    this.lastBackup,
  });

  String get databaseSizeFormatted {
    return _formatBytes(databaseSizeBytes);
  }

  String get attachmentSizeFormatted {
    return _formatBytes(attachmentSizeBytes);
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) {
      return "$bytes B";
    }

    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(1)} KB";
    }

    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  }
}
