import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/database/database_provider.dart';
import 'package:surgitrack/features/patients/data/patient_repository.dart';
import 'package:surgitrack/features/patients/domain/patient.dart';

final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(ref.watch(databaseProvider));
});

final patientListProvider = StreamProvider<List<Patient>>((ref) {
  return ref.watch(patientRepositoryProvider).watchPatients();
});

final patientByIdProvider = FutureProvider.family<Patient?, int>((
  ref,
  patientId,
) async {
  return ref.watch(patientRepositoryProvider).getPatientById(patientId);
});
