import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/data/storage_repository.dart';
import 'package:surgitrack/features/settings/domain/storage_statistics.dart';

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return StorageRepository();
});

final storageStatisticsProvider = FutureProvider<StorageStatistics>((
  ref,
) async {
  final repository = ref.read(storageRepositoryProvider);

  return repository.getStatistics();
});
