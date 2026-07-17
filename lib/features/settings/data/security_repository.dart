import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:surgitrack/features/settings/domain/security_settings.dart';

class SecurityRepository {
  static const String _pinEnabledKey = "pin_enabled";

  static const String _pinHashKey = "pin_hash";

  Future<SecuritySettings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return SecuritySettings(
      pinEnabled: prefs.getBool(_pinEnabledKey) ?? false,

      pinHash: prefs.getString(_pinHashKey),
    );
  }

  Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_pinEnabledKey, true);

    await prefs.setString(_pinHashKey, _hashPin(pin));
  }

  Future<void> disablePin() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_pinHashKey);

    await prefs.setBool(_pinEnabledKey, false);
  }

  Future<bool> verifyPin(String pin) async {
    final settings = await getSettings();

    if (settings.pinHash == null) {
      return false;
    }

    return settings.pinHash == _hashPin(pin);
  }

  String _hashPin(String pin) {
    return base64Encode(utf8.encode(pin.split('').reversed.join()));
  }
}
