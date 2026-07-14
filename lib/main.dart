import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/app/app.dart';

import 'package:surgitrack/core/database/database_provider.dart';

import 'package:surgitrack/features/procedures/data/procedure_seed_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  final database = container.read(databaseProvider);

  await ProcedureSeedService.seedProcedures(database);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const SurgiTrackApp(),
    ),
  );
}
