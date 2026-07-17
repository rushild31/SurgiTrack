import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/profile/data/surgeon_profile_repository.dart';
import 'package:surgitrack/features/profile/domain/surgeon_profile.dart';

final surgeonProfileRepositoryProvider = Provider<SurgeonProfileRepository>((
  ref,
) {
  final database = ref.watch(databaseProvider);

  return SurgeonProfileRepository(database.surgeonProfileDao);
});

final surgeonProfileProvider = FutureProvider<SurgeonProfile?>((ref) async {
  final repository = ref.watch(surgeonProfileRepositoryProvider);

  return repository.getProfile();
});
