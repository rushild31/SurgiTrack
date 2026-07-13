import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/cases/providers/surgical_case_provider.dart';

import 'package:surgitrack/features/cases/presentation/widgets/case_card.dart';
import 'package:surgitrack/features/cases/presentation/widgets/cases_empty_state.dart';

import 'package:surgitrack/features/cases/presentation/search/case_search_delegate.dart';

import 'add_case_screen.dart';
import 'case_details_screen.dart';

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
            data: (list) => IconButton(
              icon: const Icon(Icons.search),

              onPressed: () {
                showSearch(
                  context: context,

                  delegate: CaseSearchDelegate(list),
                );
              },
            ),

            loading: () => const SizedBox(),

            error: (_, _) => const SizedBox(),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,

            MaterialPageRoute(builder: (_) => const AddCaseScreen()),
          );
        },

        child: const Icon(Icons.add),
      ),

      body: cases.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text(e.toString())),

        data: (list) {
          if (list.isEmpty) {
            return const CasesEmptyState();
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 12),

            itemCount: list.length,

            itemBuilder: (context, index) {
              return CaseCard(
                surgicalCase: list[index],

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          CaseDetailsScreen(surgicalCase: list[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
