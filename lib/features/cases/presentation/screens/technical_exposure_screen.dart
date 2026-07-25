import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/enums/surgeon_role.dart';

import 'package:surgitrack/features/cases/providers/case_procedure_provider.dart';

import 'package:surgitrack/features/cases/providers/case_procedure_steps_provider.dart';

import 'package:surgitrack/features/cases/presentation/widgets/technical_steps_widget.dart';

import 'package:surgitrack/features/procedures/providers/procedure_provider.dart';

import 'package:surgitrack/core/database/dao/case_procedure_dao.dart';

class TechnicalExposureScreen extends ConsumerStatefulWidget {
  final int caseId;

  const TechnicalExposureScreen({super.key, required this.caseId});

  @override
  ConsumerState<TechnicalExposureScreen> createState() =>
      _TechnicalExposureScreenState();
}

class _TechnicalExposureScreenState
    extends ConsumerState<TechnicalExposureScreen> {
  final Map<int, SurgeonRole> selectedRoles = {};

  bool isLoading = true;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    _loadExposure();
  }

  Future<void> _loadExposure() async {
    final procedures = await ref.read(
      caseProceduresProvider(widget.caseId).future,
    );

    final repository = ref.read(caseProcedureStepsRepositoryProvider);

    for (final item in procedures) {
      final existingSteps = await repository.getStepsForCaseProcedure(
        item.caseProcedure.id,
      );

      for (final existing in existingSteps) {
        selectedRoles[existing.procedureStep.id] =
            SurgeonRoleExtension.fromString(existing.caseStep.role);
      }
    }

    if (!mounted) {
      return;
    }

    setState(() {
      isLoading = false;
    });
  }

  void _onRolesChanged(Map<int, SurgeonRole> updatedRoles) {
    setState(() {
      selectedRoles
        ..clear()
        ..addAll(updatedRoles);
    });
  }

  Future<void> _saveExposure() async {
    setState(() {
      isSaving = true;
    });

    try {
      final procedures = await ref.read(
        caseProceduresProvider(widget.caseId).future,
      );

      final repository = ref.read(caseProcedureStepsRepositoryProvider);

      for (final item in procedures) {
        final steps = await ref.read(
          procedureStepsProvider(item.procedure.id).future,
        );

        final selectedForProcedure = <int, String>{};

        for (final step in steps) {
          final role = selectedRoles[step.id];

          if (role != null) {
            selectedForProcedure[step.id] = role.value;
          }
        }

        await repository.saveTechnicalExposure(
          caseProcedureId: item.caseProcedure.id,
          stepRoles: selectedForProcedure,
        );
      }

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Technical exposure saved')));

      Navigator.pop(context);
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final proceduresAsync = ref.watch(caseProceduresProvider(widget.caseId));

    return Scaffold(
      appBar: AppBar(title: const Text('Technical Exposure')),

      body: proceduresAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) =>
            const Center(child: Text('Unable to load procedures')),

        data: (procedures) {
          if (procedures.isEmpty) {
            return const Center(
              child: Text('No procedures linked to this case.'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),

            children: [
              ...procedures.map(
                (item) => _ProcedureTechnicalExposureSection(
                  item: item,
                  selectedRoles: selectedRoles,
                  onChanged: _onRolesChanged,
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSaving ? null : _saveExposure,

                  child: isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save Technical Exposure'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProcedureTechnicalExposureSection extends ConsumerWidget {
  final CaseProcedureWithProcedure item;

  final Map<int, SurgeonRole> selectedRoles;

  final ValueChanged<Map<int, SurgeonRole>> onChanged;

  const _ProcedureTechnicalExposureSection({
    required this.item,
    required this.selectedRoles,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final procedureId = item.procedure.id;

    final stepsAsync = ref.watch(procedureStepsProvider(procedureId));

    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              item.procedure.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            stepsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (error, stack) =>
                  const Text('Unable to load technical steps.'),

              data: (steps) {
                return TechnicalStepsWidget(
                  steps: steps,
                  selectedRoles: selectedRoles,
                  onChanged: onChanged,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
