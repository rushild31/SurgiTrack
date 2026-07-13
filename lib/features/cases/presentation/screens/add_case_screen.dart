import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/cases/presentation/widgets/procedure_selector.dart';

class AddCaseScreen extends ConsumerStatefulWidget {
  const AddCaseScreen({super.key});

  @override
  ConsumerState<AddCaseScreen> createState() => _AddCaseScreenState();
}

class _AddCaseScreenState extends ConsumerState<AddCaseScreen> {
  final _formKey = GlobalKey<FormState>();

  final diagnosisController = TextEditingController();

  String specialty = "Cardiac";

  String surgeryType = "Primary";

  String urgency = "Elective";

  String operativeRole = "Assistant";

  ProcedureEntity? selectedProcedure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Surgical Case")),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [
            ProcedureSelector(
              selected: selectedProcedure,

              onChanged: (value) {
                setState(() {
                  selectedProcedure = value;
                });
              },
            ),

            TextFormField(
              controller: diagnosisController,

              decoration: const InputDecoration(labelText: "Diagnosis"),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter diagnosis";
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

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

    if (selectedProcedure == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Select procedure")));

      return;
    }

    final now = DateTime.now();

    final newCase = SurgicalCase(
      patientId: 1,

      caseId: "CTVS-${now.millisecondsSinceEpoch}",

      surgeryDate: now,

      diagnosis: diagnosisController.text.trim(),

      urgency: urgency,

      surgeryType: surgeryType,

      specialty: specialty,

      surgicalApproach: null,

      operativeRole: operativeRole,

      technicalSteps: null,

      graftConduitImplant: null,

      outcome: "Ongoing",

      notes: null,

      createdAt: now,

      updatedAt: now,
    );

    await ref
        .read(surgicalCaseRepositoryProvider)
        .addCase(newCase, selectedProcedure!.id!);

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
