import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/procedure_provider.dart';

import 'procedure_search.dart';

import 'widgets/procedure_tile.dart';

class ProcedureLibraryScreen extends ConsumerStatefulWidget {
  const ProcedureLibraryScreen({super.key});

  @override
  ConsumerState<ProcedureLibraryScreen> createState() =>
      _ProcedureLibraryScreenState();
}

class _ProcedureLibraryScreenState
    extends ConsumerState<ProcedureLibraryScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final proceduresAsync = ref.watch(procedureListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Procedure Library")),

      body: proceduresAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (procedures) {
          final filtered = procedures.where((procedure) {
            if (searchQuery.isEmpty) {
              return true;
            }

            final query = searchQuery.toLowerCase();

            return procedure.name.toLowerCase().contains(query) ||
                procedure.category.toLowerCase().contains(query) ||
                procedure.specialty.toLowerCase().contains(query);
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),

                child: ProcedureSearch(
                  procedures: procedures,

                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  itemCount: filtered.length,

                  itemBuilder: (context, index) {
                    return ProcedureTile(procedure: filtered[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
