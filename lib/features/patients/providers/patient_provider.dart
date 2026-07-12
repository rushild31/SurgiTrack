import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/features/patients/data/patient_repository.dart';
import 'package:surgitrack/features/patients/domain/patient.dart';

final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(AppDatabase());
});

final patientListProvider = FutureProvider<List<Patient>>((ref) async {
  final repository = ref.watch(patientRepositoryProvider);

  return repository.getPatients();
});
