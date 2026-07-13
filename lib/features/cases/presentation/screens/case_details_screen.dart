import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';

import 'package:surgitrack/features/cases/providers/case_procedure_provider.dart';

import 'package:surgitrack/features/cases/presentation/widgets/case_actions.dart';

import 'edit_case_screen.dart';

class CaseDetailsScreen extends ConsumerWidget {
  final SurgicalCase surgicalCase;

  const CaseDetailsScreen({super.key, required this.surgicalCase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final procedures = ref.watch(caseProceduresProvider(surgicalCase.id!));

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
          _field("Diagnosis", surgicalCase.diagnosis),

          _field("Specialty", surgicalCase.specialty),

          _field("Surgery Type", surgicalCase.surgeryType),

          _field("Role", surgicalCase.operativeRole),

          _field("Outcome", surgicalCase.outcome),

          const SizedBox(height: 20),

          const Text(
            "Procedures",

            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          procedures.when(
            data: (items) {
              if (items.isEmpty) {
                return const Text("No procedure linked");
              }

              return Column(
                children: items.map((item) {
                  return ListTile(
                    leading: const Icon(Icons.medical_services),

                    title: Text(item.procedure.name),

                    subtitle: Text(item.caseProcedure.type),
                  );
                }).toList(),
              );
            },

            loading: () => const CircularProgressIndicator(),

            error: (_, _) => const Text("Unable to load procedures"),
          ),
        ],
      ),
    );
  }

  Widget _field(String title, String value) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(value)),
    );
  }
}
