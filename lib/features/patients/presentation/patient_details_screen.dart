import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/providers/patient_provider.dart';
import 'package:surgitrack/features/patients/providers/patient_attachment_provider.dart';
import 'package:surgitrack/features/patients/presentation/patient_form_screen.dart';
import 'package:surgitrack/features/patients/presentation/widgets/add_attachment_button.dart';
import 'package:surgitrack/features/patients/data/attachment_viewer_service.dart';
import 'package:surgitrack/features/patients/presentation/widgets/patient_cases_section.dart';

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
        title: Text(patient.name),

        actions: [
          IconButton(
            icon: const Icon(Icons.edit),

            onPressed: () async {
              final updated = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatientFormScreen(patient: patient),
                ),
              );

              if (updated == true) {
                ref.invalidate(patientListProvider);
              }
            },
          ),

          IconButton(
            icon: const Icon(Icons.delete),

            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,

                builder: (_) => AlertDialog(
                  title: const Text("Delete Patient"),

                  content: const Text(
                    "This will permanently remove this patient record.",
                  ),

                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),

                      child: const Text("Cancel"),
                    ),

                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),

                      child: const Text("Delete"),
                    ),
                  ],
                ),
              );

              if (confirm != true) return;

              await ref
                  .read(patientRepositoryProvider)
                  .deletePatient(patient.id!);

              ref.invalidate(patientListProvider);

              if (context.mounted) {
                Navigator.pop(context, true);
              }
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          _section("Basic Details", [
            _row("MRD", patient.hospitalId),

            _row("Age", "${patient.age} years"),

            _row("DOB", _date(patient.dateOfBirth)),

            _row("Blood Group", patient.bloodGroup ?? "-"),
          ]),

          _section("Clinical Profile", [
            _row(
              "EF",
              patient.ejectionFraction == null
                  ? "-"
                  : "${patient.ejectionFraction}%",
            ),

            _row("Address", patient.address ?? "-"),

            _row(
              "Admission",
              patient.admissionDate == null
                  ? "-"
                  : _date(patient.admissionDate!),
            ),
          ]),

          PatientCasesSection(patientId: patient.id!),

          _section("Comorbidities", [
            patient.comorbidities.isEmpty
                ? const Text("No comorbidities recorded")
                : Wrap(
                    spacing: 8,

                    children: patient.comorbidities
                        .map((e) => Chip(label: Text(e)))
                        .toList(),
                  ),
          ]),

          _section("Past Operative History", [
            Text(
              patient.pastOperativeHistory?.isNotEmpty == true
                  ? patient.pastOperativeHistory!
                  : "No previous history",
            ),
          ]),

          if (attachmentsAsync != null)
            _section("Attachments", [
              attachmentsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (error, stack) =>
                    Text("Error loading attachments\n$error"),

                data: (attachments) {
                  return Column(
                    children: [
                      if (attachments.isEmpty)
                        const ListTile(title: Text("No attachments added")),

                      ...attachments.map((attachment) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,

                          leading: Icon(
                            attachment.fileType.toLowerCase() == "pdf"
                                ? Icons.picture_as_pdf
                                : Icons.image,
                          ),

                          title: Text(attachment.displayName),

                          subtitle: Text(attachment.fileType),

                          onTap: () async {
                            await AttachmentViewerService().openFile(
                              attachment.filePath,
                            );
                          },

                          trailing: IconButton(
                            icon: const Icon(Icons.delete),

                            onPressed: () async {
                              await ref
                                  .read(patientAttachmentRepositoryProvider)
                                  .deleteAttachment(attachment);

                              ref.invalidate(
                                patientAttachmentsProvider(patient.id!),
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),

              const SizedBox(height: 12),

              AddAttachmentButton(patientId: patient.id!),
            ]),
        ],
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

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 120,

            child: Text(
              label,

              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  String _date(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
