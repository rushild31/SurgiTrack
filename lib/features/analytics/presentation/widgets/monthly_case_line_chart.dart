import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:surgitrack/features/analytics/domain/monthly_case_trend.dart';

class MonthlyCaseLineChart extends StatelessWidget {
  final List<MonthlyCaseTrend> trends;

  const MonthlyCaseLineChart({super.key, required this.trends});

  @override
  Widget build(BuildContext context) {
    if (trends.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: Text('No monthly case data available')),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 240,
          child: LineChart(
            LineChartData(
              minY: 0,
              gridData: const FlGridData(show: true),
              borderData: FlBorderData(show: true),
              titlesData: const FlTitlesData(
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  spots: List.generate(
                    trends.length,
                    (index) => FlSpot(
                      index.toDouble(),
                      trends[index].caseCount.toDouble(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
