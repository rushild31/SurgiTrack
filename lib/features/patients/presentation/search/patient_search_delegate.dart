import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/providers/patient_search_provider.dart';
import 'package:surgitrack/features/patients/presentation/patient_details_screen.dart';

class PatientSearchDelegate extends SearchDelegate {
  final WidgetRef ref;

  PatientSearchDelegate(this.ref);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ref.read(patientSearchQueryProvider.notifier).state = query;

    final patients = ref.watch(filteredPatientListProvider);

    return _results(context, patients);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ref.read(patientSearchQueryProvider.notifier).state = query;

    final patients = ref.watch(filteredPatientListProvider);

    return _results(context, patients);
  }

  Widget _results(BuildContext context, List patients) {
    if (patients.isEmpty) {
      return const Center(child: Text("No patients found"));
    }

    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];

        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(patient.name),
          subtitle: Text(
            patient.hospitalId.isEmpty ? "No MRD" : patient.hospitalId,
          ),
          onTap: () {
            close(context, null);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PatientDetailsScreen(patient: patient),
              ),
            );
          },
        );
      },
    );
  }
}
