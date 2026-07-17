class SecuritySettings {
  final bool pinEnabled;

  final String? pinHash;

  const SecuritySettings({this.pinEnabled = false, this.pinHash});

  SecuritySettings copyWith({bool? pinEnabled, String? pinHash}) {
    return SecuritySettings(
      pinEnabled: pinEnabled ?? this.pinEnabled,
      pinHash: pinHash ?? this.pinHash,
    );
  }
}
