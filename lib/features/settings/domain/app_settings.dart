class AppSettings {
  // ===============================
  // Display Preferences
  // ===============================

  final String ageDisplay;

  // ===============================
  // Report Preferences
  // ===============================

  final bool autoReportGeneration;

  final String reportFrequency;

  // ===============================
  // Security & Privacy
  // ===============================

  final bool pinLockEnabled;

  /// Stores hashed PIN in future.
  /// Never store raw PIN permanently.
  final String? pinHash;

  // ===============================
  // Cloud Authentication / Sync
  // Future Supabase groundwork
  // ===============================

  /// Whether cloud sync is enabled
  final bool cloudSyncEnabled;

  /// Supabase authenticated user ID
  final String? cloudUserId;

  /// User email linked with cloud account
  final String? cloudEmail;

  /// Last successful synchronization timestamp
  final DateTime? lastSyncedAt;

  const AppSettings({
    this.ageDisplay = "Years",

    this.autoReportGeneration = true,

    this.reportFrequency = "Monthly",

    this.pinLockEnabled = false,

    this.pinHash,

    this.cloudSyncEnabled = false,

    this.cloudUserId,

    this.cloudEmail,

    this.lastSyncedAt,
  });

  AppSettings copyWith({
    String? ageDisplay,

    bool? autoReportGeneration,

    String? reportFrequency,

    bool? pinLockEnabled,

    String? pinHash,

    bool clearPinHash = false,

    bool? cloudSyncEnabled,

    String? cloudUserId,

    String? cloudEmail,

    bool clearCloudAccount = false,

    DateTime? lastSyncedAt,

    bool clearLastSyncedAt = false,
  }) {
    return AppSettings(
      ageDisplay: ageDisplay ?? this.ageDisplay,

      autoReportGeneration: autoReportGeneration ?? this.autoReportGeneration,

      reportFrequency: reportFrequency ?? this.reportFrequency,

      pinLockEnabled: pinLockEnabled ?? this.pinLockEnabled,

      pinHash: clearPinHash ? null : (pinHash ?? this.pinHash),

      cloudSyncEnabled: cloudSyncEnabled ?? this.cloudSyncEnabled,

      cloudUserId: clearCloudAccount ? null : (cloudUserId ?? this.cloudUserId),

      cloudEmail: clearCloudAccount ? null : (cloudEmail ?? this.cloudEmail),

      lastSyncedAt: clearLastSyncedAt
          ? null
          : (lastSyncedAt ?? this.lastSyncedAt),
    );
  }
}
