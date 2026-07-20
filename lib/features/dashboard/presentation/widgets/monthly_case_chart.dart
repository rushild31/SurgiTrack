import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:surgitrack/core/widgets/app_card.dart';
import 'package:surgitrack/core/widgets/empty_state.dart';

import 'package:surgitrack/features/dashboard/domain/monthly_case_data.dart';

class MonthlyCaseChart extends StatelessWidget {
  final List<MonthlyCaseData> data;

  const MonthlyCaseChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Monthly Operative Trend",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          if (data.isEmpty)
            const EmptyState(
              icon: Icons.show_chart,
              title: "No case trend available",
              message:
                  "Monthly trends will appear after operative cases are added",
            )
          else
            SizedBox(
              height: 260,

              child: LineChart(
                LineChartData(
                  minY: 0,

                  borderData: FlBorderData(show: false),

                  gridData: const FlGridData(show: true),

                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (spots) {
                        return spots.map((spot) {
                          final index = spot.x.toInt();

                          return LineTooltipItem(
                            "${data[index].month}\n"
                            "${spot.y.toInt()} cases",

                            const TextStyle(fontWeight: FontWeight.bold),
                          );
                        }).toList();
                      },
                    ),
                  ),

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,

                        reservedSize: 35,

                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),

                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),

                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,

                        interval: 1,

                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();

                          if (index < 0 || index >= data.length) {
                            return const SizedBox();
                          }

                          final month = data[index].month.split("-").last;

                          return Padding(
                            padding: const EdgeInsets.only(top: 8),

                            child: Text(
                              month,

                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),

                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),

                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      spots: data
                          .asMap()
                          .entries
                          .map(
                            (entry) => FlSpot(
                              entry.key.toDouble(),

                              entry.value.count.toDouble(),
                            ),
                          )
                          .toList(),

                      isCurved: true,

                      barWidth: 3,

                      dotData: const FlDotData(show: true),

                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
