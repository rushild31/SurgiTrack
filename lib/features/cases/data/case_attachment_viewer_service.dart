import 'dart:io';

import 'package:open_filex/open_filex.dart';

class CaseAttachmentViewerService {
  Future<void> openFile(String path) async {
    final file = File(path);

    if (!await file.exists()) {
      throw Exception("File not found");
    }

    await OpenFilex.open(path);
  }
}
