import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class WebsiteData {
  final int rank;
  final String domain;
  final String avgVisitDuration;
  final double pagesPerVisit;
  // final String bounceRate;

  WebsiteData({
    required this.rank,
    required this.domain,
    required this.avgVisitDuration,
    required this.pagesPerVisit,
    // required this.bounceRate,
  });

  factory WebsiteData.fromJson(Map<String, dynamic> json) {
    return WebsiteData(
      rank: json['tw-table__rank'],
      domain: json['tw-table__domain'],
      avgVisitDuration: json['tw-table__avg-visit-duration'],
      pagesPerVisit: json['tw-table__pages-per-visit'].toDouble(),
      // bounceRate: json['tw-table__bounce-rate'],
    );
  }
}

Future<List<WebsiteData>> fetchWebsiteData() async {
  final response = await http.get(Uri.parse('https://sharktooth.ecomlancers.com/Api/mobile_api1'));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => WebsiteData.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load website data');
  }
}

void main() {
  runApp(WebsiteScreen());
}

class WebsiteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Website Data',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: FutureBuilder<List<WebsiteData>>(
                future: fetchWebsiteData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // title: Text('Rank: ${snapshot.data![index].rank}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company: ${snapshot.data![index].domain}'),
                              Text('Average Visit Duration: ${snapshot.data![index].avgVisitDuration}'),
                              Text('Pages Per Visit: ${snapshot.data![index].pagesPerVisit}'),
                              // Text('Bounce Rate: ${snapshot.data![index].bounceRate}'),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Today Analysis',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1),
                                FlSpot(1, 2),
                                FlSpot(2, 1.5),
                                FlSpot(3, 2.5),
                                FlSpot(4, 2),
                                FlSpot(5, 2.5),
                              ],
                              isCurved: true,
                              color: Color.fromARGB(255, 37, 189, 189),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: true, border: Border.all(color: Colors.black, width: 1)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Avg of last 7 day ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 5)]), // Example value for toY
                            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 6)]),
                            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 7)]),
                            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 8)]),
                            BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 7)]),
                            BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 6)]),
                          ],
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: true, border: Border.all(color: Colors.black, width: 1)),
                        ),
                      ),
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
