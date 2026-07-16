import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';

class AnalyticsFilterNotifier extends StateNotifier<AnalyticsReportFilter> {
  AnalyticsFilterNotifier() : super(AnalyticsReportFilter.empty);

  void updateFilter(AnalyticsReportFilter filter) {
    state = filter;
  }

  void clear() {
    state = AnalyticsReportFilter.empty;
  }

  void setSpecialty(String? specialty) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: specialty,
      procedureId: state.procedureId,
      approach: state.approach,
      caseType: state.caseType,
      urgency: state.urgency,
      complexity: state.complexity,
      operativeRole: state.operativeRole,
    );
  }

  void setProcedure(String? procedureId) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: state.specialty,
      procedureId: procedureId,
      approach: state.approach,
      caseType: state.caseType,
      urgency: state.urgency,
      complexity: state.complexity,
      operativeRole: state.operativeRole,
    );
  }

  void setApproach(String? approach) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: state.specialty,
      procedureId: state.procedureId,
      approach: approach,
      caseType: state.caseType,
      urgency: state.urgency,
      complexity: state.complexity,
      operativeRole: state.operativeRole,
    );
  }

  void setCaseType(String? caseType) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: state.specialty,
      procedureId: state.procedureId,
      approach: state.approach,
      caseType: caseType,
      urgency: state.urgency,
      complexity: state.complexity,
      operativeRole: state.operativeRole,
    );
  }

  void setUrgency(String? urgency) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: state.specialty,
      procedureId: state.procedureId,
      approach: state.approach,
      caseType: state.caseType,
      urgency: urgency,
      complexity: state.complexity,
      operativeRole: state.operativeRole,
    );
  }

  void setComplexity(String? complexity) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: state.specialty,
      procedureId: state.procedureId,
      approach: state.approach,
      caseType: state.caseType,
      urgency: state.urgency,
      complexity: complexity,
      operativeRole: state.operativeRole,
    );
  }

  void setOperativeRole(String? operativeRole) {
    state = AnalyticsReportFilter(
      from: state.from,
      to: state.to,
      specialty: state.specialty,
      procedureId: state.procedureId,
      approach: state.approach,
      caseType: state.caseType,
      urgency: state.urgency,
      complexity: state.complexity,
      operativeRole: operativeRole,
    );
  }

  void setDateRange(DateTime? from, DateTime? to) {
    state = AnalyticsReportFilter(
      from: from,
      to: to,
      specialty: state.specialty,
      procedureId: state.procedureId,
      approach: state.approach,
      caseType: state.caseType,
      urgency: state.urgency,
      complexity: state.complexity,
      operativeRole: state.operativeRole,
    );
  }
}

final analyticsFilterProvider =
    StateNotifierProvider<AnalyticsFilterNotifier, AnalyticsReportFilter>((
      ref,
    ) {
      return AnalyticsFilterNotifier();
    });
