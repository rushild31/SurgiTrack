import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/analytics/data/analytics_repository.dart';
import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';

import 'package:surgitrack/features/reports/domain/surgical_logbook_report.dart';
import 'package:surgitrack/features/reports/domain/procedure_exposure_report.dart';
import 'package:surgitrack/features/reports/domain/technical_skill_report.dart';
import 'package:surgitrack/features/reports/domain/training_period_report.dart';
import 'package:surgitrack/features/reports/domain/monthly_operative_log_report.dart';

class ReportRepository {
  final AppDatabase database;

  final AnalyticsRepository analyticsRepository;

  const ReportRepository({
    required this.database,
    required this.analyticsRepository,
  });

  // =====================================================
  // MONTHLY OPERATIVE LOG REPORT
  // =====================================================

  Future<MonthlyOperativeLogReport> getMonthlyOperativeLogReport({
    required DateTime from,

    required DateTime to,
  }) async {
    final cases = await database.surgicalCaseDao.getAllCases();

    final patients = await database.patientDao.getAllPatients();

    final caseProcedures = await database.caseProcedureDao
        .getAllCaseProcedures();

    final procedures = await database.procedureDao.getAllProcedures();

    final patientMap = {for (final patient in patients) patient.id: patient};

    final procedureMap = {
      for (final procedure in procedures) procedure.id: procedure.name,
    };

    final procedureListMap = <int, List<String>>{};

    for (final item in caseProcedures) {
      procedureListMap
          .putIfAbsent(item.caseProcedure.caseId, () => [])
          .add(
            procedureMap[item.caseProcedure.procedureId] ?? "Unknown Procedure",
          );
    }

    final filteredCases = cases.where((surgicalCase) {
      return !surgicalCase.surgeryDate.isBefore(from) &&
          !surgicalCase.surgeryDate.isAfter(to);
    }).toList();

    filteredCases.sort((a, b) => a.surgeryDate.compareTo(b.surgeryDate));

    final entries = <MonthlyOperativeLogEntry>[];

    int serialNumber = 1;

    for (final surgicalCase in filteredCases) {
      final patient = patientMap[surgicalCase.patientId];

      entries.add(
        MonthlyOperativeLogEntry(
          serialNumber: serialNumber++,

          patientName: patient?.name ?? "Unknown",

          hospitalId: patient?.hospitalId ?? "-",

          ageSex:
              "${_calculateAge(patient?.dateOfBirth)} / "
              "NA",

          admissionDate: patient?.admissionDate,

          diagnosis: surgicalCase.diagnosis,

          surgeryDate: surgicalCase.surgeryDate,

          procedures: procedureListMap[surgicalCase.id] ?? [],

          operativeRole: surgicalCase.operativeRole,
        ),
      );
    }

    return MonthlyOperativeLogReport(
      month: "${from.month}/${from.year}",

      fromDate: from,

      toDate: to,

      entries: entries,
    );
  }

  // =====================================================
  // EXISTING REPORT METHODS
  // =====================================================

  Future<List<SurgicalLogbookEntry>> getSurgicalLogbook() async {
    final cases = await database.surgicalCaseDao.getAllCases();

    final caseProcedures = await database.caseProcedureDao
        .getAllCaseProcedures();

    final procedures = await database.procedureDao.getAllProcedures();

    final procedureMap = {
      for (final procedure in procedures) procedure.id: procedure.name,
    };

    final Map<int, List<String>> procedureNames = {};

    for (final item in caseProcedures) {
      procedureNames
          .putIfAbsent(item.caseProcedure.caseId, () => [])
          .add(
            procedureMap[item.caseProcedure.procedureId] ?? "Unknown Procedure",
          );
    }

    return cases.map((surgicalCase) {
      return SurgicalLogbookEntry(
        surgeryDate: surgicalCase.surgeryDate,

        patientIdentifier: surgicalCase.caseId,

        diagnosis: surgicalCase.diagnosis,

        procedures: procedureNames[surgicalCase.id] ?? [],

        specialty: surgicalCase.specialty,

        operativeRole: surgicalCase.operativeRole,

        approach: surgicalCase.surgicalApproach ?? "Not documented",

        caseType: surgicalCase.surgeryType,

        complexity: (procedureNames[surgicalCase.id]?.length ?? 0) <= 1
            ? "Single procedure"
            : (procedureNames[surgicalCase.id]?.length ?? 0) == 2
            ? "Dual procedure"
            : "Complex",
      );
    }).toList();
  }

  Future<List<ProcedureExposureReport>> getProcedureExposureReport() async {
    final exposure = await analyticsRepository.getProcedureExposure();

    return exposure.map((item) {
      return ProcedureExposureReport(
        procedureName: item.procedureName,

        totalCases: item.totalCases,

        observed: item.roleCounts['observed'] ?? 0,

        assisted: item.roleCounts['assisted'] ?? 0,

        supervised: item.roleCounts['performed_under_supervision'] ?? 0,

        independent: item.roleCounts['performed_independently'] ?? 0,
      );
    }).toList();
  }

  Future<List<TechnicalSkillReport>> getTechnicalSkillReport() async {
    final exposure = await analyticsRepository.getTechnicalStepExposure();

    return exposure.map((item) {
      return TechnicalSkillReport(
        skillName:
            "${item.procedureName} - "
            "${item.stepName}",

        exposure: item.totalCases,

        observed: item.roleCounts['observed'] ?? 0,

        assisted: item.roleCounts['assisted'] ?? 0,

        supervised: item.roleCounts['performed_under_supervision'] ?? 0,

        independent: item.roleCounts['performed_independently'] ?? 0,
      );
    }).toList();
  }

  Future<TrainingPeriodReport> getTrainingPeriodReport({
    AnalyticsReportFilter filter = AnalyticsReportFilter.empty,
  }) async {
    final statistics = await analyticsRepository.getStatistics(filter: filter);

    final roles = await analyticsRepository.getOperativeRoleDistribution(
      filter: filter,
    );

    final roleMap = {for (final role in roles) role.role: role.count};

    return TrainingPeriodReport(
      period: "Training Period",

      totalCases: statistics.totalCases,

      specialtyDistribution: {
        "Cardiac": statistics.cardiacCases,

        "Thoracic": statistics.thoracicCases,

        "Vascular": statistics.vascularCases,
      },

      independentCases: roleMap['performed_independently'] ?? 0,

      supervisedCases: roleMap['performed_under_supervision'] ?? 0,

      assistedCases: roleMap['assisted'] ?? 0,

      observedCases: roleMap['observed'] ?? 0,
    );
  }

  int? _calculateAge(DateTime? birthDate) {
    if (birthDate == null) {
      return null;
    }

    final today = DateTime.now();

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
