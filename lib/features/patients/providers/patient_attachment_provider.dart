import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/patients/data/patient_attachment_repository.dart';

final patientAttachmentRepositoryProvider =
    Provider<PatientAttachmentRepository>((ref) {
      return PatientAttachmentRepository(ref.watch(databaseProvider));
    });

final patientAttachmentsProvider =
    StreamProvider.family<List<PatientAttachmentData>, int>((ref, patientId) {
      return ref
          .watch(patientAttachmentRepositoryProvider)
          .watchAttachments(patientId);
    });
