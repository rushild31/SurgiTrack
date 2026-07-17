import 'package:flutter/material.dart';

class DataManagementPage extends StatelessWidget {
  const DataManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  subtitle: const Text("Save database backup file"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                ListTile(
                  leading: const Icon(Icons.upload_file),
                  title: const Text("Import Backup File"),
                  subtitle: const Text("Select previous backup file"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                ListTile(
                  leading: const Icon(Icons.restore),
                  title: const Text("Restore Backup"),
                  subtitle: const Text("Restore SurgiTrack database"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
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
              children: [
                const ListTile(
                  leading: Icon(Icons.cloud_done),
                  title: Text("Supabase Sync Status"),
                  subtitle: Text("Not connected"),
                ),

                const ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text("Last Synced"),
                  subtitle: Text("Never"),
                ),

                ListTile(
                  leading: const Icon(Icons.sync),
                  title: const Text("Manual Sync"),
                  subtitle: const Text("Sync data with cloud"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
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
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.storage),
                  title: Text("Database Size"),
                  subtitle: Text("Calculating..."),
                ),

                const ListTile(
                  leading: Icon(Icons.attach_file),
                  title: Text("Attachments"),
                  subtitle: Text("Manage stored attachments"),
                ),

                ListTile(
                  leading: const Icon(Icons.cleaning_services),
                  title: const Text("Storage Cleanup"),
                  subtitle: const Text("Remove unnecessary files"),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
