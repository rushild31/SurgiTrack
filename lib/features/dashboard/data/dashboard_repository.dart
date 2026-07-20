import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';
import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

class DashboardRepository {
  final AppDatabase database;

  DashboardRepository(this.database);

  // =====================================================
  // Core KPI Statistics
  // =====================================================

  Future<DashboardStatistics> getStatistics() async {
    final dao = database.dashboardDao;

    return DashboardStatistics(
      totalPatients: await dao.patientCount(),

      totalCases: await dao.caseCount(),

      totalProcedures: await dao.procedureCount(),

      casesThisMonth: await dao.caseCountThisMonth(),
    );
  }

  // =====================================================
  // Recent Cases
  // =====================================================

  Future<List<SurgicalCaseData>> getRecentCases() {
    return database.dashboardDao.recentCases();
  }

  // =====================================================
  // All Cases
  // =====================================================

  Future<List<SurgicalCaseData>> getAllCases() {
    return database.dashboardDao.getAllCases();
  }

  // =====================================================
  // Specialty Distribution
  //
  // Cardiac
  // Thoracic
  // Vascular
  // =====================================================

  Future<Map<String, int>> getSpecialtyBreakdown() async {
    final cases = await getAllCases();

    final Map<String, int> result = {};

    for (final c in cases) {
      result[c.specialty] = (result[c.specialty] ?? 0) + 1;
    }

    return result;
  }

  // =====================================================
  // Top 5 Procedures
  //
  // Uses case_procedures mapping table
  // =====================================================

  Future<Map<String, int>> getTopProcedures() async {
    final cases = await getAllCases();

    final Map<String, int> procedureCount = {};

    for (final surgicalCase in cases) {
      final linkedProcedures = await (database.select(
        database.caseProcedures,
      )..where((tbl) => tbl.caseId.equals(surgicalCase.id))).get();

      for (final linked in linkedProcedures) {
        final procedure = await database.procedureDao.getProcedureById(
          linked.procedureId,
        );

        if (procedure != null) {
          procedureCount[procedure.name] =
              (procedureCount[procedure.name] ?? 0) + 1;
        }
      }
    }

    final sorted = procedureCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map.fromEntries(sorted.take(5));
  }

  // =====================================================
  // Operative Role Distribution
  // =====================================================

  Future<Map<String, int>> getOperativeRoleBreakdown() async {
    final cases = await getAllCases();

    final Map<String, int> result = {};

    for (final c in cases) {
      result[c.operativeRole] = (result[c.operativeRole] ?? 0) + 1;
    }

    return result;
  }

  // =====================================================
  // Technical Skills Logged
  // =====================================================

  Future<int> getTechnicalSkillsCount() async {
    final cases = await getAllCases();

    int count = 0;

    for (final c in cases) {
      if (c.technicalSteps != null && c.technicalSteps!.trim().isNotEmpty) {
        count++;
      }
    }

    return count;
  }

  // =====================================================
  // Monthly Case Trend
  // =====================================================

  Future<List<MonthlyCaseData>> getMonthlyCaseData() async {
    final cases = await getAllCases();

    final Map<String, int> monthly = {};

    for (final c in cases) {
      final month =
          "${c.surgeryDate.year}-"
          "${c.surgeryDate.month.toString().padLeft(2, '0')}";

      monthly[month] = (monthly[month] ?? 0) + 1;
    }

    final sortedEntries = monthly.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return sortedEntries.map((e) {
      return MonthlyCaseData(month: e.key, count: e.value);
    }).toList();
  }
}
