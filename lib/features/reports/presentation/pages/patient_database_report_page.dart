import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/providers/patient_provider.dart';

import 'package:surgitrack/features/reports/data/export/export_repository.dart';
import 'package:surgitrack/features/reports/data/export/report_export_service.dart';

class PatientDatabaseReportPage extends ConsumerWidget {
  const PatientDatabaseReportPage({super.key});

  Future<void> exportExcel(List<Patient> patients) async {
    final repository = ExportRepository();

    final bytes = await repository.exportPatientDatabase(patients);

    await ReportExportService.exportExcel(
      bytes: bytes,

      fileName: "SurgiTrack_Patient_Database.xlsx",
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patients = ref.watch(patientListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Database"),

        actions: [
          patients.when(
            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),

            data: (data) {
              if (data.isEmpty) {
                return const SizedBox();
              }

              return IconButton(
                icon: const Icon(Icons.table_chart),

                tooltip: "Export Excel",

                onPressed: () => exportExcel(data),
              );
            },
          ),
        ],
      ),

      body: patients.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text("No patients recorded"));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Total Patients: ${data.length}",

                    style: const TextStyle(
                      fontSize: 18,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("Sr")),

                        DataColumn(label: Text("Patient")),

                        DataColumn(label: Text("Hospital ID")),

                        DataColumn(label: Text("Age")),

                        DataColumn(label: Text("Blood Group")),

                        DataColumn(label: Text("Comorbidities")),

                        DataColumn(label: Text("Address")),

                        DataColumn(label: Text("Admission")),
                      ],

                      rows: List.generate(data.length, (index) {
                        final patient = data[index];

                        return DataRow(
                          cells: [
                            DataCell(Text("${index + 1}")),

                            DataCell(Text(patient.name)),

                            DataCell(Text(patient.hospitalId)),

                            DataCell(Text(patient.age.toString())),

                            DataCell(Text(patient.bloodGroup ?? "-")),

                            DataCell(Text(patient.comorbidities.join(", "))),

                            DataCell(Text(patient.address ?? "-")),

                            DataCell(
                              Text(
                                patient.admissionDate
                                        ?.toString()
                                        .split(" ")
                                        .first ??
                                    "-",
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
