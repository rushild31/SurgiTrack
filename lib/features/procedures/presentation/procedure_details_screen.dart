import 'package:flutter/material.dart';

import '../domain/procedure.dart';

class ProcedureDetailsScreen extends StatelessWidget {
  final ProcedureEntity procedure;

  const ProcedureDetailsScreen({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(procedure.name)),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          _headerCard(),

          if (procedure.description != null)
            _section("Description", [Text(procedure.description!)]),

          _section("Procedure Information", [
            _field("Specialty", procedure.specialty),

            _field("Category", procedure.category),

            _field("Procedure ID", procedure.procedureId),
          ]),

          _section("Applicable Features", [
            _flag("Requires CPB", procedure.supportsCPB),

            _flag("Redo Applicable", procedure.supportsRedo),

            _flag("Emergency Applicable", procedure.supportsEmergency),

            _flag(
              "Technical Steps Available",
              procedure.supportsTechnicalSteps,
            ),
          ]),

          if (procedure.dynamicFields.isNotEmpty)
            _listSection("Dynamic Fields", procedure.dynamicFields),

          if (procedure.technicalSteps.isNotEmpty)
            _listSection("Technical Steps", procedure.technicalSteps),

          if (procedure.associatedProcedures.isNotEmpty)
            _listSection(
              "Associated Procedures",
              procedure.associatedProcedures,
            ),

          if (procedure.aliases.isNotEmpty)
            _listSection("Aliases", procedure.aliases),
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
              procedure.name,

              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(procedure.specialty),
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

      title: Text(label),

      subtitle: Text(value),
    );
  }

  Widget _flag(String label, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Icon(value ? Icons.check_circle : Icons.cancel_outlined),

      title: Text(label),
    );
  }

  Widget _listSection(String title, List<String> items) {
    return _section(
      title,

      items
          .map(
            (e) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.check),
              title: Text(e),
            ),
          )
          .toList(),
    );
  }
}
