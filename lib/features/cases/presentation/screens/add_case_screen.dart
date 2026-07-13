import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/cases/presentation/widgets/procedure_selector.dart';

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
  String operativeRole = "Assistant";

  String? outcome;

  final List<ProcedureEntity> selectedProcedures = [];

  @override
  void dispose() {
    diagnosisController.dispose();
    notesController.dispose();
    super.dispose();
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
                if (procedure == null) return;

                final exists = selectedProcedures.any(
                  (e) => e.id == procedure.id,
                );

                if (!exists) {
                  setState(() {
                    selectedProcedures.add(procedure);
                  });
                }
              },
            ),

            const SizedBox(height: 12),

            if (selectedProcedures.isNotEmpty)
              Wrap(
                spacing: 8,
                children: selectedProcedures.map((procedure) {
                  return Chip(
                    label: Text(procedure.name),

                    onDeleted: () {
                      setState(() {
                        selectedProcedures.remove(procedure);
                      });
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
    if (!_formKey.currentState!.validate()) return;

    if (selectedProcedures.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select at least one procedure")),
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

      operativeRole: operativeRole,

      technicalSteps: null,

      graftConduitImplant: null,

      outcome: outcome ?? "",

      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),

      createdAt: now,

      updatedAt: now,
    );

    await ref
        .read(surgicalCaseRepositoryProvider)
        .addCase(newCase, selectedProcedures.map((e) => e.id!).toList());

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
