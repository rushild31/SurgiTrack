import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/settings/data/app_settings_repository.dart';
import 'package:surgitrack/features/settings/domain/app_settings.dart';

// =====================================================
// Repository Provider
// =====================================================

final appSettingsRepositoryProvider = Provider<AppSettingsRepository>((ref) {
  return AppSettingsRepository();
});

// =====================================================
// Settings State Provider
// =====================================================

final appSettingsProvider =
    StateNotifierProvider<AppSettingsNotifier, AsyncValue<AppSettings>>((ref) {
      final repository = ref.watch(appSettingsRepositoryProvider);

      return AppSettingsNotifier(repository);
    });

// =====================================================
// Application Lock State
// =====================================================

/// Tracks whether the current app session has been unlocked.
///
/// This resets to false whenever the application process starts again.
final appUnlockedProvider = StateProvider<bool>((ref) {
  return false;
});

// =====================================================
// Settings Controller
// =====================================================

class AppSettingsNotifier extends StateNotifier<AsyncValue<AppSettings>> {
  final AppSettingsRepository repository;

  AppSettingsNotifier(this.repository) : super(const AsyncValue.loading()) {
    loadSettings();
  }

  // =====================================================
  // Load Settings
  // =====================================================

  Future<void> loadSettings() async {
    try {
      final settings = await repository.getSettings();

      state = AsyncValue.data(settings);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  // =====================================================
  // Update Settings
  // =====================================================

  Future<void> updateSettings(AppSettings settings) async {
    await repository.saveSettings(settings);

    state = AsyncValue.data(settings);
  }

  // =====================================================
  // PIN SECURITY
  // =====================================================

  /// Converts a PIN into a SHA-256 hash.
  ///
  /// The raw PIN is never stored permanently.
  String _hashPin(String pin) {
    return sha256.convert(utf8.encode(pin)).toString();
  }

  /// Enables PIN lock after hashing the PIN.
  ///
  /// The raw PIN should be passed only temporarily from the
  /// PIN creation screen.
  Future<void> enablePinLock(String pin) async {
    final current = state.value ?? const AppSettings();

    final hashedPin = _hashPin(pin);

    final updated = current.copyWith(pinLockEnabled: true, pinHash: hashedPin);

    await updateSettings(updated);
  }

  /// Verifies a user-entered PIN against the stored hash.
  bool verifyPin(String pin) {
    final settings = state.value;

    if (settings == null ||
        !settings.pinLockEnabled ||
        settings.pinHash == null) {
      return false;
    }

    final enteredHash = _hashPin(pin);

    return enteredHash == settings.pinHash;
  }

  /// Disables PIN lock and removes the stored PIN hash.
  Future<void> disablePinLock() async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(pinLockEnabled: false, clearPinHash: true);

    await updateSettings(updated);
  }

  // =====================================================
  // CLOUD SYNC
  // Future Supabase Hooks
  // =====================================================

  /// Stores cloud account details after successful authentication.
  Future<void> updateCloudAccount({
    required String userId,
    required String email,
  }) async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(
      cloudSyncEnabled: true,
      cloudUserId: userId,
      cloudEmail: email,
    );

    await updateSettings(updated);
  }

  /// Updates the last successful synchronization timestamp.
  Future<void> updateLastSync(DateTime timestamp) async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(lastSyncedAt: timestamp);

    await updateSettings(updated);
  }

  /// Disconnects the cloud account and clears cloud metadata.
  Future<void> disconnectCloudAccount() async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(
      cloudSyncEnabled: false,
      clearCloudAccount: true,
      clearLastSyncedAt: true,
    );

    await updateSettings(updated);
  }
}
