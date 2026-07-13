import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/features/dashboard/domain/dashboard_statistics.dart';

import 'package:surgitrack/core/enums/surgeon_role.dart';

class DashboardRepository {
  final AppDatabase database;

  DashboardRepository(this.database);

  Future<DashboardStatistics> getStatistics() async {
    final dao = database.dashboardDao;

    final totalPatients = await dao.patientCount();

    final totalCases = await dao.caseCount();

    final totalProcedures = await dao.procedureCount();

    final cardiacCases = await dao.specialtyCount("Cardiac");

    final thoracicCases = await dao.specialtyCount("Thoracic");

    final vascularCases = await dao.specialtyCount("Vascular");

    final observedCases = await dao.operativeRoleCount(
      SurgeonRole.observed.label,
    );

    final assistedCases = await dao.operativeRoleCount(
      SurgeonRole.assisted.label,
    );

    final supervisedCases = await dao.operativeRoleCount(
      SurgeonRole.supervised.label,
    );

    final independentCases = await dao.operativeRoleCount(
      SurgeonRole.independent.label,
    );

    return DashboardStatistics(
      totalPatients: totalPatients,

      totalCases: totalCases,

      totalProcedures: totalProcedures,

      cardiacCases: cardiacCases,

      thoracicCases: thoracicCases,

      vascularCases: vascularCases,

      observedCases: observedCases,

      assistedCases: assistedCases,

      supervisedCases: supervisedCases,

      independentCases: independentCases,
    );
  }
}
