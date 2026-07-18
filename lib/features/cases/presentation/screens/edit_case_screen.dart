import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/core/enums/surgeon_role.dart';
import 'package:surgitrack/core/enums/surgical_approach.dart';

import 'package:surgitrack/features/cases/presentation/widgets/operative_role_selector.dart';

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
  late TextEditingController bypassTimeController;
  late TextEditingController crossClampTimeController;
  late TextEditingController complicationsController;

  late DateTime surgeryDate;

  late String specialty;
  late String surgeryType;
  late String urgency;

  late SurgeonRole operativeRole;

  late SurgicalApproach surgicalApproach;

  late bool cardiopulmonaryBypassUsed;

  String? outcome;

  @override
  void initState() {
    super.initState();

    final c = widget.surgicalCase;

    diagnosisController = TextEditingController(text: c.diagnosis);

    notesController = TextEditingController(text: c.notes ?? "");

    bypassTimeController = TextEditingController(
      text: c.bypassTimeMinutes?.toString() ?? "",
    );

    crossClampTimeController = TextEditingController(
      text: c.crossClampTimeMinutes?.toString() ?? "",
    );

    complicationsController = TextEditingController(
      text: c.complications ?? "",
    );

    surgeryDate = c.surgeryDate;

    specialty = c.specialty;

    surgeryType = c.surgeryType;

    urgency = c.urgency;

    operativeRole = SurgeonRole.values.firstWhere(
      (e) => e.label == c.operativeRole,
      orElse: () => SurgeonRole.assisted,
    );

    surgicalApproach = SurgicalApproach.values.firstWhere(
      (e) => e.name == c.surgicalApproach,
      orElse: () => SurgicalApproach.medianSternotomy,
    );

    cardiopulmonaryBypassUsed = c.cardiopulmonaryBypassUsed;

    outcome = c.outcome.isEmpty ? null : c.outcome;
  }

  @override
  void dispose() {
    diagnosisController.dispose();
    notesController.dispose();
    bypassTimeController.dispose();
    crossClampTimeController.dispose();
    complicationsController.dispose();

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

              validator: (v) =>
                  v == null || v.trim().isEmpty ? "Enter diagnosis" : null,
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,

              title: const Text("Surgery Date"),

              subtitle: Text(
                "${surgeryDate.day}/"
                "${surgeryDate.month}/"
                "${surgeryDate.year}",
              ),

              trailing: const Icon(Icons.calendar_today),

              onTap: pickDate,
            ),

            _dropdown("Specialty", specialty, [
              "Cardiac",
              "Thoracic",
              "Vascular",
            ], (v) => specialty = v),

            _dropdown("Surgery Type", surgeryType, [
              "Primary",
              "Redo",
            ], (v) => surgeryType = v),

            _dropdown("Urgency", urgency, [
              "Planned",
              "Emergency",
            ], (v) => urgency = v),

            DropdownButtonFormField<SurgicalApproach>(
              initialValue: surgicalApproach,

              decoration: const InputDecoration(labelText: "Surgical Approach"),

              items: SurgicalApproach.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),

              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    surgicalApproach = v;
                  });
                }
              },
            ),

            OperativeRoleSelector(
              value: operativeRole,

              onChanged: (v) {
                setState(() {
                  operativeRole = v;
                });
              },
            ),

            SwitchListTile(
              title: const Text("Cardiopulmonary Bypass Used"),

              value: cardiopulmonaryBypassUsed,

              onChanged: (v) {
                setState(() {
                  cardiopulmonaryBypassUsed = v;
                });
              },
            ),

            if (cardiopulmonaryBypassUsed) ...[
              TextFormField(
                controller: bypassTimeController,

                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Bypass Time (minutes)",
                ),
              ),

              TextFormField(
                controller: crossClampTimeController,

                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Cross Clamp Time (minutes)",
                ),
              ),
            ],

            DropdownButtonFormField<String>(
              initialValue: outcome,

              decoration: const InputDecoration(labelText: "Outcome"),

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
              controller: complicationsController,

              maxLines: 3,

              decoration: const InputDecoration(labelText: "Complications"),
            ),

            TextFormField(
              controller: notesController,

              maxLines: 4,

              decoration: const InputDecoration(labelText: "Additional Notes"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: updateCase,

              child: const Text("Update Case"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickDate() async {
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
  }

  Widget _dropdown(
    String label,
    String value,
    List<String> items,
    Function(String) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      initialValue: value,

      decoration: InputDecoration(labelText: label),

      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),

      onChanged: (v) {
        if (v != null) {
          setState(() {
            onChanged(v);
          });
        }
      },
    );
  }

  Future<void> updateCase() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

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

      procedureIds: c.procedureIds,

      surgicalApproach: surgicalApproach.name,

      approach: c.approach,

      caseType: c.caseType,

      complexity: c.complexity,

      operativeRole: operativeRole.label,

      technicalSteps: c.technicalSteps,

      cardiopulmonaryBypassUsed: cardiopulmonaryBypassUsed,

      bypassTimeMinutes: int.tryParse(bypassTimeController.text),

      crossClampTimeMinutes: int.tryParse(crossClampTimeController.text),

      graftConduitImplant: c.graftConduitImplant,

      outcome: outcome ?? "",

      complications: complicationsController.text.trim().isEmpty
          ? null
          : complicationsController.text.trim(),

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
