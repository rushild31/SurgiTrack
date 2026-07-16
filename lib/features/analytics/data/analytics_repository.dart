import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/core/utils/operative_role_utils.dart';

import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';
import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';
import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';
import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';
import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

class AnalyticsRepository {
  final AppDatabase database;

  const AnalyticsRepository(this.database);

  Future<AnalyticsStatistics> getStatistics() async {
    final totalPatients = await getTotalPatients();

    final totalCases = await getTotalCases();

    final totalProcedures = await getTotalProcedures();

    final cases = await database.surgicalCaseDao.getAllCases();

    int cardiacCases = 0;
    int thoracicCases = 0;
    int vascularCases = 0;

    for (final surgicalCase in cases) {
      switch (surgicalCase.specialty.toLowerCase()) {
        case 'cardiac':
          cardiacCases++;
          break;

        case 'thoracic':
          thoracicCases++;
          break;

        case 'vascular':
          vascularCases++;
          break;
      }
    }

    return AnalyticsStatistics(
      totalCases: totalCases,
      totalPatients: totalPatients,
      totalProcedures: totalProcedures,

      cardiacCases: cardiacCases,
      thoracicCases: thoracicCases,
      vascularCases: vascularCases,

      averageProceduresPerCase: totalCases == 0
          ? 0
          : totalProcedures / totalCases,
    );
  }

  Future<List<ProcedureExposure>> getProcedureExposure() async {
    final caseProcedures = await database.caseProcedureDao
        .getAllCaseProcedures();

    final cases = await database.surgicalCaseDao.getAllCases();

    final roleMap = {for (final item in cases) item.id: item.operativeRole};

    final Map<String, ProcedureExposureBuilder> exposure = {};

    for (final item in caseProcedures) {
      final procedure = item.procedure;

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

  Future<List<TechnicalStepExposure>> getTechnicalStepExposure() async {
    final steps = await database.caseProcedureStepsDao
        .getAllCaseProcedureSteps();

    final Map<String, TechnicalStepExposureBuilder> exposure = {};

    for (final item in steps) {
      final procedure = item.procedure;

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

  Future<List<MonthlyCaseTrend>> getMonthlyCaseTrend() async {
    final cases = await database.surgicalCaseDao.getAllCases();

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

  Future<List<OperativeRoleDistribution>> getOperativeRoleDistribution() async {
    final cases = await database.surgicalCaseDao.getAllCases();

    final Map<String, int> counts = {
      'observed': 0,

      'assisted': 0,

      'performed_under_supervision': 0,

      'performed_independently': 0,
    };

    for (final item in cases) {
      final role = normalizeOperativeRole(item.operativeRole);

      if (counts.containsKey(role)) {
        counts[role] = counts[role]! + 1;
      }
    }

    return counts.entries
        .map((e) => OperativeRoleDistribution(role: e.key, count: e.value))
        .toList();
  }

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
