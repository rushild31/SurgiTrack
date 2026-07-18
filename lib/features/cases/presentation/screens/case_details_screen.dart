import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';
import 'package:surgitrack/features/cases/providers/case_procedure_provider.dart';

import 'package:surgitrack/features/cases/presentation/widgets/case_actions.dart';
import 'package:surgitrack/features/cases/presentation/widgets/case_attachments_section.dart';

import 'edit_case_screen.dart';

class CaseDetailsScreen extends ConsumerWidget {
  final SurgicalCase surgicalCase;

  const CaseDetailsScreen({super.key, required this.surgicalCase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final procedures = surgicalCase.id == null
        ? null
        : ref.watch(caseProceduresProvider(surgicalCase.id!));

    return Scaffold(
      appBar: AppBar(
        title: Text(surgicalCase.caseId),

        actions: [
          IconButton(
            icon: const Icon(Icons.edit),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditCaseScreen(surgicalCase: surgicalCase),
                ),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.delete),

            onPressed: () {
              CaseActions.deleteCase(context, ref, surgicalCase);
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          _headerCard(),

          _section("Clinical Details", [
            _field("Diagnosis", surgicalCase.diagnosis),

            _field("Specialty", surgicalCase.specialty),

            _field("Case Type", surgicalCase.caseType ?? "-"),

            _field("Complexity", surgicalCase.complexity ?? "-"),

            _field("Surgery Type", surgicalCase.surgeryType),

            _field("Urgency", surgicalCase.urgency),

            _field("Operative Role", surgicalCase.operativeRole),

            _field("Outcome", surgicalCase.outcome),
          ]),

          _section("Operative Details", [
            _field(
              "Approach",
              surgicalCase.approach ?? surgicalCase.surgicalApproach ?? "",
            ),

            _field(
              "CPB Used",
              surgicalCase.cardiopulmonaryBypassUsed ? "Yes" : "No",
            ),

            if (surgicalCase.cardiopulmonaryBypassUsed)
              _field(
                "Bypass Time",
                surgicalCase.bypassTimeMinutes == null
                    ? "-"
                    : "${surgicalCase.bypassTimeMinutes} min",
              ),

            if (surgicalCase.cardiopulmonaryBypassUsed)
              _field(
                "Cross Clamp Time",
                surgicalCase.crossClampTimeMinutes == null
                    ? "-"
                    : "${surgicalCase.crossClampTimeMinutes} min",
              ),

            _field("Technical Steps", surgicalCase.technicalSteps ?? ""),

            _field(
              "Graft / Conduit / Implant",
              surgicalCase.graftConduitImplant ?? "",
            ),
          ]),

          if (surgicalCase.complications != null &&
              surgicalCase.complications!.isNotEmpty)
            _section("Complications", [Text(surgicalCase.complications!)]),

          _section("Procedures", [
            if (procedures == null)
              const Text("Procedures unavailable")
            else
              procedures.when(
                loading: () => const CircularProgressIndicator(),

                error: (_, _) => const Text("Unable to load procedures"),

                data: (items) {
                  if (items.isEmpty) {
                    return const Text("No procedures linked");
                  }

                  return Column(
                    children: items.map((item) {
                      final primary = item.caseProcedure.type == "PRIMARY";

                      return ListTile(
                        contentPadding: EdgeInsets.zero,

                        leading: Icon(
                          primary ? Icons.star : Icons.medical_services,
                        ),

                        title: Text(item.procedure.name),

                        subtitle: Text(
                          primary
                              ? "Primary Procedure"
                              : "Associated Procedure",
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
          ]),

          if (surgicalCase.notes != null && surgicalCase.notes!.isNotEmpty)
            _section("Additional Notes", [Text(surgicalCase.notes!)]),

          if (surgicalCase.id != null)
            CaseAttachmentsSection(caseId: surgicalCase.id!),
        ],
      ),
    );
  }

  Widget _headerCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              surgicalCase.caseId,

              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(_date(surgicalCase.surgeryDate)),

            const SizedBox(height: 8),

            Text(
              "${surgicalCase.specialty} • "
              "${surgicalCase.operativeRole}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,

              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ...children,
          ],
        ),
      ),
    );
  }

  Widget _field(String label, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),

      subtitle: Text(value.isEmpty ? "-" : value),
    );
  }

  String _date(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
