import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drift/drift.dart' show Value;
import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/patients/data/patient_attachment_service.dart';
import 'package:surgitrack/features/patients/providers/patient_attachment_provider.dart';

class AddAttachmentButton extends ConsumerWidget {
  final int patientId;

  const AddAttachmentButton({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      icon: const Icon(Icons.upload_file),
      label: const Text("Add Attachment"),
      onPressed: () => _pickFile(context, ref),
    );
  }

  Future<void> _pickFile(BuildContext context, WidgetRef ref) async {
    File? selectedFile;

    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
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
        allowedExtensions: ['pdf'],
      );

      if (result == null || result.files.single.path == null) {
        return;
      }

      selectedFile = File(result.files.single.path!);
    }

    // ignore: use_build_context_synchronously
    final filename = await _askFilename(context, selectedFile.path);

    if (filename == null || filename.trim().isEmpty) {
      return;
    }

    final service = PatientAttachmentService();

    final savedPath = await service.saveFile(
      file: selectedFile,
      patientId: patientId,
      fileName: filename.trim(),
    );

    await ref
        .read(patientAttachmentRepositoryProvider)
        .addAttachment(
          PatientAttachmentsCompanion(
            patientId: Value(patientId),
            displayName: Value(filename.trim()),
            filePath: Value(savedPath),
            fileType: Value(selectedFile.path.split('.').last),
          ),
        );

    ref.invalidate(patientAttachmentsProvider(patientId));
  }

  Future<String?> _askFilename(BuildContext context, String path) async {
    final controller = TextEditingController(
      text: path.split('/').last.split('.').first,
    );

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Attachment name"),

          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Eg. Echo 2026"),
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
