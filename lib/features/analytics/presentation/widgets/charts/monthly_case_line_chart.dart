import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';

class MonthlyCaseLineChart extends StatelessWidget {
  final List<MonthlyCaseTrend> trends;

  const MonthlyCaseLineChart({super.key, required this.trends});

  @override
  Widget build(BuildContext context) {
    if (trends.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text("No monthly case data available."),
        ),
      );
    }

    final spots = trends.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.caseCount.toDouble());
    }).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Monthly Case Trend",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 250,

              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),

                  borderData: FlBorderData(show: false),

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                      ),
                    ),

                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,

                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();

                          if (index < 0 || index >= trends.length) {
                            return const SizedBox();
                          }

                          final month = trends[index].month;

                          return Text(
                            "${month.month}/${month.year}",
                            style: const TextStyle(fontSize: 10),
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
                      spots: spots,

                      isCurved: true,

                      barWidth: 3,

                      dotData: const FlDotData(show: true),

                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
