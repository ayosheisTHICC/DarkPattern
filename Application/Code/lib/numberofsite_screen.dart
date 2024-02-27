import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class NumberOfSitesScreen extends StatefulWidget {
  @override
  _NumberOfSitesScreenState createState() => _NumberOfSitesScreenState();
}

class _NumberOfSitesScreenState extends State<NumberOfSitesScreen> {
  Future<List<double>> fetchData() async {
    final response = await http.get(Uri.parse('https://numbersapi.com/random/year?json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final double number = double.parse(data['number']);
      return [number];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Number of Sites Visited',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            FutureBuilder<List<double>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: snapshot.data!.asMap().entries.map((entry) {
                              return FlSpot(entry.key.toDouble(), entry.value);
                            }).toList(),
                            isCurved: true,
                            belowBarData: BarAreaData(show: false),
                            dotData: FlDotData(show: true),
                            //colors: [Colors.blue],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            //belowBarColor: Colors.transparent,
                          ),
                        ],
                        gridData: FlGridData(show: true),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
