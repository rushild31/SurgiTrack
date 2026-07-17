import 'package:shared_preferences/shared_preferences.dart';

import 'package:surgitrack/features/settings/domain/app_settings.dart';

class AppSettingsRepository {
  static const String _ageDisplayKey = "age_display";

  static const String _autoReportGenerationKey = "auto_report_generation";

  static const String _reportFrequencyKey = "report_frequency";

  // ===============================
  // Security
  // ===============================

  static const String _pinLockEnabledKey = "pin_lock_enabled";

  static const String _pinHashKey = "pin_hash";

  // ===============================
  // Cloud Authentication / Sync
  // ===============================

  static const String _cloudSyncEnabledKey = "cloud_sync_enabled";

  static const String _cloudUserIdKey = "cloud_user_id";

  static const String _cloudEmailKey = "cloud_email";

  static const String _lastSyncedAtKey = "last_synced_at";

  Future<AppSettings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettings(
      ageDisplay: prefs.getString(_ageDisplayKey) ?? "Years",

      autoReportGeneration: prefs.getBool(_autoReportGenerationKey) ?? true,

      reportFrequency: prefs.getString(_reportFrequencyKey) ?? "Monthly",

      // Security
      pinLockEnabled: prefs.getBool(_pinLockEnabledKey) ?? false,

      pinHash: prefs.getString(_pinHashKey),

      // Cloud
      cloudSyncEnabled: prefs.getBool(_cloudSyncEnabledKey) ?? false,

      cloudUserId: prefs.getString(_cloudUserIdKey),

      cloudEmail: prefs.getString(_cloudEmailKey),

      lastSyncedAt: _parseDate(prefs.getString(_lastSyncedAtKey)),
    );
  }

  Future<void> saveSettings(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();

    // ===============================
    // Display
    // ===============================

    await prefs.setString(_ageDisplayKey, settings.ageDisplay);

    // ===============================
    // Reports
    // ===============================

    await prefs.setBool(
      _autoReportGenerationKey,
      settings.autoReportGeneration,
    );

    await prefs.setString(_reportFrequencyKey, settings.reportFrequency);

    // ===============================
    // Security
    // ===============================

    await prefs.setBool(_pinLockEnabledKey, settings.pinLockEnabled);

    if (settings.pinHash != null) {
      await prefs.setString(_pinHashKey, settings.pinHash!);
    } else {
      await prefs.remove(_pinHashKey);
    }

    // ===============================
    // Cloud Sync
    // ===============================

    await prefs.setBool(_cloudSyncEnabledKey, settings.cloudSyncEnabled);

    if (settings.cloudUserId != null) {
      await prefs.setString(_cloudUserIdKey, settings.cloudUserId!);
    } else {
      await prefs.remove(_cloudUserIdKey);
    }

    if (settings.cloudEmail != null) {
      await prefs.setString(_cloudEmailKey, settings.cloudEmail!);
    } else {
      await prefs.remove(_cloudEmailKey);
    }

    if (settings.lastSyncedAt != null) {
      await prefs.setString(
        _lastSyncedAtKey,
        settings.lastSyncedAt!.toIso8601String(),
      );
    } else {
      await prefs.remove(_lastSyncedAtKey);
    }
  }

  Future<void> clearSettings() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }

  DateTime? _parseDate(String? value) {
    if (value == null) {
      return null;
    }

    return DateTime.tryParse(value);
  }
}
