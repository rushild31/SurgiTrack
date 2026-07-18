import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/providers/case_logbook_provider.dart';
import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/cases/domain/surgical_case.dart';

import 'package:surgitrack/features/cases/presentation/search/case_search_delegate.dart';
import 'package:surgitrack/features/cases/presentation/screens/case_details_screen.dart';

import 'package:surgitrack/features/cases/presentation/widgets/case_logbook_row.dart';
import 'package:surgitrack/features/cases/presentation/widgets/cases_empty_state.dart';

class CaseListScreen extends ConsumerWidget {
  const CaseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cases = ref.watch(caseLogbookProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Surgical Cases"),

        actions: [
          cases.when(
            data: (list) {
              if (list.isEmpty) {
                return const SizedBox();
              }

              return IconButton(
                icon: const Icon(Icons.search),

                onPressed: () async {
                  final navigatorContext = context;

                  final allCases = await ref.read(
                    surgicalCaseListProvider.future,
                  );

                  if (!navigatorContext.mounted) {
                    return;
                  }

                  final selectedCase = await showSearch<SurgicalCase?>(
                    context: navigatorContext,
                    delegate: CaseSearchDelegate(allCases),
                  );

                  if (selectedCase != null && navigatorContext.mounted) {
                    Navigator.push(
                      navigatorContext,

                      MaterialPageRoute(
                        builder: (_) =>
                            CaseDetailsScreen(surgicalCase: selectedCase),
                      ),
                    );
                  }
                },
              );
            },

            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),
          ),
        ],
      ),

      body: cases.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text(error.toString())),

        data: (list) {
          if (list.isEmpty) {
            return const CasesEmptyState();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      "Operative Logbook",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    Text(
                      "${list.length} Cases",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const _TableHeader(),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(caseLogbookProvider);
                  },

                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: SizedBox(
                      width: 850,

                      child: ListView.builder(
                        itemCount: list.length,

                        itemBuilder: (context, index) {
                          final item = list[index];

                          return CaseLogbookRow(
                            item: item,

                            onTap: () async {
                              final fullCase = await ref
                                  .read(surgicalCaseListProvider.future)
                                  .then(
                                    (cases) => cases.firstWhere(
                                      (c) => c.id == item.id,
                                    ),
                                  );

                              if (context.mounted) {
                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (_) => CaseDetailsScreen(
                                      surgicalCase: fullCase,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
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

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

      child: const Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              "Case ID",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              "Patient",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              "Diagnosis",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            width: 80,
            child: Text(
              "Specialty",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            width: 90,
            child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          SizedBox(
            width: 110,
            child: Text("Role", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
