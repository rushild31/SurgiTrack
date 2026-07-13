import 'package:flutter/material.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';

class CaseSearchDelegate extends SearchDelegate<SurgicalCase?> {
  final List<SurgicalCase> cases;

  CaseSearchDelegate(this.cases);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),

          onPressed: () {
            query = "";
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),

      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults();
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults();
  }

  Widget _buildResults() {
    final search = query.toLowerCase();

    final results = cases.where((c) {
      return c.caseId.toLowerCase().contains(search) ||
          c.diagnosis.toLowerCase().contains(search) ||
          c.specialty.toLowerCase().contains(search);
    }).toList();

    return ListView.builder(
      itemCount: results.length,

      itemBuilder: (context, index) {
        final surgicalCase = results[index];

        return ListTile(
          title: Text(surgicalCase.caseId),

          subtitle: Text(surgicalCase.diagnosis),

          onTap: () {
            close(context, surgicalCase);
          },
        );
      },
    );
  }
}
