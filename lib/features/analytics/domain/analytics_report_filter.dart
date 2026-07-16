class AnalyticsReportFilter {
  final DateTime? from;

  final DateTime? to;

  final String? specialty;

  final String? procedureId;

  const AnalyticsReportFilter({
    this.from,
    this.to,
    this.specialty,
    this.procedureId,
  });

  // =========================
  // Filter Checks
  // =========================

  bool get hasDateFilter {
    return from != null && to != null;
  }

  bool get hasSpecialtyFilter {
    return specialty != null && specialty!.trim().isNotEmpty;
  }

  bool get hasProcedureFilter {
    return procedureId != null && procedureId!.trim().isNotEmpty;
  }

  // =========================
  // Empty Filter
  // =========================

  static const empty = AnalyticsReportFilter();
}
