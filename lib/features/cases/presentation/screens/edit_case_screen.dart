import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/core/enums/outcome.dart';
import 'package:surgitrack/core/enums/specialty.dart';
import 'package:surgitrack/core/enums/surgeon_role.dart';
import 'package:surgitrack/core/enums/surgical_approach.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';
import 'package:surgitrack/features/cases/providers/case_procedure_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';
import 'package:surgitrack/features/procedures/domain/procedure_selection.dart';

import 'package:surgitrack/features/procedures/data/procedure_mapper.dart';

import 'package:surgitrack/features/cases/presentation/widgets/procedure_selector.dart';
import 'package:surgitrack/features/cases/presentation/widgets/operative_role_selector.dart';

class EditCaseScreen extends ConsumerStatefulWidget {
  final SurgicalCase surgicalCase;

  const EditCaseScreen({super.key, required this.surgicalCase});

  @override
  ConsumerState<EditCaseScreen> createState() => _EditCaseScreenState();
}

class _EditCaseScreenState extends ConsumerState<EditCaseScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController diagnosisController;
  late final TextEditingController notesController;
  late final TextEditingController complicationsController;
  late final TextEditingController bypassTimeController;
  late final TextEditingController crossClampTimeController;

  late DateTime surgeryDate;

  late String specialty;
  late String surgeryType;
  late String urgency;

  late SurgeonRole operativeRole;
  late SurgicalApproach surgicalApproach;

  late bool cardiopulmonaryBypassUsed;

  String? outcome;

  ProcedureSelection selection = const ProcedureSelection();

  bool isLoadingProcedures = true;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    final c = widget.surgicalCase;

    diagnosisController = TextEditingController(text: c.diagnosis);

    notesController = TextEditingController(text: c.notes ?? "");

    complicationsController = TextEditingController(
      text: c.complications ?? "",
    );

    bypassTimeController = TextEditingController(
      text: c.bypassTimeMinutes?.toString() ?? "",
    );

    crossClampTimeController = TextEditingController(
      text: c.crossClampTimeMinutes?.toString() ?? "",
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

    _loadLinkedProcedures();
  }

  // =========================================================
  // LOAD LINKED PROCEDURES
  // =========================================================

  Future<void> _loadLinkedProcedures() async {
    final caseId = widget.surgicalCase.id;

    if (caseId == null) {
      if (mounted) {
        setState(() {
          isLoadingProcedures = false;
        });
      }

      return;
    }

    try {
      final linked = await ref.read(caseProceduresProvider(caseId).future);

      ProcedureEntity? primary;

      final associated = <ProcedureEntity>[];

      for (final item in linked) {
        final procedure = ProcedureMapper.fromData(item.procedure);

        if (item.caseProcedure.type == "PRIMARY") {
          primary = procedure;
        } else {
          associated.add(procedure);
        }
      }

      if (!mounted) return;

      setState(() {
        selection = ProcedureSelection(
          primaryProcedure: primary,
          associatedProcedures: associated,
        );

        isLoadingProcedures = false;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        isLoadingProcedures = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unable to load linked procedures.")),
      );
    }
  }

  // =========================================================
  // ADD PROCEDURE
  // =========================================================

  void addProcedure(ProcedureEntity procedure) {
    final primary = selection.primaryProcedure;

    if (primary == null) {
      setState(() {
        selection = ProcedureSelection(
          primaryProcedure: procedure,
          associatedProcedures: const [],
        );
      });

      return;
    }

    if (primary.id == procedure.id) {
      return;
    }

    final alreadyAssociated = selection.associatedProcedures.any(
      (e) => e.id == procedure.id,
    );

    if (alreadyAssociated) {
      return;
    }

    setState(() {
      selection = ProcedureSelection(
        primaryProcedure: primary,
        associatedProcedures: [...selection.associatedProcedures, procedure],
      );
    });
  }

  // =========================================================
  // REMOVE PROCEDURE
  // =========================================================

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

  // =========================================================
  // MAKE ASSOCIATED PROCEDURE PRIMARY
  // =========================================================

  void makePrimary(ProcedureEntity procedure) {
    final currentPrimary = selection.primaryProcedure;

    if (currentPrimary?.id == procedure.id) {
      return;
    }

    final updatedAssociated = <ProcedureEntity>[
      ?currentPrimary,

      ...selection.associatedProcedures.where((e) => e.id != procedure.id),
    ];

    setState(() {
      selection = ProcedureSelection(
        primaryProcedure: procedure,
        associatedProcedures: updatedAssociated,
      );
    });
  }

  List<ProcedureEntity> get selectedProcedures => [
    if (selection.primaryProcedure != null) selection.primaryProcedure!,

    ...selection.associatedProcedures,
  ];

  // =========================================================
  // DISPOSE
  // =========================================================

  @override
  void dispose() {
    diagnosisController.dispose();

    notesController.dispose();

    complicationsController.dispose();

    bypassTimeController.dispose();

    crossClampTimeController.dispose();

    super.dispose();
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Surgical Case")),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [
            // =================================================
            // DIAGNOSIS
            // =================================================
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

            const SizedBox(height: 20),

            // =================================================
            // PROCEDURES
            // =================================================
            const Text(
              "Procedures",

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            if (isLoadingProcedures)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
              )
            else ...[
              ProcedureSelector(
                selected: null,

                onChanged: (procedure) {
                  if (procedure != null) {
                    addProcedure(procedure);
                  }
                },
              ),

              const SizedBox(height: 12),

              if (selectedProcedures.isEmpty)
                const Text(
                  "No procedures selected.",

                  style: TextStyle(color: Colors.grey),
                )
              else
                Column(
                  children: selectedProcedures.map((procedure) {
                    final isPrimary =
                        procedure.id == selection.primaryProcedure?.id;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),

                      child: ListTile(
                        leading: Icon(
                          isPrimary ? Icons.star : Icons.medical_services,
                        ),

                        title: Text(procedure.name),

                        subtitle: Text(
                          isPrimary
                              ? "Primary Procedure"
                              : "Associated Procedure",
                        ),

                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == "primary") {
                              makePrimary(procedure);
                            }

                            if (value == "remove") {
                              removeProcedure(procedure);
                            }
                          },

                          itemBuilder: (context) => [
                            if (!isPrimary)
                              const PopupMenuItem(
                                value: "primary",
                                child: Text("Make Primary"),
                              ),

                            const PopupMenuItem(
                              value: "remove",
                              child: Text("Remove"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],

            const SizedBox(height: 20),

            // =================================================
            // SURGERY DATE
            // =================================================
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

            // =================================================
            // SPECIALTY
            // =================================================
            DropdownButtonFormField<String>(
              initialValue: specialty,

              decoration: const InputDecoration(labelText: "Specialty"),

              items: Specialty.values.map((e) {
                return DropdownMenuItem(
                  value: e.name,

                  child: Text(e.name[0].toUpperCase() + e.name.substring(1)),
                );
              }).toList(),

              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    specialty = value;
                  });
                }
              },
            ),

            // =================================================
            // SURGERY TYPE
            // =================================================
            _dropdown("Surgery Type", surgeryType, const ["primary", "redo"], (
              value,
            ) {
              surgeryType = value;
            }),

            // =================================================
            // URGENCY
            // =================================================
            _dropdown("Urgency", urgency, const ["planned", "emergency"], (
              value,
            ) {
              urgency = value;
            }),

            // =================================================
            // SURGICAL APPROACH
            // =================================================
            DropdownButtonFormField<SurgicalApproach>(
              initialValue: surgicalApproach,

              decoration: const InputDecoration(labelText: "Surgical Approach"),

              items: SurgicalApproach.values.map((e) {
                return DropdownMenuItem(value: e, child: Text(e.name));
              }).toList(),

              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    surgicalApproach = value;
                  });
                }
              },
            ),

            const SizedBox(height: 12),

            // =================================================
            // OPERATIVE ROLE
            // =================================================
            OperativeRoleSelector(
              value: operativeRole,

              onChanged: (role) {
                setState(() {
                  operativeRole = role;
                });
              },
            ),

            // =================================================
            // CPB
            // =================================================
            SwitchListTile(
              title: const Text("Cardiopulmonary Bypass Used"),

              value: cardiopulmonaryBypassUsed,

              onChanged: (value) {
                setState(() {
                  cardiopulmonaryBypassUsed = value;

                  if (!value) {
                    bypassTimeController.clear();

                    crossClampTimeController.clear();
                  }
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

            // =================================================
            // OUTCOME
            // =================================================
            DropdownButtonFormField<String>(
              initialValue: outcome,

              decoration: const InputDecoration(labelText: "Outcome"),

              items: Outcome.values.map((e) {
                return DropdownMenuItem(value: e.name, child: Text(e.name));
              }).toList(),

              onChanged: (value) {
                setState(() {
                  outcome = value;
                });
              },
            ),

            // =================================================
            // COMPLICATIONS
            // =================================================
            TextFormField(
              controller: complicationsController,

              maxLines: 3,

              decoration: const InputDecoration(labelText: "Complications"),
            ),

            // =================================================
            // NOTES
            // =================================================
            TextFormField(
              controller: notesController,

              maxLines: 4,

              decoration: const InputDecoration(labelText: "Additional Notes"),
            ),

            const SizedBox(height: 24),

            // =================================================
            // UPDATE
            // =================================================
            SizedBox(
              height: 50,

              child: ElevatedButton(
                onPressed: isSaving ? null : updateCase,

                child: isSaving
                    ? const SizedBox(
                        height: 22,
                        width: 22,

                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Update Case"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // DATE PICKER
  // =========================================================

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

  // =========================================================
  // GENERIC DROPDOWN
  // =========================================================

  Widget _dropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      initialValue: value,

      decoration: InputDecoration(labelText: label),

      items: items.map((item) {
        return DropdownMenuItem(
          value: item,

          child: Text(item[0].toUpperCase() + item.substring(1)),
        );
      }).toList(),

      onChanged: (value) {
        if (value == null) return;

        setState(() {
          onChanged(value);
        });
      },
    );
  }

  // =========================================================
  // UPDATE CASE
  // =========================================================

  Future<void> updateCase() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selection.primaryProcedure == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a primary procedure.")),
      );

      return;
    }

    final existing = widget.surgicalCase;

    setState(() {
      isSaving = true;
    });

    try {
      final updated = SurgicalCase(
        id: existing.id,

        patientId: existing.patientId,

        caseId: existing.caseId,

        surgeryDate: surgeryDate,

        diagnosis: diagnosisController.text.trim(),

        urgency: urgency,

        surgeryType: surgeryType,

        specialty: specialty,

        procedureIds: selectedProcedures
            .where((procedure) => procedure.id != null)
            .map((procedure) => procedure.id!)
            .toList(),

        surgicalApproach: surgicalApproach.name,

        approach: existing.approach,

        caseType: existing.caseType,

        complexity: existing.complexity,

        operativeRole: operativeRole.label,

        technicalSteps: existing.technicalSteps,

        cardiopulmonaryBypassUsed: cardiopulmonaryBypassUsed,

        bypassTimeMinutes: cardiopulmonaryBypassUsed
            ? int.tryParse(bypassTimeController.text)
            : null,

        crossClampTimeMinutes: cardiopulmonaryBypassUsed
            ? int.tryParse(crossClampTimeController.text)
            : null,

        graftConduitImplant: existing.graftConduitImplant,

        outcome: outcome ?? "",

        complications: complicationsController.text.trim().isEmpty
            ? null
            : complicationsController.text.trim(),

        notes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),

        createdAt: existing.createdAt,

        updatedAt: DateTime.now().toUtc(),
      );

      // Your current repository signature is:
      //
      // updateCase(SurgicalCase surgicalCase)
      //
      // Therefore the procedure selection cannot be passed here yet.
      await ref
          .read(surgicalCaseRepositoryProvider)
          .updateCase(updated, selection);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Case updated successfully")),
      );

      Navigator.pop(context);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Unable to update case: $error")));
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }
}
