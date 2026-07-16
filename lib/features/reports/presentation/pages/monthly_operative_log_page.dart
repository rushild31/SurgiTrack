import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/reports/providers/report_provider.dart';

class MonthlyOperativeLogPage extends ConsumerStatefulWidget {
  const MonthlyOperativeLogPage({super.key});

  @override
  ConsumerState<MonthlyOperativeLogPage> createState() =>
      _MonthlyOperativeLogPageState();
}

class _MonthlyOperativeLogPageState
    extends ConsumerState<MonthlyOperativeLogPage> {
  late DateTimeRange selectedRange;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();

    selectedRange = DateTimeRange(
      start: DateTime(now.year, now.month, 1),

      end: DateTime(now.year, now.month + 1, 0),
    );
  }

  void loadReport() {
    ref.invalidate(monthlyOperativeLogReportProvider(selectedRange));
  }

  Future<void> pickMonth() async {
    final picked = await showDatePicker(
      context: context,

      initialDate: selectedRange.start,

      firstDate: DateTime(2020),

      lastDate: DateTime.now(),
    );

    if (picked == null) return;

    setState(() {
      selectedRange = DateTimeRange(
        start: DateTime(picked.year, picked.month, 1),

        end: DateTime(picked.year, picked.month + 1, 0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final report = ref.watch(monthlyOperativeLogReportProvider(selectedRange));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Operative Log"),

        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),

            onPressed: pickMonth,
          ),
        ],
      ),

      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (data) {
          if (data.entries.isEmpty) {
            return const Center(child: Text("No cases found for this month"));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "${data.month}  "
                    "(${data.totalCases} cases)",

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
                      columnSpacing: 18,

                      headingRowHeight: 48,

                      columns: const [
                        DataColumn(label: Text("Sr No")),

                        DataColumn(label: Text("Patient Name")),

                        DataColumn(label: Text("Hospital ID")),

                        DataColumn(label: Text("Age/Sex")),

                        DataColumn(label: Text("Admission Date")),

                        DataColumn(label: Text("Diagnosis")),

                        DataColumn(label: Text("Surgery Date")),

                        DataColumn(label: Text("Procedure(s)")),

                        DataColumn(label: Text("Role")),
                      ],

                      rows: data.entries
                          .map(
                            (entry) => DataRow(
                              cells: [
                                DataCell(Text(entry.serialNumber.toString())),

                                DataCell(Text(entry.patientName)),

                                DataCell(Text(entry.hospitalId)),

                                DataCell(Text(entry.ageSex)),

                                DataCell(
                                  Text(
                                    entry.admissionDate
                                            ?.toString()
                                            .split(" ")
                                            .first ??
                                        "-",
                                  ),
                                ),

                                DataCell(Text(entry.diagnosis)),

                                DataCell(
                                  Text(
                                    entry.surgeryDate
                                        .toString()
                                        .split(" ")
                                        .first,
                                  ),
                                ),

                                DataCell(Text(entry.procedures.join(", "))),

                                DataCell(Text(entry.operativeRole)),
                              ],
                            ),
                          )
                          .toList(),
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
