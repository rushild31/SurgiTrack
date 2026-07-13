import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:surgitrack/features/cases/data/case_attachment_service.dart';
import 'package:surgitrack/features/cases/providers/case_attachment_provider.dart';

class AddCaseAttachmentButton extends ConsumerWidget {
  final int caseId;

  const AddCaseAttachmentButton({super.key, required this.caseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.attach_file),

      label: const Text("Add Attachment"),

      onPressed: () => _pickFile(context, ref),
    );
  }

  Future<void> _pickFile(BuildContext context, WidgetRef ref) async {
    File? selectedFile;

    final choice = await showModalBottomSheet<String>(
      context: context,

      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            ListTile(
              leading: const Icon(Icons.image),

              title: const Text("Choose Image"),

              onTap: () => Navigator.pop(context, "image"),
            ),

            ListTile(
              leading: const Icon(Icons.picture_as_pdf),

              title: const Text("Choose PDF"),

              onTap: () => Navigator.pop(context, "pdf"),
            ),
          ],
        );
      },
    );

    if (choice == null) return;

    if (choice == "image") {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      selectedFile = File(image.path);
    } else {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,

        allowedExtensions: ["pdf"],
      );

      if (result == null || result.files.single.path == null) {
        return;
      }

      selectedFile = File(result.files.single.path!);
    }

    if (!context.mounted) return;

    final filename = await _askFilename(context, selectedFile.path);

    if (filename == null || filename.trim().isEmpty) {
      return;
    }

    final service = CaseAttachmentService();

    final savedPath = await service.saveFile(
      file: selectedFile,

      caseId: caseId,

      fileName: filename.trim(),
    );

    await ref
        .read(caseAttachmentRepositoryProvider)
        .addAttachment(
          caseId: caseId,

          filePath: savedPath,

          fileType: selectedFile.path.split(".").last,

          displayName: filename.trim(),
        );

    ref.invalidate(caseAttachmentsProvider(caseId));
  }

  Future<String?> _askFilename(BuildContext context, String filePath) async {
    final controller = TextEditingController(
      text: filePath.split("/").last.split(".").first,
    );

    return showDialog<String>(
      context: context,

      builder: (_) {
        return AlertDialog(
          title: const Text("Attachment name"),

          content: TextField(
            controller: controller,

            decoration: const InputDecoration(hintText: "Eg. CABG OT Notes"),
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),

              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () => Navigator.pop(context, controller.text),

              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
