import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/providers/settings_provider.dart';

class CloudAccountPage extends ConsumerWidget {
  const CloudAccountPage({super.key});

  String _formatDate(DateTime? date) {
    if (date == null) {
      return "Never";
    }

    return "${date.day}/"
        "${date.month}/"
        "${date.year} "
        "${date.hour}:"
        "${date.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Cloud Account")),

      body: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => Center(child: Text(error.toString())),

        data: (appSettings) {
          return ListView(
            padding: const EdgeInsets.all(16),

            children: [
              const Text(
                "Supabase Cloud Sync",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Icon(
                            appSettings.cloudSyncEnabled
                                ? Icons.cloud_done
                                : Icons.cloud_off,
                          ),

                          const SizedBox(width: 12),

                          Text(
                            appSettings.cloudSyncEnabled
                                ? "Connected"
                                : "Not Connected",

                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Text(
                        "Account Email: "
                        "${appSettings.cloudEmail ?? "-"}",
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "User ID: "
                        "${appSettings.cloudUserId ?? "-"}",
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Last Sync: "
                        "${_formatDate(appSettings.lastSyncedAt)}",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                icon: const Icon(Icons.login),

                label: const Text("Connect Account"),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Supabase authentication will be enabled in future update",
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                icon: const Icon(Icons.sync),

                label: const Text("Sync Now"),

                onPressed: appSettings.cloudSyncEnabled
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Manual sync will be available after cloud integration",
                            ),
                          ),
                        );
                      }
                    : null,
              ),

              const SizedBox(height: 24),

              const Text(
                "Future Cloud Features",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const ListTile(
                leading: Icon(Icons.devices),

                title: Text("Multi-device Access"),

                subtitle: Text("Use SurgiTrack on laptop, phone and tablet"),
              ),

              const ListTile(
                leading: Icon(Icons.backup),

                title: Text("Automatic Cloud Backup"),

                subtitle: Text("Protect portfolio data from device loss"),
              ),

              const ListTile(
                leading: Icon(Icons.sync),

                title: Text("Background Synchronization"),

                subtitle: Text(
                  "Keep local database and cloud database synchronized",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
