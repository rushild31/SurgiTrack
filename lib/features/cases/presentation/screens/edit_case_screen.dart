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

  late TextEditingController notesController;

  late DateTime surgeryDate;

  late String specialty;

  late String surgeryType;

  late String urgency;

  late String operativeRole;

  String? outcome;

  @override
  void initState() {
    super.initState();

    final c = widget.surgicalCase;

    diagnosisController = TextEditingController(text: c.diagnosis);

    notesController = TextEditingController(text: c.notes ?? "");

    surgeryDate = c.surgeryDate;

    specialty = c.specialty;

    surgeryType = c.surgeryType;

    urgency = c.urgency;

    operativeRole = c.operativeRole;

    outcome = c.outcome.isEmpty ? null : c.outcome;
  }

  @override
  void dispose() {
    diagnosisController.dispose();

    notesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Surgical Case")),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [
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

            ListTile(
              contentPadding: EdgeInsets.zero,

              title: const Text("Surgery Date"),

              subtitle: Text(
                "${surgeryDate.day}/"
                "${surgeryDate.month}/"
                "${surgeryDate.year}",
              ),

              trailing: const Icon(Icons.calendar_today),

              onTap: () async {
                final picked = await showDatePicker(
                  context: context,

                  initialDate: surgeryDate,

                  firstDate: DateTime(2000),

                  lastDate: DateTime.now(),
                );

                if (picked != null) {
                  setState(() {
                    surgeryDate = picked;
                  });
                }
              },
            ),

            _dropdown(
              label: "Specialty",

              value: specialty,

              items: const ["Cardiac", "Thoracic", "Vascular"],

              onChanged: (v) {
                setState(() {
                  specialty = v;
                });
              },
            ),

            _dropdown(
              label: "Surgery Type",

              value: surgeryType,

              items: const ["Primary", "Redo"],

              onChanged: (v) {
                setState(() {
                  surgeryType = v;
                });
              },
            ),

            _dropdown(
              label: "Urgency",

              value: urgency,

              items: const ["Elective", "Emergency"],

              onChanged: (v) {
                setState(() {
                  urgency = v;
                });
              },
            ),

            _dropdown(
              label: "Operative Role",

              value: operativeRole,

              items: const ["Observer", "Assistant", "Primary Surgeon"],

              onChanged: (v) {
                setState(() {
                  operativeRole = v;
                });
              },
            ),

            DropdownButtonFormField<String>(
              initialValue: outcome,

              decoration: const InputDecoration(
                labelText: "Outcome (optional)",
              ),

              items: const [
                DropdownMenuItem(
                  value: "Successful",
                  child: Text("Successful"),
                ),

                DropdownMenuItem(
                  value: "Reintervention",
                  child: Text("Reintervention"),
                ),

                DropdownMenuItem(value: "Mortality", child: Text("Mortality")),

                DropdownMenuItem(
                  value: "Lost to Follow-up",
                  child: Text("Lost to Follow-up"),
                ),
              ],

              onChanged: (v) {
                setState(() {
                  outcome = v;
                });
              },
            ),

            TextFormField(
              controller: notesController,

              maxLines: 3,

              decoration: const InputDecoration(labelText: "Notes"),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: updateCase,

              child: const Text("Update Case"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown({
    required String label,

    required String value,

    required List<String> items,

    required Function(String) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,

      decoration: InputDecoration(labelText: label),

      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),

      onChanged: (v) {
        if (v != null) {
          onChanged(v);
        }
      },
    );
  }

  Future<void> updateCase() async {
    if (!_formKey.currentState!.validate()) return;

    final c = widget.surgicalCase;

    final updated = SurgicalCase(
      id: c.id,

      patientId: c.patientId,

      caseId: c.caseId,

      surgeryDate: surgeryDate,

      diagnosis: diagnosisController.text.trim(),

      urgency: urgency,

      surgeryType: surgeryType,

      specialty: specialty,

      surgicalApproach: c.surgicalApproach,

      operativeRole: operativeRole,

      technicalSteps: c.technicalSteps,

      graftConduitImplant: c.graftConduitImplant,

      outcome: outcome ?? "",

      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),

      createdAt: c.createdAt,

      updatedAt: DateTime.now(),
    );

    await ref.read(surgicalCaseRepositoryProvider).updateCase(updated);

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
