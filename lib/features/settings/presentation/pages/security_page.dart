import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/providers/settings_provider.dart';

class SecurityPage extends ConsumerStatefulWidget {
  const SecurityPage({super.key});

  @override
  ConsumerState<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends ConsumerState<SecurityPage> {
  String selectedPinLength = "4";

  final pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  Future<void> savePin() async {
    if (pinController.text.length != int.parse(selectedPinLength)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PIN must be $selectedPinLength digits")),
      );

      return;
    }

    await ref
        .read(appSettingsProvider.notifier)
        .enablePinLock(pinController.text);

    pinController.clear();

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("PIN Lock enabled")));
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Security")),

      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => Center(child: Text(error.toString())),

        data: (settings) {
          return ListView(
            padding: const EdgeInsets.all(16),

            children: [
              Card(
                child: SwitchListTile(
                  title: const Text("PIN Lock"),

                  subtitle: const Text(
                    "Protect SurgiTrack using a personal PIN",
                  ),

                  value: settings.pinLockEnabled,

                  onChanged: (enabled) async {
                    if (enabled) {
                      await savePin();
                    } else {
                      await ref
                          .read(appSettingsProvider.notifier)
                          .disablePinLock();

                      pinController.clear();
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),

              if (!settings.pinLockEnabled) ...[
                const Text(
                  "Create PIN",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  initialValue: selectedPinLength,

                  decoration: const InputDecoration(
                    labelText: "PIN Length",
                    border: OutlineInputBorder(),
                  ),

                  items: const [
                    DropdownMenuItem(value: "4", child: Text("4 Digit PIN")),

                    DropdownMenuItem(value: "6", child: Text("6 Digit PIN")),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedPinLength = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: pinController,

                  keyboardType: TextInputType.number,

                  obscureText: true,

                  maxLength: int.parse(selectedPinLength),

                  decoration: const InputDecoration(
                    labelText: "Enter PIN",

                    border: OutlineInputBorder(),
                  ),
                ),

                ElevatedButton(
                  onPressed: savePin,

                  child: const Text("Enable PIN Lock"),
                ),
              ] else ...[
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.lock),

                    title: const Text("PIN Protection Active"),

                    subtitle: Text(
                      "Your app is protected with a $selectedPinLength digit PIN",
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                OutlinedButton(
                  onPressed: () {
                    ref.read(appSettingsProvider.notifier).disablePinLock();
                  },

                  child: const Text("Disable PIN Lock"),
                ),
              ],

              const SizedBox(height: 30),

              const Text(
                "Cloud Authentication",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.cloud),

                  title: Text(
                    settings.cloudSyncEnabled
                        ? "Cloud Account Connected"
                        : "Cloud Authentication Pending",
                  ),

                  subtitle: Text(
                    settings.cloudSyncEnabled
                        ? settings.cloudEmail ?? ""
                        : "Supabase authentication groundwork ready",
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
