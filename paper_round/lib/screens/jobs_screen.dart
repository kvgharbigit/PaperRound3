import 'package:flutter/material.dart';

import '../models/job.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final List<ChartData> chartData = [
      ChartData('Sohil', 80, primaryColor),
      ChartData('Kayvan', 85, primaryColor),
      ChartData('Gingivitis', 90, primaryColor),
      ChartData('Mike', 95, primaryColor),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Team Progress',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 70, 10),
              child: JobsProgressChart(chartData: chartData),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Jobs List',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: dummyJobs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: CircleAvatar(
                      child: dummyJobs[index].assignee != null
                          ? Text(dummyJobs[index].assignee![0])
                          : const Icon(Icons.person),
                    ),
                    title: Text(
                      dummyJobs[index].patientName,
                      softWrap: true,
                    ),
                    subtitle: Text(
                      (dummyJobs[index].assignee ?? 'Unassigned') +
                          '\n' +
                          dummyJobs[index].description,
                      softWrap: true,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class JobsProgressChart extends StatelessWidget {
  const JobsProgressChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries>[
        RadialBarSeries<ChartData, String>(
          maximumValue: 100,
          dataSource: chartData,
          dataLabelMapper: (ChartData data, _) {
            return data.memberName;
          },
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: Theme.of(context).textTheme.bodySmall!,
          ),
          xValueMapper: (ChartData data, _) => data.memberName,
          yValueMapper: (ChartData data, _) => data.jobProgress,
          pointColorMapper: (chartData, index) {
            return chartData.color.withRed((index ^ 2 + 5) * 25);
          },
          sortingOrder: SortingOrder.descending,
          cornerStyle: CornerStyle.bothCurve,
          radius: '100%',
          name: 'Progress',
        ),
      ],
    );
  }
}

class ChartData {
  String memberName;
  double jobProgress;
  Color color;

  ChartData(this.memberName, this.jobProgress, this.color);
}
