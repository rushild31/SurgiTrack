import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/providers/settings_provider.dart';

class AppPreferencesPage extends ConsumerWidget {
  const AppPreferencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("App Preferences")),

      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => Center(child: Text(error.toString())),

        data: (settings) {
          return ListView(
            padding: const EdgeInsets.all(16),

            children: [
              const Text(
                "Display Preferences",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                initialValue: settings.ageDisplay,

                decoration: const InputDecoration(
                  labelText: "Age Display",
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(value: "Years", child: Text("Years")),
                ],

                onChanged: (value) {
                  if (value == null) return;

                  ref
                      .read(appSettingsProvider.notifier)
                      .updateSettings(settings.copyWith(ageDisplay: value));
                },
              ),

              const SizedBox(height: 25),

              const Text(
                "Reports",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              SwitchListTile(
                title: const Text("Automatic Report Generation"),

                subtitle: const Text(
                  "Generate monthly, quarterly and annual reports",
                ),

                value: settings.autoReportGeneration,

                onChanged: (value) {
                  ref
                      .read(appSettingsProvider.notifier)
                      .updateSettings(
                        settings.copyWith(autoReportGeneration: value),
                      );
                },
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                initialValue: settings.reportFrequency,

                decoration: const InputDecoration(
                  labelText: "Report Frequency",
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(value: "Monthly", child: Text("Monthly")),

                  DropdownMenuItem(
                    value: "Quarterly",
                    child: Text("Quarterly"),
                  ),

                  DropdownMenuItem(
                    value: "6 Monthly",
                    child: Text("6 Monthly"),
                  ),

                  DropdownMenuItem(value: "Annual", child: Text("Annual")),
                ],

                onChanged: (value) {
                  if (value == null) return;

                  ref
                      .read(appSettingsProvider.notifier)
                      .updateSettings(
                        settings.copyWith(reportFrequency: value),
                      );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
