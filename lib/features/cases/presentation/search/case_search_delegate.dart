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
          tooltip: 'Clear search',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    final searchTerm = query.trim().toLowerCase();

    if (searchTerm.isEmpty) {
      return const Center(child: Text('Search your operative logbook'));
    }

    final results = cases.where((surgicalCase) {
      return _matchesSearch(surgicalCase, searchTerm);
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No matching cases found', textAlign: TextAlign.center),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: results.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final surgicalCase = results[index];

        return ListTile(
          leading: CircleAvatar(
            child: Icon(_specialtyIcon(surgicalCase.specialty)),
          ),
          title: Text(
            surgicalCase.caseId,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _buildSubtitle(surgicalCase),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            close(context, surgicalCase);
          },
        );
      },
    );
  }

  bool _matchesSearch(SurgicalCase surgicalCase, String searchTerm) {
    final searchableFields = <String>[
      surgicalCase.caseId,
      surgicalCase.diagnosis,
      surgicalCase.urgency,
      surgicalCase.surgeryType,
      surgicalCase.specialty,
      surgicalCase.surgicalApproach ?? '',
      surgicalCase.approach ?? '',
      surgicalCase.caseType ?? '',
      surgicalCase.complexity ?? '',
      surgicalCase.operativeRole,
      surgicalCase.outcome,
      surgicalCase.graftConduitImplant ?? '',
      surgicalCase.complications ?? '',
      surgicalCase.notes ?? '',
      surgicalCase.cardiopulmonaryBypassUsed ? 'on pump' : 'off pump',
      surgicalCase.cardiopulmonaryBypassUsed ? 'cpb' : 'no cpb',
    ];

    return searchableFields.any(
      (field) => field.toLowerCase().contains(searchTerm),
    );
  }

  String _buildSubtitle(SurgicalCase surgicalCase) {
    final parts = <String>[
      if (surgicalCase.diagnosis.trim().isNotEmpty)
        surgicalCase.diagnosis.trim(),

      if (surgicalCase.specialty.trim().isNotEmpty)
        surgicalCase.specialty.trim(),

      if (surgicalCase.operativeRole.trim().isNotEmpty)
        surgicalCase.operativeRole.trim(),
    ];

    return parts.join(' • ');
  }

  IconData _specialtyIcon(String specialty) {
    switch (specialty.trim().toLowerCase()) {
      case 'cardiac':
      case 'cardiothoracic':
        return Icons.favorite_outline;

      case 'thoracic':
        return Icons.air_outlined;

      case 'vascular':
        return Icons.bloodtype_outlined;

      default:
        return Icons.medical_services_outlined;
    }
  }
}
