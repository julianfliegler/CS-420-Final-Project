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
            body: Column(children: [
              //Initialize the chart widget
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Completion Rate'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SampleData, String>>[
                    LineSeries<_SampleData, String>(
                        color: const Color(0xffFFDC61),
                        dataSource: data,
                        xValueMapper: (_SampleData sample, _) => sample.year,
                        yValueMapper: (_SampleData sample, _) => sample.sales,
                        name: 'Run',
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true)),
                    LineSeries<_SampleData, String>(
                        color: const Color(0xFFF95858),
                        dataSource: data,
                        xValueMapper: (_SampleData sample, _) => sample.year,
                        yValueMapper: (_SampleData sample, _) =>
                            sample.sales % 5 * 3,
                        name: 'Read',
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true)),
                    LineSeries<_SampleData, String>(
                        color: const Color(0xff76DEFF),
                        dataSource: data,
                        xValueMapper: (_SampleData sample, _) => sample.year,
                        yValueMapper: (_SampleData sample, _) =>
                            sample.sales % 10 * 5 - 20,
                        name: 'Meditate',
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true))
                  ]),
              // spacing
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SfSparkBarChart(
                  color: const Color(0xFFF95858),
                  data: const <double>[1, 2, 4, 3, 2, 1, 2, 1],
                  axisCrossesAt: 0,
                  trackball: const SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  // labels
                  labelDisplayMode: SparkChartLabelDisplayMode.none,
                ),
              )
            ])));
  }
}

class _SampleData {
  _SampleData(this.year, this.sales);

  final String year;
  final double sales;
}
