import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/security_repository.dart';

import '../domain/security_settings.dart';

final securityRepositoryProvider = Provider<SecurityRepository>((ref) {
  return SecurityRepository();
});

final securityProvider =
    StateNotifierProvider<SecurityNotifier, SecuritySettings>((ref) {
      final repository = ref.watch(securityRepositoryProvider);

      return SecurityNotifier(repository);
    });

class SecurityNotifier extends StateNotifier<SecuritySettings> {
  final SecurityRepository repository;

  SecurityNotifier(this.repository) : super(const SecuritySettings()) {
    load();
  }

  Future<void> load() async {
    state = await repository.getSettings();
  }

  Future<void> enablePin(String pin) async {
    await repository.savePin(pin);

    state = await repository.getSettings();
  }

  Future<void> disablePin() async {
    await repository.disablePin();

    state = await repository.getSettings();
  }

  Future<bool> verifyPin(String pin) async {
    return repository.verifyPin(pin);
  }
}
