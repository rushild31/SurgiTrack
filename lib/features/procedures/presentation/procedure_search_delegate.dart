import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/procedure_provider.dart';

import 'procedure_details_screen.dart';

class ProcedureSearchDelegate extends SearchDelegate {
  final WidgetRef ref;

  ProcedureSearchDelegate(this.ref);

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Center(child: Text("Search procedures"));
    }

    final result = ref.watch(procedureSearchProvider(query));

    return result.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (e, _) => Center(child: Text(e.toString())),

      data: (procedures) {
        if (procedures.isEmpty) {
          return const Center(child: Text("No procedures found"));
        }

        return ListView.builder(
          itemCount: procedures.length,

          itemBuilder: (context, index) {
            final procedure = procedures[index];

            return ListTile(
              leading: const Icon(Icons.medical_services),

              title: Text(procedure.name),

              subtitle: Text("${procedure.specialty} • ${procedure.category}"),

              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                        ProcedureDetailsScreen(procedure: procedure),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),

        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),

      onPressed: () {
        close(context, null);
      },
    );
  }
}
