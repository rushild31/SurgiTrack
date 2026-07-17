import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/app_preferences_page.dart';
import 'pages/data_management_page.dart';
import 'pages/security_page.dart';
import 'pages/developer_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Profile & Personalization",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          SettingsTile(
            icon: Icons.person,
            title: "Surgeon Profile",
            subtitle: "Manage professional information",
            onTap: () {
              // Existing Surgeon Profile module
              // Navigation will be connected
              // after route integration
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Data Management",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SettingsTile(
            icon: Icons.backup,
            title: "Backup & Restore",
            subtitle: "Create, import and restore backups",
            onTap: () {
              _showComingSoon(context, "Backup & Restore");
            },
          ),

          SettingsTile(
            icon: Icons.storage,
            title: "Database Management",
            subtitle: "Storage, attachments and maintenance",
            onTap: () {
              navigate(context, const DataManagementPage());
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Security & Privacy",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SettingsTile(
            icon: Icons.lock,
            title: "Security",
            subtitle: "PIN lock and privacy controls",
            onTap: () {
              navigate(context, const SecurityPage());
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Library & Reports",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SettingsTile(
            icon: Icons.library_books,
            title: "Library Management",
            subtitle: "Procedures and specialty packs",
            onTap: () {
              _showComingSoon(context, "Library Management");
            },
          ),

          SettingsTile(
            icon: Icons.description,
            title: "Report Preferences",
            subtitle: "Automatic reports and export settings",
            onTap: () {
              _showComingSoon(context, "Report Preferences");
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Account & Application",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SettingsTile(
            icon: Icons.cloud,
            title: "Cloud Account",
            subtitle: "Supabase sync and account management",
            onTap: () {
              _showComingSoon(context, "Cloud Account");
            },
          ),

          SettingsTile(
            icon: Icons.notifications,
            title: "Notifications",
            subtitle: "In-app alerts and reminders",
            onTap: () {
              navigate(context, const AppPreferencesPage());
            },
          ),

          SettingsTile(
            icon: Icons.info,
            title: "About SurgiTrack",
            subtitle: "Application information",
            onTap: () {
              navigate(context, const AboutPage());
            },
          ),

          SettingsTile(
            icon: Icons.code,
            title: "Developer",
            subtitle: "Development information",
            onTap: () {
              navigate(context, const DeveloperPage());
            },
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("$feature will be available soon")));
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const SettingsTile({
    super.key,

    required this.icon,

    required this.title,

    required this.subtitle,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),

      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text(subtitle),

        trailing: const Icon(Icons.chevron_right),

        onTap: onTap,
      ),
    );
  }
}
