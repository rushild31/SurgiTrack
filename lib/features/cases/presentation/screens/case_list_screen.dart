import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/cases/presentation/widgets/case_card.dart';
import 'package:surgitrack/features/cases/presentation/widgets/cases_empty_state.dart';

import 'package:surgitrack/features/cases/presentation/search/case_search_delegate.dart';

import 'package:surgitrack/features/cases/presentation/screens/case_details_screen.dart';
import 'package:surgitrack/features/cases/domain/surgical_case.dart';

class CaseListScreen extends ConsumerWidget {
  const CaseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cases = ref.watch(surgicalCaseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Surgical Cases"),

        actions: [
          cases.when(
            data: (list) => list.isEmpty
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.search),

                    onPressed: () async {
                      final selectedCase = await showSearch<SurgicalCase?>(
                        context: context,

                        delegate: CaseSearchDelegate(list),
                      );

                      if (selectedCase != null && context.mounted) {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                                CaseDetailsScreen(surgicalCase: selectedCase),
                          ),
                        );
                      }
                    },
                  ),

            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),
          ),
        ],
      ),

      body: cases.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Icon(Icons.error_outline, size: 50),

              const SizedBox(height: 12),

              Text(error.toString(), textAlign: TextAlign.center),
            ],
          ),
        ),

        data: (list) {
          if (list.isEmpty) {
            return const CasesEmptyState();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      "Logged Cases",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    Text(
                      "${list.length}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(surgicalCaseListProvider);
                  },

                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8),

                    itemCount: list.length,

                    itemBuilder: (context, index) {
                      final surgicalCase = list[index];

                      return CaseCard(
                        surgicalCase: surgicalCase,

                        onTap: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  CaseDetailsScreen(surgicalCase: surgicalCase),
                            ),
                          );
                        },
                      );
                    },
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
