import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/analytics/providers/analytics_provider.dart';

class ProcedureExposurePage extends ConsumerWidget {
  const ProcedureExposurePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exposure = ref.watch(procedureExposureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Procedure Exposure")),

      body: exposure.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, stack) {
          return Center(child: Text(error.toString()));
        },

        data: (procedures) {
          if (procedures.isEmpty) {
            return const Center(child: Text("No procedure exposure recorded"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),

            itemCount: procedures.length,

            itemBuilder: (context, index) {
              final procedure = procedures[index];

              return Card(
                child: ExpansionTile(
                  title: Text(procedure.procedureName),

                  subtitle: Text("Cases: ${procedure.totalCases}"),

                  children: [
                    _RoleTile(
                      label: "Observed",

                      value: procedure.roleCounts['observed'] ?? 0,
                    ),

                    _RoleTile(
                      label: "Assisted",

                      value: procedure.roleCounts['assisted'] ?? 0,
                    ),

                    _RoleTile(
                      label: "Performed under Supervision",

                      value:
                          procedure.roleCounts['performed_under_supervision'] ??
                          0,
                    ),

                    _RoleTile(
                      label: "Performed Independently",

                      value:
                          procedure.roleCounts['performed_independently'] ?? 0,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  final String label;

  final int value;

  const _RoleTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,

      title: Text(label),

      trailing: Text(value.toString()),
    );
  }
}
