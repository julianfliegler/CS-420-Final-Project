/* 
==============================
*    Title: progress_page.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Displays the user's overall progress across all habits.
==============================
*/

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressState();
}

class _ProgressState extends State<ProgressPage> {
  List<_SampleData> data = [
    _SampleData('Jan', 35),
    _SampleData('Feb', 28),
    _SampleData('Mar', 34),
    _SampleData('Apr', 32),
    _SampleData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(
              // make back arrow black
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Center(
                  child: Text('Overall Progress',
                      style: TextStyle(color: Colors.black))),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                //Initialize the chart widget
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(
                        text: 'Completion Rate',
                        textStyle: const TextStyle(color: Colors.black)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SampleData, String>>[
                      LineSeries<_SampleData, String>(
                          color: const Color(0xffFFDC61),
                          dataSource: data,
                          xValueMapper: (_SampleData sample, _) => sample.month,
                          yValueMapper: (_SampleData sample, _) =>
                              sample.completionRate,
                          name: 'Run',
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                      LineSeries<_SampleData, String>(
                          color: const Color(0xFFF95858),
                          dataSource: data,
                          xValueMapper: (_SampleData sample, _) => sample.month,
                          yValueMapper: (_SampleData sample, _) =>
                              sample.completionRate % 5 * 3,
                          name: 'Read',
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                      LineSeries<_SampleData, String>(
                          color: const Color(0xff76DEFF),
                          dataSource: data,
                          xValueMapper: (_SampleData sample, _) => sample.month,
                          yValueMapper: (_SampleData sample, _) =>
                              sample.completionRate % 10 * 5 - 20,
                          name: 'Meditate',
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true))
                    ]),
                // spacing
                const SizedBox(height: 10),

                SfCircularChart(
                    legend: Legend(isVisible: true),
                    series: <PieSeries<_SampleData, String>>[
                      PieSeries<_SampleData, String>(
                          explode: true,
                          explodeIndex: 0,
                          dataSource: data,
                          xValueMapper: (_SampleData data, _) => data.month,
                          yValueMapper: (_SampleData data, _) =>
                              data.completionRate,
                          //   dataLabelMapper: (_SampleData data, _) => data.text,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                    ]),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SfSparkBarChart(
                    // add labels for x axis
                    color: const Color(0xFFF95858),
                    data: const <double>[1, 2, 4, 3, 2, 1, 2, 1],
                    axisCrossesAt: 0,
                    trackball: const SparkChartTrackball(
                        activationMode: SparkChartActivationMode.tap),
                    // labels
                    labelDisplayMode: SparkChartLabelDisplayMode.none,
                  ),
                ),
              ]),
            )));
  }
}

class _SampleData {
  _SampleData(this.month, this.completionRate);

  final String month;
  final double completionRate;
}
