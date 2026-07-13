import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/providers/patient_provider.dart';
import 'package:surgitrack/features/patients/domain/patient.dart';

final patientSearchQueryProvider = StateProvider<String>((ref) {
  return "";
});

final filteredPatientListProvider = Provider<List<Patient>>((ref) {
  final patientsAsync = ref.watch(patientListProvider);
  final query = ref.watch(patientSearchQueryProvider).toLowerCase();

  return patientsAsync.when(
    data: (patients) {
      if (query.isEmpty) {
        return patients;
      }

      return patients.where((patient) {
        return patient.name.toLowerCase().contains(query) ||
            patient.hospitalId.toLowerCase().contains(query) ||
            patient.patientId.toLowerCase().contains(query);
      }).toList();
    },
    loading: () => [],
    error: (_, _) => [],
  );
});
