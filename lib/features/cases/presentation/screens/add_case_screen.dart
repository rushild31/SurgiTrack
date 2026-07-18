import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/enums/outcome.dart';
import 'package:surgitrack/core/enums/surgical_approach.dart';
import 'package:surgitrack/core/enums/surgeon_role.dart';
import 'package:surgitrack/core/enums/specialty.dart';
import 'package:surgitrack/core/enums/case_type.dart';
import 'package:surgitrack/core/enums/case_priority.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/procedures/domain/procedure_selection.dart';

import 'package:surgitrack/features/cases/presentation/widgets/procedure_selector.dart';
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

  Specialty specialty = Specialty.cardiac;

  CaseType caseType = CaseType.primary;

  CasePriority priority = CasePriority.planned;

  SurgeonRole operativeRole = SurgeonRole.assisted;

  Outcome outcome = Outcome.ongoing;

  SurgicalApproach surgicalApproach = SurgicalApproach.medianSternotomy;

  ProcedureSelection selection = const ProcedureSelection();

  bool cardiopulmonaryBypassUsed = false;

  final bypassTimeController = TextEditingController();

  final crossClampTimeController = TextEditingController();

  final complicationsController = TextEditingController();

  @override
  void dispose() {
    diagnosisController.dispose();
    notesController.dispose();

    bypassTimeController.dispose();
    crossClampTimeController.dispose();
    complicationsController.dispose();

    super.dispose();
  }

  void addProcedure(ProcedureEntity procedure) {
    final primary = selection.primaryProcedure;

    if (primary == null) {
      setState(() {
        selection = ProcedureSelection(
          primaryProcedure: procedure,
          associatedProcedures: [],
        );
      });

      return;
    }

    final exists = selection.associatedProcedures.any(
      (e) => e.id == procedure.id,
    );

    if (!exists && primary.id != procedure.id) {
      setState(() {
        selection = ProcedureSelection(
          primaryProcedure: primary,
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
              .where((e) => e.id != procedure.id)
              .toList(),
        );
      }
    });
  }

  List<ProcedureEntity> get selectedProcedures => [
    if (selection.primaryProcedure != null) selection.primaryProcedure!,
    ...selection.associatedProcedures,
  ];

  Future<void> pickSurgeryDate() async {
    final selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: surgeryDate,
    );

    if (selected != null) {
      setState(() {
        surgeryDate = selected;
      });
    }
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

                children: selectedProcedures.map((p) {
                  final primary = p.id == selection.primaryProcedure?.id;

                  return Chip(
                    label: Text(primary ? "${p.name} (Primary)" : p.name),

                    onDeleted: () {
                      removeProcedure(p);
                    },
                  );
                }).toList(),
              ),

            TextFormField(
              controller: diagnosisController,

              decoration: const InputDecoration(labelText: "Diagnosis"),

              validator: (v) =>
                  v == null || v.trim().isEmpty ? "Enter diagnosis" : null,
            ),

            ListTile(
              title: const Text("Surgery Date"),

              subtitle: Text(
                "${surgeryDate.day}-${surgeryDate.month}-${surgeryDate.year}",
              ),

              trailing: const Icon(Icons.calendar_today),

              onTap: pickSurgeryDate,
            ),

            DropdownButtonFormField<Specialty>(
              initialValue: specialty,

              decoration: const InputDecoration(labelText: "Specialty"),

              items: Specialty.values.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name.toUpperCase()),
                );
              }).toList(),

              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    specialty = v;
                  });
                }
              },
            ),

            DropdownButtonFormField<CaseType>(
              initialValue: caseType,

              decoration: const InputDecoration(labelText: "Case Type"),

              items: CaseType.values.map((e) {
                return DropdownMenuItem(value: e, child: Text(e.name));
              }).toList(),

              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    caseType = v;
                  });
                }
              },
            ),

            DropdownButtonFormField<CasePriority>(
              initialValue: priority,

              decoration: const InputDecoration(labelText: "Priority"),

              items: CasePriority.values.map((e) {
                return DropdownMenuItem(value: e, child: Text(e.name));
              }).toList(),

              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    priority = v;
                  });
                }
              },
            ),

            DropdownButtonFormField<SurgicalApproach>(
              initialValue: surgicalApproach,

              decoration: const InputDecoration(labelText: "Surgical Approach"),

              items: SurgicalApproach.values.map((e) {
                return DropdownMenuItem(value: e, child: Text(e.name));
              }).toList(),

              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    surgicalApproach = v;
                  });
                }
              },
            ),

            const SizedBox(height: 12),

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

              onChanged: (value) {
                setState(() {
                  cardiopulmonaryBypassUsed = value;
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

            DropdownButtonFormField<Outcome>(
              initialValue: outcome,

              decoration: const InputDecoration(labelText: "Outcome"),

              items: Outcome.values.map((e) {
                return DropdownMenuItem(value: e, child: Text(e.name));
              }).toList(),

              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    outcome = v;
                  });
                }
              },
            ),

            const SizedBox(height: 12),

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Select primary procedure")));

      return;
    }

    final now = DateTime.now();

    final newCase = SurgicalCase(
      patientId: widget.patient.id!,

      caseId: await ref.read(surgicalCaseRepositoryProvider).generateCaseId(),

      surgeryDate: surgeryDate,

      diagnosis: diagnosisController.text.trim(),

      urgency: priority.name,

      surgeryType: caseType.name,

      specialty: specialty.name,

      surgicalApproach: surgicalApproach.name,

      operativeRole: operativeRole.label,

      technicalSteps: null,

      graftConduitImplant: null,

      outcome: outcome.name,

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
