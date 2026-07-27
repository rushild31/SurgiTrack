import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/providers/settings_provider.dart';

class PinLockScreen extends ConsumerStatefulWidget {
  final VoidCallback onUnlocked;

  const PinLockScreen({super.key, required this.onUnlocked});

  @override
  ConsumerState<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends ConsumerState<PinLockScreen> {
  final TextEditingController pinController = TextEditingController();

  String? errorMessage;

  bool isLoading = false;

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  Future<void> _unlock() async {
    final pin = pinController.text.trim();

    if (pin.isEmpty) {
      setState(() {
        errorMessage = 'Enter your PIN';
      });

      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final isCorrect = ref.read(appSettingsProvider.notifier).verifyPin(pin);

    if (!mounted) return;

    if (isCorrect) {
      widget.onUnlocked();
      return;
    }

    setState(() {
      isLoading = false;
      errorMessage = 'Incorrect PIN';
      pinController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Icon(Icons.lock_outline, size: 72),

                  const SizedBox(height: 24),

                  Text(
                    'SurgiTrack Locked',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Enter your PIN to continue',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  TextField(
                    controller: pinController,

                    autofocus: true,

                    obscureText: true,

                    keyboardType: TextInputType.number,

                    textAlign: TextAlign.center,

                    onSubmitted: (_) => _unlock(),

                    decoration: InputDecoration(
                      labelText: 'PIN',

                      border: const OutlineInputBorder(),

                      errorText: errorMessage,

                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,

                    child: FilledButton(
                      onPressed: isLoading ? null : _unlock,

                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Unlock'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
