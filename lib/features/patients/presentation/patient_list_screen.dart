import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/patients/providers/patient_provider.dart';

import 'package:surgitrack/features/patients/presentation/widgets/patient_card.dart';
import 'package:surgitrack/features/patients/presentation/widgets/empty_patient_state.dart';

import 'package:surgitrack/features/patients/presentation/search/patient_search_delegate.dart';

import 'package:surgitrack/features/cases/presentation/screens/add_case_screen.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

class PatientListScreen extends ConsumerWidget {
  final bool selectionMode;

  const PatientListScreen({super.key, this.selectionMode = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsAsync = ref.watch(patientListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectionMode ? 'Select Patient' : 'Patients'),
        actions: [
          if (!selectionMode)
            patientsAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
              data: (patients) {
                if (patients.isEmpty) {
                  return const SizedBox.shrink();
                }

                return IconButton(
                  tooltip: 'Search patients',
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: PatientSearchDelegate(ref),
                    );
                  },
                );
              },
            ),
        ],
      ),
      body: patientsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _PatientListError(
          onRetry: () {
            ref.invalidate(patientListProvider);
          },
        ),
        data: (patients) {
          if (patients.isEmpty) {
            return const EmptyPatientState();
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(patientListProvider);
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 900;

                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 32 : 16,
                    vertical: 16,
                  ),
                  children: [
                    _PatientListHeader(
                      patientCount: patients.length,
                      selectionMode: selectionMode,
                    ),
                    const SizedBox(height: 16),
                    if (isWide)
                      _WidePatientLayout(
                        patients: patients,
                        onPatientTap: (patient) {
                          _handlePatientTap(context, patient, selectionMode);
                        },
                      )
                    else
                      ...patients.map(
                        (patient) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: PatientCard(
                            patient: patient,
                            onTap: () {
                              _handlePatientTap(
                                context,
                                patient,
                                selectionMode,
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: selectionMode
          ? null
          : FloatingActionButton.extended(
              tooltip: 'Add Patient',
              icon: const Icon(Icons.person_add_outlined),
              label: const Text('Add Patient'),
              onPressed: () {
                context.push('/patients/add');
              },
            ),
    );
  }

  void _handlePatientTap(
    BuildContext context,
    Patient patient,
    bool selectionMode,
  ) {
    if (selectionMode) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AddCaseScreen(patient: patient)),
      );
    } else {
      context.push('/patients/${patient.id}');
    }
  }
}

class _PatientListHeader extends StatelessWidget {
  final int patientCount;
  final bool selectionMode;

  const _PatientListHeader({
    required this.patientCount,
    required this.selectionMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectionMode ? 'Choose a patient' : 'Patient Registry',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                selectionMode
                    ? 'Select the patient for this surgical case'
                    : 'Manage your surgical patient records',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        _PatientCountChip(count: patientCount),
      ],
    );
  }
}

class _PatientCountChip extends StatelessWidget {
  final int count;

  const _PatientCountChip({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$count ${count == 1 ? 'Patient' : 'Patients'}',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _WidePatientLayout extends StatelessWidget {
  final List<Patient> patients;
  final ValueChanged<Patient> onPatientTap;

  const _WidePatientLayout({
    required this.patients,
    required this.onPatientTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 520,
        mainAxisExtent: 150,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];

        return PatientCard(
          patient: patient,
          onTap: () => onPatientTap(patient),
        );
      },
    );
  }
}

class _PatientListError extends StatelessWidget {
  final VoidCallback onRetry;

  const _PatientListError({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              'Unable to load patients',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Something went wrong while loading the patient registry.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
