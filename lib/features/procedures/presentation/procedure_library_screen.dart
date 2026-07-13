import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/procedures/providers/procedure_provider.dart';

import 'package:surgitrack/features/procedures/presentation/procedure_search_delegate.dart';

class ProcedureLibraryScreen extends ConsumerWidget {
  const ProcedureLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proceduresAsync = ref.watch(procedureListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Procedure Library"),

        actions: [
          IconButton(
            icon: const Icon(Icons.search),

            onPressed: () {
              showSearch(
                context: context,

                delegate: ProcedureSearchDelegate(ref),
              );
            },
          ),
        ],
      ),

      body: proceduresAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (procedures) {
          if (procedures.isEmpty) {
            return const Center(child: Text("No procedures added yet"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),

            itemCount: procedures.length,

            itemBuilder: (context, index) {
              final procedure = procedures[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.medical_services),

                  title: Text(procedure.name),

                  subtitle: Text(
                    "${procedure.specialty} • ${procedure.category}",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
