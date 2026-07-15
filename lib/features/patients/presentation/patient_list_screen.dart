import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/providers/patient_provider.dart';

import 'package:surgitrack/features/patients/presentation/patient_details_screen.dart';
import 'package:surgitrack/features/patients/presentation/patient_form_screen.dart';

import 'package:surgitrack/features/patients/presentation/widgets/patient_card.dart';
import 'package:surgitrack/features/patients/presentation/widgets/empty_patient_state.dart';

import 'package:surgitrack/features/patients/presentation/search/patient_search_delegate.dart';

import 'package:surgitrack/features/cases/presentation/screens/add_case_screen.dart';

class PatientListScreen extends ConsumerWidget {
  final bool selectionMode;

  const PatientListScreen({super.key, this.selectionMode = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsAsync = ref.watch(patientListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectionMode ? "Select Patient" : "Patients"),

        actions: [
          if (!selectionMode)
            IconButton(
              icon: const Icon(Icons.search),

              onPressed: () {
                showSearch(
                  context: context,
                  delegate: PatientSearchDelegate(ref),
                );
              },
            ),
        ],
      ),

      body: patientsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (patients) {
          if (patients.isEmpty) {
            return const EmptyPatientState();
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(patientListProvider);
            },

            child: ListView.builder(
              padding: const EdgeInsets.all(12),

              itemCount: patients.length,

              itemBuilder: (context, index) {
                final patient = patients[index];

                return PatientCard(
                  patient: patient,

                  onTap: () {
                    if (selectionMode) {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => AddCaseScreen(patient: patient),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              PatientDetailsScreen(patient: patient),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: selectionMode
          ? null
          : FloatingActionButton(
              tooltip: "Add Patient",

              child: const Icon(Icons.person_add),

              onPressed: () async {
                final result = await Navigator.push(
                  context,

                  MaterialPageRoute(builder: (_) => const PatientFormScreen()),
                );

                if (result == true) {
                  ref.invalidate(patientListProvider);
                }
              },
            ),
    );
  }
}
