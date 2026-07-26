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
      if (query.isNotEmpty)
        IconButton(
          tooltip: 'Clear search',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    final searchTerm = query.trim();

    if (searchTerm.isEmpty) {
      return const Center(
        child: Text('Search patients by name or hospital ID'),
      );
    }

    ref.read(patientSearchQueryProvider.notifier).state = searchTerm;

    final patients = ref.watch(filteredPatientListProvider);

    if (patients.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No matching patients found',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: patients.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final patient = patients[index];

        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person_outline)),

          title: Text(
            patient.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          subtitle: Text(
            patient.hospitalId.trim().isEmpty
                ? 'No hospital ID / MRD'
                : patient.hospitalId,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          trailing: const Icon(Icons.chevron_right),

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
