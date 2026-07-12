import 'package:surgitrack/core/database/app_database.dart';
import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/data/patient_mapper.dart';

class PatientRepository {
  final AppDatabase database;

  const PatientRepository(this.database);

  Stream<List<Patient>> watchPatients() {
    return database.patientDao.watchPatients().map(
      (rows) => rows.map(PatientMapper.fromData).toList(),
    );
  }

  Future<List<Patient>> getPatients() async {
    final rows = await database.patientDao.getAllPatients();

    return rows.map(PatientMapper.fromData).toList();
  }

  Future<Patient?> getPatientById(int id) async {
    final row = await database.patientDao.getPatientById(id);

    if (row == null) {
      return null;
    }

    return PatientMapper.fromData(row);
  }

  Future<void> addPatient(Patient patient) async {
    await database.patientDao.insertPatient(PatientMapper.toCompanion(patient));
  }

  Future<void> updatePatient(Patient patient) async {
    await database.patientDao.updatePatient(PatientMapper.toCompanion(patient));
  }

  Future<void> deletePatient(int id) async {
    await database.patientDao.deletePatient(id);
  }
}
