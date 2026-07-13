import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/procedures/providers/procedure_provider.dart';

import 'package:surgitrack/features/procedures/domain/procedure.dart';

class ProcedureSearchDelegate extends SearchDelegate<ProcedureEntity?> {
  final WidgetRef ref;

  ProcedureSearchDelegate(this.ref);

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

  @override
  Widget buildResults(BuildContext context) {
    return _results();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _results();
  }

  Widget _results() {
    final result = ref.watch(procedureSearchProvider(query));

    return result.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (e, s) => Center(child: Text(e.toString())),

      data: (procedures) {
        return ListView.builder(
          itemCount: procedures.length,

          itemBuilder: (context, index) {
            final procedure = procedures[index];

            return ListTile(
              title: Text(procedure.name),

              subtitle: Text(procedure.category),

              onTap: () {
                close(context, procedure);
              },
            );
          },
        );
      },
    );
  }
}
