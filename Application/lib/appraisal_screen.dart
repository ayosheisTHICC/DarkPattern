import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class AppraisalScreen extends StatelessWidget {
  Future<List<AppraisalData>> fetchData() async {
    final response = await http.get(Uri.parse('http://numbersapi.com/random/year?json')); // Replace with your actual API endpoint
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return [AppraisalData('Random Fact', data['number'].toDouble())];
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
              'Appraisal Results',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            FutureBuilder<List<AppraisalData>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                    height: 300,
                    child: charts.BarChart(
                      _createAppraisalSeries(snapshot.data!),
                      animate: true,
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

  List<charts.Series<AppraisalData, String>> _createAppraisalSeries(List<AppraisalData> data) {
    return [
      charts.Series<AppraisalData, String>(
        id: 'appraisal',
        domainFn: (AppraisalData appraisal, _) => appraisal.category,
        measureFn: (AppraisalData appraisal, _) => appraisal.value,
        data: data,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (AppraisalData appraisal, _) => '${appraisal.value}',
      ),
    ];
  }
}

class AppraisalData {
  final String category;
  final double value;

  AppraisalData(this.category, this.value);
}
