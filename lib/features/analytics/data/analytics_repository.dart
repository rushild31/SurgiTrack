import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/utils/operative_role_utils.dart';

import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';
import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';
import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';
import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';
import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';
import 'package:surgitrack/features/analytics/domain/analytics_report.dart';
import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';
import 'package:surgitrack/features/analytics/domain/specialty_distribution.dart';

class AnalyticsRepository {
  final AppDatabase database;

  const AnalyticsRepository(this.database);

  // =====================================================
  // FILTERED CASE LOADER
  // =====================================================

  Future<List<SurgicalCaseData>> _getFilteredCases(
    AnalyticsReportFilter filter,
  ) async {
    final cases = await database.surgicalCaseDao.getAllCases();

    return cases.where((surgicalCase) {
      if (filter.hasDateFilter) {
        if (surgicalCase.surgeryDate.isBefore(filter.from!)) {
          return false;
        }

        if (surgicalCase.surgeryDate.isAfter(filter.to!)) {
          return false;
        }
      }

      if (filter.hasSpecialtyFilter) {
        if (surgicalCase.specialty.toLowerCase() !=
            filter.specialty!.toLowerCase()) {
          return false;
        }
      }

      // =========================
      // Approach Filter
      // =========================

      if (filter.hasApproachFilter) {
        if (surgicalCase.approach?.toLowerCase() !=
            filter.approach!.toLowerCase()) {
          return false;
        }
      }

      // =========================
      // Primary / Redo Filter
      // =========================

      if (filter.hasCaseTypeFilter) {
        if (surgicalCase.caseType?.toLowerCase() !=
            filter.caseType!.toLowerCase()) {
          return false;
        }
      }

      // =========================
      // Elective / Emergency Filter
      // =========================

      if (filter.hasUrgencyFilter) {
        if (surgicalCase.urgency.toLowerCase() !=
            filter.urgency!.toLowerCase()) {
          return false;
        }
      }

      // =========================
      // Complexity Filter
      // =========================

      if (filter.hasComplexityFilter) {
        if (surgicalCase.complexity?.toLowerCase() !=
            filter.complexity!.toLowerCase()) {
          return false;
        }
      }

      // =========================
      // Operative Role Filter
      // =========================

      if (filter.hasOperativeRoleFilter) {
        if (normalizeOperativeRole(surgicalCase.operativeRole) !=
            normalizeOperativeRole(filter.operativeRole)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  // =====================================================
  // STATISTICS
  // =====================================================

  Future<AnalyticsStatistics> getStatistics({
    AnalyticsReportFilter filter = AnalyticsReportFilter.empty,
  }) async {
    final cases = await _getFilteredCases(filter);

    final totalPatients = await getTotalPatients();

    final totalProcedures = await getTotalProcedures();

    int cardiacCases = 0;

    int thoracicCases = 0;

    int vascularCases = 0;

    for (final surgicalCase in cases) {
      switch (surgicalCase.specialty.toLowerCase()) {
        case "cardiac":
          cardiacCases++;
          break;

        case "thoracic":
          thoracicCases++;
          break;

        case "vascular":
          vascularCases++;
          break;
      }
    }

    return AnalyticsStatistics(
      totalCases: cases.length,

      totalPatients: totalPatients,

      totalProcedures: totalProcedures,

      cardiacCases: cardiacCases,

      thoracicCases: thoracicCases,

      vascularCases: vascularCases,

      averageProceduresPerCase: cases.isEmpty
          ? 0
          : totalProcedures / cases.length,
    );
  }

  // =====================================================
  // PROCEDURE EXPOSURE
  // =====================================================

  Future<List<ProcedureExposure>> getProcedureExposure({
    AnalyticsReportFilter filter = AnalyticsReportFilter.empty,
  }) async {
    final caseProcedures = await database.caseProcedureDao
        .getAllCaseProcedures();

    final cases = await _getFilteredCases(filter);

    final allowedCaseIds = cases.map((e) => e.id).toSet();

    final roleMap = {for (final item in cases) item.id: item.operativeRole};

    final Map<String, ProcedureExposureBuilder> exposure = {};

    for (final item in caseProcedures) {
      if (!allowedCaseIds.contains(item.caseProcedure.caseId)) {
        continue;
      }

      final procedure = item.procedure;

      if (filter.hasProcedureFilter &&
          procedure.procedureId != filter.procedureId) {
        continue;
      }

      final role = normalizeOperativeRole(roleMap[item.caseProcedure.caseId]);

      exposure.putIfAbsent(
        procedure.procedureId,

        () => ProcedureExposureBuilder(
          procedureId: procedure.procedureId,

          procedureName: procedure.name,
        ),
      );

      exposure[procedure.procedureId]!.addCase(role);
    }

    return exposure.values.map((e) => e.build()).toList();
  }
  // =====================================================
  // TECHNICAL STEP EXPOSURE
  // =====================================================

  Future<List<TechnicalStepExposure>> getTechnicalStepExposure({
    AnalyticsReportFilter filter = AnalyticsReportFilter.empty,
  }) async {
    final steps = await database.caseProcedureStepsDao
        .getAllCaseProcedureSteps();

    final cases = await _getFilteredCases(filter);

    final allowedCaseIds = cases.map((e) => e.id).toSet();

    final Map<String, TechnicalStepExposureBuilder> exposure = {};

    for (final item in steps) {
      if (!allowedCaseIds.contains(item.caseId)) {
        continue;
      }

      final procedure = item.procedure;

      if (filter.hasProcedureFilter &&
          procedure.procedureId != filter.procedureId) {
        continue;
      }

      final step = item.procedureStep;

      final key = '${procedure.procedureId}_${step.stepId}';

      exposure.putIfAbsent(
        key,

        () => TechnicalStepExposureBuilder(
          procedureId: procedure.procedureId,

          procedureName: procedure.name,

          stepId: step.stepId,

          stepName: step.stepName,
        ),
      );

      exposure[key]!.addStep(normalizeOperativeRole(item.caseStep.role));
    }

    return exposure.values.map((e) => e.build()).toList();
  }

  // =====================================================
  // MONTHLY CASE TREND
  // =====================================================

  Future<List<MonthlyCaseTrend>> getMonthlyCaseTrend({
    AnalyticsReportFilter filter = AnalyticsReportFilter.empty,
  }) async {
    final cases = await _getFilteredCases(filter);

    final Map<String, int> monthlyCount = {};

    for (final surgicalCase in cases) {
      final date = surgicalCase.surgeryDate;

      final key = '${date.year}-${date.month}';

      monthlyCount[key] = (monthlyCount[key] ?? 0) + 1;
    }

    return monthlyCount.entries.map((entry) {
      final parts = entry.key.split('-');

      return MonthlyCaseTrend(
        month: DateTime(int.parse(parts[0]), int.parse(parts[1])),

        caseCount: entry.value,
      );
    }).toList()..sort((a, b) => a.month.compareTo(b.month));
  }

  // =====================================================
  // OPERATIVE ROLE DISTRIBUTION
  // =====================================================

  Future<List<OperativeRoleDistribution>> getOperativeRoleDistribution({
    AnalyticsReportFilter filter = AnalyticsReportFilter.empty,
  }) async {
    final cases = await _getFilteredCases(filter);

    final Map<String, int> counts = {
      'observed': 0,

      'assisted': 0,

      'performed_under_supervision': 0,

      'performed_independently': 0,
    };

    for (final surgicalCase in cases) {
      final role = normalizeOperativeRole(surgicalCase.operativeRole);

      if (counts.containsKey(role)) {
        counts[role] = counts[role]! + 1;
      }
    }

    return counts.entries
        .map((e) => OperativeRoleDistribution(role: e.key, count: e.value))
        .toList();
  }

  // =====================================================
  // REPORT GENERATOR
  // =====================================================

  Future<AnalyticsReport> generateReport(AnalyticsReportFilter filter) async {
    final statistics = await getStatistics(filter: filter);

    final specialtyDistribution = [
      SpecialtyDistribution(
        specialty: "Cardiac",

        count: statistics.cardiacCases,
      ),

      SpecialtyDistribution(
        specialty: "Thoracic",

        count: statistics.thoracicCases,
      ),

      SpecialtyDistribution(
        specialty: "Vascular",

        count: statistics.vascularCases,
      ),
    ];

    return AnalyticsReport(
      fromDate: filter.from ?? DateTime(2000),

      toDate: filter.to ?? DateTime.now(),

      statistics: statistics,

      specialtyDistribution: specialtyDistribution,

      operativeRoleDistribution: await getOperativeRoleDistribution(
        filter: filter,
      ),

      monthlyCaseTrend: await getMonthlyCaseTrend(filter: filter),

      procedureExposure: await getProcedureExposure(filter: filter),

      technicalStepExposure: await getTechnicalStepExposure(filter: filter),
    );
  }

  // =====================================================
  // COUNTERS
  // =====================================================

  Future<int> getTotalPatients() async {
    final patients = await database.patientDao.getAllPatients();

    return patients.length;
  }

  Future<int> getTotalCases() async {
    final cases = await database.surgicalCaseDao.getAllCases();

    return cases.length;
  }

  Future<int> getTotalProcedures() async {
    final procedures = await database.caseProcedureDao.getAllCaseProcedures();

    return procedures.length;
  }
}

// =====================================================
// PROCEDURE EXPOSURE BUILDER
// =====================================================

class ProcedureExposureBuilder {
  final String procedureId;

  final String procedureName;

  int totalCases = 0;

  final Map<String, int> roleCounts = {
    'observed': 0,

    'assisted': 0,

    'performed_under_supervision': 0,

    'performed_independently': 0,
  };

  ProcedureExposureBuilder({
    required this.procedureId,

    required this.procedureName,
  });

  void addCase(String role) {
    totalCases++;

    if (roleCounts.containsKey(role)) {
      roleCounts[role] = roleCounts[role]! + 1;
    }
  }

  ProcedureExposure build() {
    return ProcedureExposure(
      procedureId: procedureId,

      procedureName: procedureName,

      totalCases: totalCases,

      roleCounts: roleCounts,
    );
  }
}

// =====================================================
// TECHNICAL STEP BUILDER
// =====================================================

class TechnicalStepExposureBuilder {
  final String procedureId;

  final String procedureName;

  final String stepId;

  final String stepName;

  int totalCases = 0;

  final Map<String, int> roleCounts = {
    'observed': 0,

    'assisted': 0,

    'performed_under_supervision': 0,

    'performed_independently': 0,
  };

  TechnicalStepExposureBuilder({
    required this.procedureId,

    required this.procedureName,

    required this.stepId,

    required this.stepName,
  });

  void addStep(String role) {
    totalCases++;

    if (roleCounts.containsKey(role)) {
      roleCounts[role] = roleCounts[role]! + 1;
    }
  }

  TechnicalStepExposure build() {
    return TechnicalStepExposure(
      procedureId: procedureId,

      procedureName: procedureName,

      stepId: stepId,

      stepName: stepName,

      totalCases: totalCases,

      roleCounts: roleCounts,
    );
  }
}
