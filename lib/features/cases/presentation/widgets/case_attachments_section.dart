import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/providers/case_attachment_provider.dart';
import 'package:surgitrack/features/cases/data/case_attachment_viewer_service.dart';
import 'package:surgitrack/features/cases/presentation/widgets/add_case_attachment_button.dart';

class CaseAttachmentsSection extends ConsumerWidget {
  final int caseId;

  const CaseAttachmentsSection({super.key, required this.caseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachments = ref.watch(caseAttachmentsProvider(caseId));

    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Attachments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            attachments.when(
              loading: () => const CircularProgressIndicator(),

              error: (_, _) => const Text("Unable to load attachments"),

              data: (items) {
                return Column(
                  children: [
                    if (items.isEmpty)
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("No attachments added"),
                      )
                    else
                      ...items.map((attachment) {
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
                            await CaseAttachmentViewerService().openFile(
                              attachment.filePath,
                            );
                          },

                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),

                            onPressed: () async {
                              await ref
                                  .read(caseAttachmentRepositoryProvider)
                                  .deleteAttachment(attachment);

                              ref.invalidate(caseAttachmentsProvider(caseId));
                            },
                          ),
                        );
                      }),

                    const SizedBox(height: 12),

                    AddCaseAttachmentButton(caseId: caseId),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
