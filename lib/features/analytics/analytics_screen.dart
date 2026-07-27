import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import 'package:surgitrack/features/analytics/domain/analytics_report_filter.dart';
import 'package:surgitrack/features/analytics/domain/analytics_statistics.dart';
import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';
import 'package:surgitrack/features/analytics/domain/procedure_exposure.dart';
import 'package:surgitrack/features/analytics/domain/technical_step_exposure.dart';

import 'package:surgitrack/features/analytics/providers/analytics_filter_provider.dart';
import 'package:surgitrack/features/analytics/providers/analytics_provider.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticsAsync = ref.watch(analyticsStatisticsProvider);
    final specialtyFilter = ref.watch(analyticsFilterProvider).specialty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          IconButton(
            tooltip: 'Clear filters',
            icon: const Icon(Icons.filter_alt_off_outlined),
            onPressed: () {
              ref.read(analyticsFilterProvider.notifier).clear();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(analyticsStatisticsProvider);
          ref.invalidate(procedureExposureProvider);
          ref.invalidate(technicalStepExposureProvider);
          ref.invalidate(monthlyCaseTrendProvider);
          ref.invalidate(operativeRoleDistributionProvider);

          await ref.read(analyticsStatisticsProvider.future);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _AnalyticsIntroCard(
                    filter: ref.watch(analyticsFilterProvider),
                  ),

                  const SizedBox(height: 16),

                  const _AnalyticsFilterSection(),

                  const SizedBox(height: 20),

                  statisticsAsync.when(
                    loading: () => const _AnalyticsLoadingState(),

                    error: (error, stack) => _AnalyticsErrorState(
                      onRetry: () {
                        ref.invalidate(analyticsStatisticsProvider);
                      },
                    ),

                    data: (statistics) => Column(
                      children: [
                        _StatisticsSection(statistics: statistics),

                        const SizedBox(height: 20),

                        _SpecialtyDistributionCard(
                          statistics: statistics,
                          selectedSpecialty: specialtyFilter,
                        ),

                        const SizedBox(height: 20),

                        const _MonthlyTrendCard(),

                        const SizedBox(height: 20),

                        const _OperativeRoleCard(),

                        const SizedBox(height: 20),

                        const _ProcedureExposureCard(),

                        const SizedBox(height: 20),

                        const _TechnicalStepExposureCard(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// INTRODUCTION
// =====================================================

class _AnalyticsIntroCard extends StatelessWidget {
  final AnalyticsReportFilter filter;

  const _AnalyticsIntroCard({required this.filter});

  @override
  Widget build(BuildContext context) {
    final hasFilters =
        filter.hasDateFilter ||
        filter.hasSpecialtyFilter ||
        filter.hasProcedureFilter ||
        filter.hasApproachFilter ||
        filter.hasCaseTypeFilter ||
        filter.hasUrgencyFilter ||
        filter.hasComplexityFilter ||
        filter.hasOperativeRoleFilter;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Training Analytics',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    hasFilters
                        ? 'Showing analytics for the selected filters.'
                        : 'Review your operative exposure, case distribution, and technical experience.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// FILTERS
// =====================================================

class _AnalyticsFilterSection extends ConsumerWidget {
  const _AnalyticsFilterSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(analyticsFilterProvider);
    final notifier = ref.read(analyticsFilterProvider.notifier);

    return Card(
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: const Icon(Icons.filter_alt_outlined),
        title: const Text('Filters'),
        subtitle: Text(_filterSummary(filter)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _FilterDropdown<String>(
                        label: 'Specialty',
                        value: filter.specialty,
                        items: const [
                          DropdownMenuItem(
                            value: 'Cardiac',
                            child: Text('Cardiac'),
                          ),
                          DropdownMenuItem(
                            value: 'Thoracic',
                            child: Text('Thoracic'),
                          ),
                          DropdownMenuItem(
                            value: 'Vascular',
                            child: Text('Vascular'),
                          ),
                        ],
                        onChanged: notifier.setSpecialty,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _FilterDropdown<String>(
                        label: 'Approach',
                        value: filter.approach,
                        items: const [
                          DropdownMenuItem(value: 'Open', child: Text('Open')),
                          DropdownMenuItem(value: 'MICS', child: Text('MICS')),
                          DropdownMenuItem(
                            value: 'Hybrid',
                            child: Text('Hybrid'),
                          ),
                          DropdownMenuItem(
                            value: 'Robotic',
                            child: Text('Robotic'),
                          ),
                        ],
                        onChanged: notifier.setApproach,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _FilterDropdown<String>(
                        label: 'Case Type',
                        value: filter.caseType,
                        items: const [
                          DropdownMenuItem(
                            value: 'Primary',
                            child: Text('Primary'),
                          ),
                          DropdownMenuItem(value: 'Redo', child: Text('Redo')),
                        ],
                        onChanged: notifier.setCaseType,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _FilterDropdown<String>(
                        label: 'Urgency',
                        value: filter.urgency,
                        items: const [
                          DropdownMenuItem(
                            value: 'Elective',
                            child: Text('Elective'),
                          ),
                          DropdownMenuItem(
                            value: 'Emergency',
                            child: Text('Emergency'),
                          ),
                        ],
                        onChanged: notifier.setUrgency,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _FilterDropdown<String>(
                        label: 'Complexity',
                        value: filter.complexity,
                        items: const [
                          DropdownMenuItem(value: 'Low', child: Text('Low')),
                          DropdownMenuItem(
                            value: 'Moderate',
                            child: Text('Moderate'),
                          ),
                          DropdownMenuItem(value: 'High', child: Text('High')),
                        ],
                        onChanged: notifier.setComplexity,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _FilterDropdown<String>(
                        label: 'Operative Role',
                        value: filter.operativeRole,
                        items: const [
                          DropdownMenuItem(
                            value: 'observed',
                            child: Text('Observed'),
                          ),
                          DropdownMenuItem(
                            value: 'assisted',
                            child: Text('Assisted'),
                          ),
                          DropdownMenuItem(
                            value: 'performed_under_supervision',
                            child: Text('Performed under supervision'),
                          ),
                          DropdownMenuItem(
                            value: 'performed_independently',
                            child: Text('Performed independently'),
                          ),
                        ],
                        onChanged: notifier.setOperativeRole,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                _ProcedureFilterField(
                  initialValue: filter.procedureId,
                  onChanged: notifier.setProcedure,
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _DateFilterButton(
                        label: 'From',
                        date: filter.from,
                        onPressed: () async {
                          final selected = await _pickDate(
                            context,
                            filter.from,
                          );

                          if (selected != null) {
                            notifier.setDateRange(
                              selected,
                              filter.to ?? selected,
                            );
                          }
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _DateFilterButton(
                        label: 'To',
                        date: filter.to,
                        onPressed: () async {
                          final selected = await _pickDate(context, filter.to);

                          if (selected != null) {
                            notifier.setDateRange(
                              filter.from ?? selected,
                              selected,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    onPressed: notifier.clear,
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear Filters'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _filterSummary(AnalyticsReportFilter filter) {
    final active = <String>[];

    if (filter.hasDateFilter) active.add('Date');
    if (filter.hasSpecialtyFilter) active.add(filter.specialty!);
    if (filter.hasProcedureFilter) active.add('Procedure');
    if (filter.hasApproachFilter) active.add('Approach');
    if (filter.hasCaseTypeFilter) active.add('Case type');
    if (filter.hasUrgencyFilter) active.add('Urgency');
    if (filter.hasComplexityFilter) active.add('Complexity');
    if (filter.hasOperativeRoleFilter) active.add('Role');

    return active.isEmpty
        ? 'No filters applied'
        : '${active.length} filter${active.length == 1 ? '' : 's'} applied';
  }

  Future<DateTime?> _pickDate(BuildContext context, DateTime? initialDate) {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
  }
}

class _FilterDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}

class _ProcedureFilterField extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  const _ProcedureFilterField({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<_ProcedureFilterField> createState() => _ProcedureFilterFieldState();
}

class _ProcedureFilterFieldState extends State<_ProcedureFilterField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Procedure ID',
        hintText: 'Example: CABG',
        border: const OutlineInputBorder(),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  widget.onChanged(null);
                  setState(() {});
                },
              ),
      ),
      onChanged: (value) {
        widget.onChanged(value.trim().isEmpty ? null : value.trim());
        setState(() {});
      },
    );
  }
}

// =====================================================
// STATISTICS
// =====================================================

class _StatisticsSection extends StatelessWidget {
  final AnalyticsStatistics statistics;

  const _StatisticsSection({required this.statistics});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final crossAxisCount = width >= 900
            ? 4
            : width >= 600
            ? 2
            : 2;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: width < 600 ? 1.45 : 1.8,
          children: [
            _MetricCard(
              title: 'Total Cases',
              value: statistics.totalCases.toString(),
              icon: Icons.assignment_outlined,
            ),
            _MetricCard(
              title: 'Total Patients',
              value: statistics.totalPatients.toString(),
              icon: Icons.people_outline,
            ),
            _MetricCard(
              title: 'Total Procedures',
              value: statistics.totalProcedures.toString(),
              icon: Icons.medical_services_outlined,
            ),
            _MetricCard(
              title: 'Procedures / Case',
              value: statistics.averageProceduresPerCase.toStringAsFixed(1),
              icon: Icons.analytics_outlined,
            ),
          ],
        );
      },
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),

            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SPECIALTY DISTRIBUTION
// =====================================================

class _SpecialtyDistributionCard extends StatelessWidget {
  final AnalyticsStatistics statistics;
  final String? selectedSpecialty;

  const _SpecialtyDistributionCard({
    required this.statistics,
    required this.selectedSpecialty,
  });

  @override
  Widget build(BuildContext context) {
    final total =
        statistics.cardiacCases +
        statistics.thoracicCases +
        statistics.vascularCases;

    if (total == 0) {
      return const _EmptyAnalyticsCard(
        title: 'Specialty Distribution',
        message: 'No specialty data available.',
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              title: 'Specialty Distribution',
              icon: Icons.pie_chart_outline,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 220,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 50,
                  sectionsSpace: 3,
                  sections: [
                    PieChartSectionData(
                      value: statistics.cardiacCases.toDouble(),
                      title: '${statistics.cardiacCases}',
                      radius: 75,
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    PieChartSectionData(
                      value: statistics.thoracicCases.toDouble(),
                      title: '${statistics.thoracicCases}',
                      radius: 75,
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    PieChartSectionData(
                      value: statistics.vascularCases.toDouble(),
                      title: '${statistics.vascularCases}',
                      radius: 75,
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 20,
              runSpacing: 8,
              children: [
                _LegendItem(label: 'Cardiac', value: statistics.cardiacCases),
                _LegendItem(label: 'Thoracic', value: statistics.thoracicCases),
                _LegendItem(label: 'Vascular', value: statistics.vascularCases),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// MONTHLY TREND
// =====================================================

class _MonthlyTrendCard extends ConsumerWidget {
  const _MonthlyTrendCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTrend = ref.watch(monthlyCaseTrendProvider);

    return asyncTrend.when(
      loading: () => const _LoadingCard(title: 'Monthly Case Trend'),

      error: (error, stack) => const _EmptyAnalyticsCard(
        title: 'Monthly Case Trend',
        message: 'Unable to load trend data.',
      ),

      data: (trend) {
        if (trend.isEmpty) {
          return const _EmptyAnalyticsCard(
            title: 'Monthly Case Trend',
            message: 'No case trend data available.',
          );
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionHeader(
                  title: 'Monthly Case Trend',
                  icon: Icons.show_chart,
                ),

                const SizedBox(height: 24),

                SizedBox(height: 260, child: _MonthlyLineChart(trend: trend)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MonthlyLineChart extends StatelessWidget {
  final List<MonthlyCaseTrend> trend;

  const _MonthlyLineChart({required this.trend});

  @override
  Widget build(BuildContext context) {
    final maxValue = trend
        .map((e) => e.caseCount)
        .fold<int>(0, (a, b) => a > b ? a : b);

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: (maxValue + 1).toDouble(),
        gridData: const FlGridData(show: true),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 36),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= trend.length) {
                  return const SizedBox.shrink();
                }

                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    DateFormat('MMM').format(trend[index].month),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            spots: [
              for (int i = 0; i < trend.length; i++)
                FlSpot(i.toDouble(), trend[i].caseCount.toDouble()),
            ],
          ),
        ],
      ),
    );
  }
}

// =====================================================
// OPERATIVE ROLE
// =====================================================

class _OperativeRoleCard extends ConsumerWidget {
  const _OperativeRoleCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRoles = ref.watch(operativeRoleDistributionProvider);

    return asyncRoles.when(
      loading: () => const _LoadingCard(title: 'Operative Role Distribution'),

      error: (error, stack) => const _EmptyAnalyticsCard(
        title: 'Operative Role Distribution',
        message: 'Unable to load operative role data.',
      ),

      data: (roles) {
        final filteredRoles = roles.where((role) => role.count > 0).toList();

        if (filteredRoles.isEmpty) {
          return const _EmptyAnalyticsCard(
            title: 'Operative Role Distribution',
            message: 'No operative role data available.',
          );
        }

        final maxValue = filteredRoles
            .map((e) => e.count)
            .fold<int>(0, (a, b) => a > b ? a : b);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionHeader(
                  title: 'Operative Role Distribution',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 280,
                  child: BarChart(
                    BarChartData(
                      maxY: (maxValue + 1).toDouble(),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: true),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 64,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();

                              if (index < 0 || index >= filteredRoles.length) {
                                return const SizedBox.shrink();
                              }

                              return SideTitleWidget(
                                meta: meta,
                                child: Text(
                                  _shortRole(filteredRoles[index].role),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      barGroups: [
                        for (int i = 0; i < filteredRoles.length; i++)
                          BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                toY: filteredRoles[i].count.toDouble(),
                                width: 28,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _shortRole(String role) {
    switch (role) {
      case 'observed':
        return 'Observed';
      case 'assisted':
        return 'Assisted';
      case 'performed_under_supervision':
        return 'Under\nSupervision';
      case 'performed_independently':
        return 'Independent';
      default:
        return role;
    }
  }
}

// =====================================================
// PROCEDURE EXPOSURE
// =====================================================

class _ProcedureExposureCard extends ConsumerWidget {
  const _ProcedureExposureCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncExposure = ref.watch(procedureExposureProvider);

    return asyncExposure.when(
      loading: () => const _LoadingCard(title: 'Procedure Exposure'),

      error: (error, stack) => const _EmptyAnalyticsCard(
        title: 'Procedure Exposure',
        message: 'Unable to load procedure exposure.',
      ),

      data: (exposure) {
        if (exposure.isEmpty) {
          return const _EmptyAnalyticsCard(
            title: 'Procedure Exposure',
            message: 'No procedure exposure data available.',
          );
        }

        final sorted = [...exposure]
          ..sort((a, b) => b.totalCases.compareTo(a.totalCases));

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionHeader(
                  title: 'Procedure Exposure',
                  icon: Icons.medical_services_outlined,
                ),

                const SizedBox(height: 16),

                for (final item in sorted)
                  _ProcedureExposureTile(exposure: item),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProcedureExposureTile extends StatelessWidget {
  final ProcedureExposure exposure;

  const _ProcedureExposureTile({required this.exposure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exposure.procedureName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Text(
                '${exposure.totalCases} cases',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),

          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ExposureChip(
                label: 'Observed',
                count: exposure.roleCounts['observed'] ?? 0,
              ),
              _ExposureChip(
                label: 'Assisted',
                count: exposure.roleCounts['assisted'] ?? 0,
              ),
              _ExposureChip(
                label: 'Supervised',
                count: exposure.roleCounts['performed_under_supervision'] ?? 0,
              ),
              _ExposureChip(
                label: 'Independent',
                count: exposure.roleCounts['performed_independently'] ?? 0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =====================================================
// TECHNICAL STEP EXPOSURE
// =====================================================

class _TechnicalStepExposureCard extends ConsumerWidget {
  const _TechnicalStepExposureCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncExposure = ref.watch(technicalStepExposureProvider);

    return asyncExposure.when(
      loading: () => const _LoadingCard(title: 'Technical Step Exposure'),

      error: (error, stack) => const _EmptyAnalyticsCard(
        title: 'Technical Step Exposure',
        message: 'Unable to load technical step exposure.',
      ),

      data: (exposure) {
        if (exposure.isEmpty) {
          return const _EmptyAnalyticsCard(
            title: 'Technical Step Exposure',
            message: 'No technical step exposure data available.',
          );
        }

        final sorted = [...exposure]
          ..sort((a, b) => b.totalCases.compareTo(a.totalCases));

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionHeader(
                  title: 'Technical Step Exposure',
                  icon: Icons.construction_outlined,
                ),

                const SizedBox(height: 8),

                Text(
                  'Your exposure to individual technical steps across procedures.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 16),

                for (final item in sorted) _TechnicalStepTile(exposure: item),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TechnicalStepTile extends StatelessWidget {
  final TechnicalStepExposure exposure;

  const _TechnicalStepTile({required this.exposure});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(exposure.stepName),
      subtitle: Text(
        '${exposure.procedureName} • ${exposure.totalCases} exposures',
      ),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ExposureChip(
                label: 'Observed',
                count: exposure.roleCounts['observed'] ?? 0,
              ),
              _ExposureChip(
                label: 'Assisted',
                count: exposure.roleCounts['assisted'] ?? 0,
              ),
              _ExposureChip(
                label: 'Supervised',
                count: exposure.roleCounts['performed_under_supervision'] ?? 0,
              ),
              _ExposureChip(
                label: 'Independent',
                count: exposure.roleCounts['performed_independently'] ?? 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =====================================================
// SHARED UI
// =====================================================

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String label;
  final int value;

  const _LegendItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(shape: BoxShape.circle),
        ),

        const SizedBox(width: 6),

        Text('$label: $value'),
      ],
    );
  }
}

class _ExposureChip extends StatelessWidget {
  final String label;
  final int count;

  const _ExposureChip({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $count'),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final String title;

  const _LoadingCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(title),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _EmptyAnalyticsCard extends StatelessWidget {
  final String title;
  final String message;

  const _EmptyAnalyticsCard({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _SectionHeader(title: title, icon: Icons.analytics_outlined),

            const SizedBox(height: 20),

            Icon(
              Icons.bar_chart_outlined,
              size: 42,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),

            const SizedBox(height: 12),

            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsLoadingState extends StatelessWidget {
  const _AnalyticsLoadingState();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _AnalyticsErrorState extends StatelessWidget {
  final VoidCallback onRetry;

  const _AnalyticsErrorState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.error_outline, size: 48),

            const SizedBox(height: 12),

            const Text(
              'Unable to load analytics.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateFilterButton extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onPressed;

  const _DateFilterButton({
    required this.label,
    required this.date,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.calendar_today_outlined),
      label: Text(
        date == null
            ? label
            : '$label: ${DateFormat('dd MMM yyyy').format(date!)}',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
