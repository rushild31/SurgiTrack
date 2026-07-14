import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/procedures/domain/procedure_selection.dart';

import 'package:surgitrack/features/cases/presentation/widgets/procedure_selector.dart';
import 'package:surgitrack/core/enums/surgeon_role.dart';
import 'package:surgitrack/features/cases/presentation/widgets/operative_role_selector.dart';

class AddCaseScreen extends ConsumerStatefulWidget {
  final Patient patient;

  const AddCaseScreen({super.key, required this.patient});

  @override
  ConsumerState<AddCaseScreen> createState() => _AddCaseScreenState();
}

class _AddCaseScreenState extends ConsumerState<AddCaseScreen> {
  final _formKey = GlobalKey<FormState>();

  final diagnosisController = TextEditingController();

  final notesController = TextEditingController();

  DateTime surgeryDate = DateTime.now();

  String specialty = "Cardiac";

  String surgeryType = "Primary";

  String urgency = "Elective";

  SurgeonRole operativeRole = SurgeonRole.assisted;

  String? outcome;

  ProcedureSelection selection = const ProcedureSelection();

  @override
  void dispose() {
    diagnosisController.dispose();

    notesController.dispose();

    super.dispose();
  }

  void addProcedure(ProcedureEntity procedure) {
    final currentPrimary = selection.primaryProcedure;

    if (currentPrimary == null) {
      setState(() {
        selection = ProcedureSelection(
          primaryProcedure: procedure,
          associatedProcedures: [],
        );
      });

      return;
    }

    final alreadyAdded = selection.associatedProcedures.any(
      (item) => item.id == procedure.id,
    );

    if (!alreadyAdded && currentPrimary.id != procedure.id) {
      setState(() {
        selection = ProcedureSelection(
          primaryProcedure: currentPrimary,
          associatedProcedures: [...selection.associatedProcedures, procedure],
        );
      });
    }
  }

  void removeProcedure(ProcedureEntity procedure) {
    setState(() {
      if (selection.primaryProcedure?.id == procedure.id) {
        selection = ProcedureSelection(
          primaryProcedure: null,
          associatedProcedures: selection.associatedProcedures,
        );
      } else {
        selection = ProcedureSelection(
          primaryProcedure: selection.primaryProcedure,
          associatedProcedures: selection.associatedProcedures
              .where((item) => item.id != procedure.id)
              .toList(),
        );
      }
    });
  }

  List<ProcedureEntity> get selectedProcedures {
    return [
      if (selection.primaryProcedure != null) selection.primaryProcedure!,

      ...selection.associatedProcedures,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Case - ${widget.patient.name}")),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [
            ProcedureSelector(
              selected: null,

              onChanged: (procedure) {
                if (procedure != null) {
                  addProcedure(procedure);
                }
              },
            ),

            const SizedBox(height: 12),

            if (selectedProcedures.isNotEmpty)
              Wrap(
                spacing: 8,

                children: selectedProcedures.map((procedure) {
                  final isPrimary =
                      procedure.id == selection.primaryProcedure?.id;

                  return Chip(
                    label: Text(
                      isPrimary
                          ? "${procedure.name} (Primary)"
                          : procedure.name,
                    ),

                    onDeleted: () {
                      removeProcedure(procedure);
                    },
                  );
                }).toList(),
              ),

            TextFormField(
              controller: diagnosisController,

              decoration: const InputDecoration(labelText: "Diagnosis"),

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Enter diagnosis";
                }

                return null;
              },
            ),

            const SizedBox(height: 12),

            OperativeRoleSelector(
              value: operativeRole,

              onChanged: (value) {
                setState(() {
                  operativeRole = value;
                });
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: notesController,

              maxLines: 4,

              decoration: const InputDecoration(labelText: "Additional Notes"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: saveCase, child: const Text("Save Case")),
          ],
        ),
      ),
    );
  }

  Future<void> saveCase() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selection.primaryProcedure == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select at least one primary procedure")),
      );

      return;
    }

    final now = DateTime.now();

    final newCase = SurgicalCase(
      patientId: widget.patient.id!,

      caseId: "CTVS-${now.millisecondsSinceEpoch}",

      surgeryDate: surgeryDate,

      diagnosis: diagnosisController.text.trim(),

      urgency: urgency,

      surgeryType: surgeryType,

      specialty: specialty,

      surgicalApproach: null,

      operativeRole: operativeRole.label,

      technicalSteps: null,

      graftConduitImplant: null,

      outcome: outcome ?? "",

      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),

      createdAt: now,

      updatedAt: now,
    );

    await ref.read(surgicalCaseRepositoryProvider).addCase(newCase, selection);

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
