import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/patients.dart';

part 'patient_dao.g.dart';

@DriftAccessor(tables: [Patients])
class PatientDao extends DatabaseAccessor<AppDatabase> with _$PatientDaoMixin {
  PatientDao(super.db);

  Future<List<PatientData>> getAllPatients() {
    return select(patients).get();
  }

  Stream<List<PatientData>> watchPatients() {
    return select(patients).watch();
  }

  Future<PatientData?> getPatientById(int id) {
    return (select(
      patients,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertPatient(PatientsCompanion patient) {
    return into(patients).insert(patient);
  }

  Future<bool> updatePatient(PatientsCompanion patient) {
    return update(patients).replace(patient);
  }

  Future<int> deletePatient(int id) {
    return (delete(patients)..where((tbl) => tbl.id.equals(id))).go();
  }
}
