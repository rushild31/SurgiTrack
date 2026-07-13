import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/procedures/providers/procedure_provider.dart';

import '../widgets/procedure_selector.dart';

class AddCaseScreen extends ConsumerStatefulWidget {
  const AddCaseScreen({super.key});

  @override
  ConsumerState<AddCaseScreen> createState() => _AddCaseScreenState();
}

class _AddCaseScreenState extends ConsumerState<AddCaseScreen> {
  final formKey = GlobalKey<FormState>();

  final diagnosisController = TextEditingController();

  ProcedureEntity? selectedProcedure;

  String specialty = "Cardiac";

  String surgeryType = "Primary";

  String urgency = "Elective";

  String operativeRole = "Assistant";

  DateTime surgeryDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final proceduresAsync = ref.watch(procedureListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Surgical Case")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: formKey,

          child: ListView(
            children: [
              TextFormField(
                controller: diagnosisController,

                decoration: const InputDecoration(
                  labelText: "Diagnosis",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter diagnosis";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              proceduresAsync.when(
                data: (procedures) {
                  return ProcedureSelector(
                    procedures: procedures,
                    selected: selectedProcedure,
                    onChanged: (value) {
                      setState(() {
                        selectedProcedure = value;
                      });
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) =>
                    Text("Error loading procedures: $error"),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: specialty,

                decoration: const InputDecoration(labelText: "Specialty"),

                items: const [
                  DropdownMenuItem(value: "Cardiac", child: Text("Cardiac")),

                  DropdownMenuItem(value: "Thoracic", child: Text("Thoracic")),

                  DropdownMenuItem(value: "Vascular", child: Text("Vascular")),
                ],

                onChanged: (value) {
                  setState(() {
                    specialty = value!;
                  });
                },
              ),

              DropdownButtonFormField<String>(
                initialValue: surgeryType,

                decoration: const InputDecoration(labelText: "Surgery Type"),

                items: const [
                  DropdownMenuItem(value: "Primary", child: Text("Primary")),

                  DropdownMenuItem(value: "Redo", child: Text("Redo")),
                ],

                onChanged: (value) {
                  setState(() {
                    surgeryType = value!;
                  });
                },
              ),

              DropdownButtonFormField<String>(
                initialValue: urgency,

                decoration: const InputDecoration(labelText: "Urgency"),

                items: const [
                  DropdownMenuItem(value: "Elective", child: Text("Elective")),

                  DropdownMenuItem(
                    value: "Emergency",
                    child: Text("Emergency"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    urgency = value!;
                  });
                },
              ),

              DropdownButtonFormField<String>(
                initialValue: operativeRole,

                decoration: const InputDecoration(labelText: "Operative Role"),

                items: const [
                  DropdownMenuItem(value: "Observer", child: Text("Observer")),

                  DropdownMenuItem(
                    value: "Assistant",
                    child: Text("Assistant"),
                  ),

                  DropdownMenuItem(
                    value: "Primary Surgeon",
                    child: Text("Primary Surgeon"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    operativeRole = value!;
                  });
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  if (selectedProcedure == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Select procedure")),
                    );

                    return;
                  }

                  final now = DateTime.now();

                  final newCase = SurgicalCase(
                    patientId: 1,

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

                    outcome: "Ongoing",

                    notes: null,

                    createdAt: now,

                    updatedAt: now,
                  );

                  await ref
                      .read(surgicalCaseRepositoryProvider)
                      .addCase(newCase);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },

                child: const Text("Save Case"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
