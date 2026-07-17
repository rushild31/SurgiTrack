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
// Settings Controller
// =====================================================

class AppSettingsNotifier extends StateNotifier<AsyncValue<AppSettings>> {
  final AppSettingsRepository repository;

  AppSettingsNotifier(this.repository) : super(const AsyncValue.loading()) {
    loadSettings();
  }

  // ===============================
  // Load Settings
  // ===============================

  Future<void> loadSettings() async {
    try {
      final settings = await repository.getSettings();

      state = AsyncValue.data(settings);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  // ===============================
  // Update Settings
  // ===============================

  Future<void> updateSettings(AppSettings settings) async {
    await repository.saveSettings(settings);

    state = AsyncValue.data(settings);
  }

  // ===============================
  // Security
  // ===============================

  Future<void> enablePinLock(String pinHash) async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(pinLockEnabled: true, pinHash: pinHash);

    await updateSettings(updated);
  }

  Future<void> disablePinLock() async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(pinLockEnabled: false, clearPinHash: true);

    await updateSettings(updated);
  }

  // ===============================
  // Cloud Sync
  // Future Supabase hooks
  // ===============================

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

  Future<void> updateLastSync(DateTime timestamp) async {
    final current = state.value ?? const AppSettings();

    final updated = current.copyWith(lastSyncedAt: timestamp);

    await updateSettings(updated);
  }

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
