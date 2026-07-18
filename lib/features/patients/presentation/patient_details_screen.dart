import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/providers/patient_provider.dart';
import 'package:surgitrack/features/patients/providers/patient_attachment_provider.dart';
import 'package:surgitrack/features/patients/providers/patient_case_provider.dart';
import 'package:surgitrack/features/patients/presentation/patient_form_screen.dart';
import 'package:surgitrack/features/patients/presentation/widgets/add_attachment_button.dart';
import 'package:surgitrack/features/patients/presentation/widgets/patient_cases_section.dart';
import 'package:surgitrack/features/patients/data/attachment_viewer_service.dart';
import 'package:surgitrack/features/cases/presentation/screens/add_case_screen.dart';

class PatientDetailsScreen extends ConsumerWidget {
  final Patient patient;
  const PatientDetailsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachmentsAsync = patient.id == null
        ? null
        : ref.watch(patientAttachmentsProvider(patient.id!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatientFormScreen(patient: patient),
                ),
              );
              if (updated == true) ref.invalidate(patientListProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Patient'),
                  content: const Text(
                    'This will permanently remove this patient record.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
              if (ok != true) return;
              await ref
                  .read(patientRepositoryProvider)
                  .deletePatient(patient.id!);
              ref.invalidate(patientListProvider);
              if (context.mounted) Navigator.pop(context, true);
            },
          ),
        ],
      ),
      floatingActionButton: patient.id == null
          ? null
          : FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text("Add Case"),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddCaseScreen(patient: patient),
                  ),
                );
                ref.invalidate(patientCasesProvider(patient.id!));
              },
            ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(label: Text("MRD: ${patient.hospitalId}")),
                      Chip(label: Text("${patient.age} yrs")),
                      Chip(label: Text(patient.sex)),
                      Chip(label: Text(patient.bloodGroup ?? "-")),
                    ],
                  ),
                ],
              ),
            ),
          ),
          _section("Basic Information", [
            _row("Date of Birth", _date(patient.dateOfBirth)),
            _row("Age", "${patient.age} years"),
            _row("Sex", patient.sex),
            _row("Hospital ID", patient.hospitalId),
          ]),
          _section("Clinical Information", [
            _row(
              "Ejection Fraction",
              patient.ejectionFraction == null
                  ? "-"
                  : "${patient.ejectionFraction}%",
            ),
            _row(
              "Admission",
              patient.admissionDate == null
                  ? "-"
                  : _date(patient.admissionDate!),
            ),
            _row(
              "Address",
              patient.address?.isNotEmpty == true ? patient.address! : "-",
            ),
          ]),
          if (patient.comorbidities.isNotEmpty)
            _section("Comorbidities", [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: patient.comorbidities
                    .map((e) => Chip(label: Text(e)))
                    .toList(),
              ),
            ]),
          _section("Past Operative History", [
            Text(
              patient.pastOperativeHistory?.isNotEmpty == true
                  ? patient.pastOperativeHistory!
                  : "No previous operative history recorded.",
            ),
          ]),
          if (patient.id != null) PatientCasesSection(patientId: patient.id!),
          if (attachmentsAsync != null)
            _section("Attachments", [
              attachmentsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Text(e.toString()),
                data: (attachments) => Column(
                  children: [
                    if (attachments.isEmpty)
                      const ListTile(title: Text("No attachments added")),
                    ...attachments.map(
                      (a) => ListTile(
                        leading: Icon(
                          a.fileType.toLowerCase() == "pdf"
                              ? Icons.picture_as_pdf
                              : Icons.image_outlined,
                        ),
                        title: Text(a.displayName),
                        subtitle: Text(a.fileType.toUpperCase()),
                        onTap: () =>
                            AttachmentViewerService().openFile(a.filePath),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () async {
                            await ref
                                .read(patientAttachmentRepositoryProvider)
                                .deleteAttachment(a);
                            ref.invalidate(
                              patientAttachmentsProvider(patient.id!),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AddAttachmentButton(patientId: patient.id!),
            ]),
        ],
      ),
    );
  }

  Widget _section(String title, List<Widget> children) => Card(
    margin: const EdgeInsets.only(top: 16),
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

  Widget _row(String l, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(l, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        Expanded(child: Text(v)),
      ],
    ),
  );

  String _date(DateTime d) => "${d.day}-${d.month}-${d.year}";
}

class PatientDetailsRouteWrapper extends ConsumerWidget {
  final String patientId;

  const PatientDetailsRouteWrapper({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientFuture = ref
        .read(patientRepositoryProvider)
        .getPatientById(int.parse(patientId));

    return FutureBuilder(
      future: patientFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text("Patient")),
            body: Center(child: Text(snapshot.error.toString())),
          );
        }

        final patient = snapshot.data;

        if (patient == null) {
          return const Scaffold(body: Center(child: Text("Patient not found")));
        }

        return PatientDetailsScreen(patient: patient);
      },
    );
  }
}
