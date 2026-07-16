class AnalyticsReportFilter {
  final DateTime? from;

  final DateTime? to;

  final String? specialty;

  final String? procedureId;

  // Case characteristics

  final String? approach;

  final String? caseType;

  final String? urgency;

  final String? complexity;

  // Training exposure

  final String? operativeRole;

  const AnalyticsReportFilter({
    this.from,
    this.to,
    this.specialty,
    this.procedureId,
    this.approach,
    this.caseType,
    this.urgency,
    this.complexity,
    this.operativeRole,
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
  // Case Characteristic Filters
  // =========================

  bool get hasApproachFilter {
    return approach != null && approach!.trim().isNotEmpty;
  }

  bool get hasCaseTypeFilter {
    return caseType != null && caseType!.trim().isNotEmpty;
  }

  bool get hasUrgencyFilter {
    return urgency != null && urgency!.trim().isNotEmpty;
  }

  bool get hasComplexityFilter {
    return complexity != null && complexity!.trim().isNotEmpty;
  }

  // =========================
  // Operative Role Filter
  // =========================

  bool get hasOperativeRoleFilter {
    return operativeRole != null && operativeRole!.trim().isNotEmpty;
  }

  // =========================
  // Empty Filter
  // =========================

  static const empty = AnalyticsReportFilter();
}
