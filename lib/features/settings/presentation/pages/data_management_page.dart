import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/data/backup_repository.dart';
import 'package:surgitrack/features/settings/providers/storage_provider.dart';

class DataManagementPage extends ConsumerWidget {
  const DataManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(storageStatisticsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Data Management")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Backup & Restore",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.backup),

                  title: const Text("Create Local Backup"),

                  subtitle: const Text("Export SurgiTrack backup file"),

                  trailing: const Icon(Icons.chevron_right),

                  onTap: () async {
                    final repository = BackupRepository();

                    final file = await repository.createBackup();

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Backup created: ${file.path.split('/').last}",
                          ),
                        ),
                      );
                    }
                  },
                ),

                const ListTile(
                  leading: Icon(Icons.upload_file),

                  title: Text("Import Backup File"),

                  subtitle: Text("Available after backup sync module"),
                ),

                const ListTile(
                  leading: Icon(Icons.restore),

                  title: Text("Restore Backup"),

                  subtitle: Text("Available after backup sync module"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Cloud Sync",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.cloud_outlined),

                  title: Text("Supabase Cloud Sync"),

                  subtitle: Text("Will be enabled during deployment phase"),
                ),

                ListTile(
                  leading: Icon(Icons.sync_disabled),

                  title: Text("Sync Status"),

                  subtitle: Text("Not connected"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Storage Management",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Card(
            child: storage.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),

              error: (error, stack) => ListTile(
                leading: const Icon(Icons.error),

                title: const Text("Unable to load storage"),

                subtitle: Text(error.toString()),
              ),

              data: (stats) {
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.storage),

                      title: const Text("Application Storage"),

                      subtitle: Text(stats.databaseSizeFormatted),
                    ),

                    ListTile(
                      leading: const Icon(Icons.attach_file),

                      title: const Text("Attachments"),

                      subtitle: Text(
                        "${stats.attachmentCount} files • ${stats.attachmentSizeFormatted}",
                      ),
                    ),

                    ListTile(
                      leading: const Icon(Icons.cleaning_services),

                      title: const Text("Storage Cleanup"),

                      subtitle: const Text("Remove unused files"),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
