import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';
import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

class DashboardRepository {
  final AppDatabase database;

  DashboardRepository(this.database);

  // =====================================================
  // CORE KPI STATISTICS
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
  // RECENT CASES
  // =====================================================

  Future<List<SurgicalCaseData>> getRecentCases() {
    return database.dashboardDao.recentCases();
  }

  // =====================================================
  // ALL CASES
  // =====================================================

  Future<List<SurgicalCaseData>> getAllCases() {
    return database.dashboardDao.getAllCases();
  }

  // =====================================================
  // SPECIALTY DISTRIBUTION
  //
  // Uses primary specialty classification
  // No additional tags required
  //
  // Cardiac
  // Thoracic
  // Vascular
  // =====================================================

  Future<Map<String, int>> getSpecialtyBreakdown() async {
    final cases = await getAllCases();

    final Map<String, int> result = {};

    for (final c in cases) {
      final specialty = c.specialty.trim();

      if (specialty.isEmpty) {
        continue;
      }

      result[specialty] = (result[specialty] ?? 0) + 1;
    }

    return result;
  }

  // =====================================================
  // TOP PROCEDURE EXPOSURE
  //
  // Uses case_procedures mapping table
  //
  // Returns Top 5 procedures
  // =====================================================

  Future<Map<String, int>> getTopProcedures() async {
    final cases = await getAllCases();

    final Map<String, int> procedureCount = {};

    // Local cache avoids repeated procedure queries

    final Map<int, String> procedureCache = {};

    for (final surgicalCase in cases) {
      final linkedProcedures = await (database.select(
        database.caseProcedures,
      )..where((tbl) => tbl.caseId.equals(surgicalCase.id))).get();

      for (final linked in linkedProcedures) {
        String? procedureName = procedureCache[linked.procedureId];

        if (procedureName == null) {
          final procedure = await database.procedureDao.getProcedureById(
            linked.procedureId,
          );

          if (procedure == null) {
            continue;
          }

          procedureName = procedure.name;

          procedureCache[linked.procedureId] = procedureName;
        }

        procedureCount[procedureName] =
            (procedureCount[procedureName] ?? 0) + 1;
      }
    }

    final sorted = procedureCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map.fromEntries(sorted.take(5));
  }

  // =====================================================
  // OPERATIVE ROLE DISTRIBUTION
  // =====================================================

  Future<Map<String, int>> getOperativeRoleBreakdown() async {
    final cases = await getAllCases();

    final Map<String, int> result = {};

    for (final c in cases) {
      final role = c.operativeRole.trim();

      if (role.isEmpty) {
        continue;
      }

      result[role] = (result[role] ?? 0) + 1;
    }

    return result;
  }

  // =====================================================
  // TECHNICAL SKILL LOG COUNT
  // =====================================================

  Future<int> getTechnicalSkillsCount() async {
    final cases = await getAllCases();

    return cases
        .where(
          (c) =>
              c.technicalSteps != null && c.technicalSteps!.trim().isNotEmpty,
        )
        .length;
  }

  // =====================================================
  // MONTHLY CASE TREND
  //
  // Based on surgery date
  // Format:
  // YYYY-MM
  // =====================================================

  Future<List<MonthlyCaseData>> getMonthlyCaseData() async {
    final cases = await getAllCases();

    final Map<String, int> monthly = {};

    for (final c in cases) {
      final date = c.surgeryDate;

      final key =
          "${date.year}-"
          "${date.month.toString().padLeft(2, '0')}";

      monthly[key] = (monthly[key] ?? 0) + 1;
    }

    final sorted = monthly.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return sorted.map((entry) {
      return MonthlyCaseData(month: entry.key, count: entry.value);
    }).toList();
  }
}
