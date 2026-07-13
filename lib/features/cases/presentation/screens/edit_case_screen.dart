import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

class EditCaseScreen extends ConsumerStatefulWidget {
  final SurgicalCase surgicalCase;

  const EditCaseScreen({super.key, required this.surgicalCase});

  @override
  ConsumerState<EditCaseScreen> createState() => _EditCaseScreenState();
}

class _EditCaseScreenState extends ConsumerState<EditCaseScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController diagnosisController;

  late String specialty;

  late String surgeryType;

  late String urgency;

  late String operativeRole;

  @override
  void initState() {
    super.initState();

    final c = widget.surgicalCase;

    diagnosisController = TextEditingController(text: c.diagnosis);

    specialty = c.specialty;

    surgeryType = c.surgeryType;

    urgency = c.urgency;

    operativeRole = c.operativeRole;
  }

  @override
  void dispose() {
    diagnosisController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Surgical Case")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [
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

              DropdownButtonFormField<String>(
                initialValue: specialty,

                decoration: const InputDecoration(labelText: "Specialty"),

                items: const [
                  DropdownMenuItem(value: "Cardiac", child: Text("Cardiac")),

                  DropdownMenuItem(value: "Thoracic", child: Text("Thoracic")),

                  DropdownMenuItem(value: "Vascular", child: Text("Vascular")),
                ],

                onChanged: (v) {
                  setState(() {
                    specialty = v!;
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

                onChanged: (v) {
                  setState(() {
                    surgeryType = v!;
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

                onChanged: (v) {
                  setState(() {
                    urgency = v!;
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

                onChanged: (v) {
                  setState(() {
                    operativeRole = v!;
                  });
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  final updated = SurgicalCase(
                    id: widget.surgicalCase.id,

                    patientId: widget.surgicalCase.patientId,

                    caseId: widget.surgicalCase.caseId,

                    surgeryDate: widget.surgicalCase.surgeryDate,

                    diagnosis: diagnosisController.text,

                    urgency: urgency,

                    surgeryType: surgeryType,

                    specialty: specialty,

                    surgicalApproach: widget.surgicalCase.surgicalApproach,

                    operativeRole: operativeRole,

                    technicalSteps: widget.surgicalCase.technicalSteps,

                    graftConduitImplant:
                        widget.surgicalCase.graftConduitImplant,

                    outcome: widget.surgicalCase.outcome,

                    notes: widget.surgicalCase.notes,

                    createdAt: widget.surgicalCase.createdAt,

                    updatedAt: DateTime.now(),
                  );

                  await ref
                      .read(surgicalCaseRepositoryProvider)
                      .updateCase(updated);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },

                child: const Text("Update Case"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
