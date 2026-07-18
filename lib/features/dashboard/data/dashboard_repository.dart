import 'package:surgitrack/core/database/app_database.dart';

import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';
import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

import 'package:surgitrack/features/analytics/domain/operative_role_distribution.dart';

class DashboardRepository {
  final AppDatabase database;

  DashboardRepository(this.database);

  Future<DashboardStatistics> getStatistics() async {
    final dao = database.dashboardDao;

    return DashboardStatistics(
      totalPatients: await dao.patientCount(),

      totalCases: await dao.caseCount(),

      totalProcedures: await dao.procedureCount(),

      casesThisMonth: await dao.caseCountThisMonth(),
    );
  }

  Future<List<SurgicalCaseData>> getRecentCases() {
    return database.dashboardDao.recentCases();
  }

  Future<List<SurgicalCaseData>> getAllCases() {
    return database.dashboardDao.getAllCases();
  }

  /// Cases grouped by specialty
  Future<Map<String, int>> getSpecialtyBreakdown() async {
    final cases = await getAllCases();

    final Map<String, int> result = {};

    for (final c in cases) {
      result[c.specialty] = (result[c.specialty] ?? 0) + 1;
    }

    return result;
  }

  /// Cases grouped by operative role
  Future<List<OperativeRoleDistribution>> getOperativeRoleDistribution() async {
    final cases = await getAllCases();

    final Map<String, int> result = {};

    for (final c in cases) {
      result[c.operativeRole] = (result[c.operativeRole] ?? 0) + 1;
    }

    return result.entries.map((entry) {
      return OperativeRoleDistribution(role: entry.key, count: entry.value);
    }).toList();
  }

  /// Monthly case volume
  Future<List<MonthlyCaseData>> getMonthlyCaseData() async {
    final cases = await getAllCases();

    final Map<String, int> monthly = {};

    for (final c in cases) {
      final month =
          "${c.surgeryDate.year}-"
          "${c.surgeryDate.month.toString().padLeft(2, '0')}";

      monthly[month] = (monthly[month] ?? 0) + 1;
    }

    return monthly.entries.map((entry) {
      return MonthlyCaseData(month: entry.key, count: entry.value);
    }).toList();
  }
}
