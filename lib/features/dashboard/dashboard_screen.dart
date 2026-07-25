import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:surgitrack/features/dashboard/providers/dashboard_provider.dart';

import 'package:surgitrack/features/dashboard/presentation/widgets/recent_cases_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/monthly_case_chart.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/specialty_breakdown_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/operative_role_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/top_procedures_card.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:surgitrack/features/dashboard/presentation/widgets/core_kpi_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(dashboardStatisticsProvider);
    final recentCases = ref.watch(recentCasesProvider);
    final specialty = ref.watch(specialtyBreakdownProvider);
    final operative = ref.watch(operativeRoleBreakdownProvider);
    final monthly = ref.watch(monthlyCaseDataProvider);
    final topProcedures = ref.watch(topProceduresProvider);

    return Scaffold(
      body: statistics.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => _DashboardError(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(dashboardStatisticsProvider);
          },
        ),

        data: (stats) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dashboardStatisticsProvider);
              ref.invalidate(recentCasesProvider);
              ref.invalidate(specialtyBreakdownProvider);
              ref.invalidate(operativeRoleBreakdownProvider);
              ref.invalidate(monthlyCaseDataProvider);
              ref.invalidate(topProceduresProvider);
            },

            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 900;

                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),

                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 32 : 16,
                    vertical: 24,
                  ),

                  children: [
                    // ============================
                    // ADAPTIVE GREETING HEADER
                    // ============================
                    const DashboardHeader(),

                    const SizedBox(height: 28),

                    // ============================
                    // CORE KPI SECTION
                    // ============================
                    _KpiSection(
                      totalCases: stats.totalCases,
                      cardiacCases: stats.cardiacCases,
                      thoracicCases: stats.thoracicCases,
                      vascularCases: stats.vascularCases,
                    ),

                    const SizedBox(height: 32),

                    // ============================
                    // TRAINING EXPOSURE
                    // ============================
                    _SectionHeader(
                      title: 'Training Exposure',
                      actionLabel: 'View Analytics',
                      onAction: () {
                        context.go('/analytics');
                      },
                    ),

                    const SizedBox(height: 12),

                    operative.when(
                      loading: () => const _SectionLoading(),

                      error: (e, s) => _SectionError(message: e.toString()),

                      data: (data) => OperativeRoleCard(data: data),
                    ),

                    const SizedBox(height: 28),

                    // ============================
                    // OPERATIVE TREND
                    // ============================
                    _SectionHeader(
                      title: 'Operative Trend',
                      actionLabel: 'View Reports',
                      onAction: () {
                        context.go('/reports');
                      },
                    ),

                    const SizedBox(height: 12),

                    monthly.when(
                      loading: () => const _SectionLoading(),

                      error: (e, s) => _SectionError(message: e.toString()),

                      data: (data) => MonthlyCaseChart(data: data),
                    ),

                    const SizedBox(height: 28),

                    // ============================
                    // SPECIALTY + TOP PROCEDURES
                    // ============================
                    if (isWide)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: specialty.when(
                              loading: () => const _SectionLoading(),

                              error: (e, s) =>
                                  _SectionError(message: e.toString()),

                              data: (data) =>
                                  SpecialtyBreakdownCard(data: data),
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: topProcedures.when(
                              loading: () => const _SectionLoading(),

                              error: (e, s) =>
                                  _SectionError(message: e.toString()),

                              data: (data) =>
                                  TopProceduresCard(procedures: data),
                            ),
                          ),
                        ],
                      )
                    else ...[
                      specialty.when(
                        loading: () => const _SectionLoading(),

                        error: (e, s) => _SectionError(message: e.toString()),

                        data: (data) => SpecialtyBreakdownCard(data: data),
                      ),

                      const SizedBox(height: 20),

                      topProcedures.when(
                        loading: () => const _SectionLoading(),

                        error: (e, s) => _SectionError(message: e.toString()),

                        data: (data) => TopProceduresCard(procedures: data),
                      ),
                    ],

                    const SizedBox(height: 28),

                    // ============================
                    // RECENT CASES
                    // ============================
                    _SectionHeader(
                      title: 'Recent Cases',
                      actionLabel: 'View All',
                      onAction: () {
                        context.go('/cases');
                      },
                    ),

                    const SizedBox(height: 12),

                    recentCases.when(
                      loading: () => const _SectionLoading(),

                      error: (e, s) => _SectionError(message: e.toString()),

                      data: (cases) => RecentCasesCard(cases: cases),
                    ),

                    const SizedBox(height: 32),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// =====================================================
// ADAPTIVE KPI SECTION
// =====================================================

class _KpiSection extends StatelessWidget {
  final int totalCases;
  final int cardiacCases;
  final int thoracicCases;
  final int vascularCases;

  const _KpiSection({
    required this.totalCases,
    required this.cardiacCases,
    required this.thoracicCases,
    required this.vascularCases,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final crossAxisCount = width >= 1100
            ? 4
            : width >= 700
            ? 4
            : 2;

        return GridView.count(
          crossAxisCount: crossAxisCount,

          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          crossAxisSpacing: 12,

          mainAxisSpacing: 12,

          childAspectRatio: width >= 700 ? 1.8 : 1.45,

          children: [
            CoreKpiCard(
              title: 'Total Cases',
              value: totalCases,
              icon: Icons.local_hospital_outlined,
            ),

            CoreKpiCard(
              title: 'Cardiac',
              value: cardiacCases,
              icon: Icons.favorite_border,
            ),

            CoreKpiCard(
              title: 'Thoracic',
              value: thoracicCases,
              icon: Icons.air,
            ),

            CoreKpiCard(
              title: 'Vascular',
              value: vascularCases,
              icon: Icons.bloodtype_outlined,
            ),
          ],
        );
      },
    );
  }
}

// =====================================================
// SECTION HEADER
// =====================================================

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        if (actionLabel != null && onAction != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}

// =====================================================
// SECTION LOADING
// =====================================================

class _SectionLoading extends StatelessWidget {
  const _SectionLoading();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

// =====================================================
// SECTION ERROR
// =====================================================

class _SectionError extends StatelessWidget {
  final String message;

  const _SectionError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(color: Theme.of(context).colorScheme.error),
    );
  }
}

// =====================================================
// DASHBOARD ERROR
// =====================================================

class _DashboardError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _DashboardError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            const Icon(Icons.error_outline, size: 48),

            const SizedBox(height: 16),

            const Text(
              'Unable to load dashboard',

              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(message, textAlign: TextAlign.center),

            const SizedBox(height: 16),

            FilledButton(onPressed: onRetry, child: const Text('Try Again')),
          ],
        ),
      ),
    );
  }
}
