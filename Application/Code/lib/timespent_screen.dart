import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class TimeSpentScreen extends StatelessWidget {
  Future<List<String>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<String> tasks = jsonData.map((task) => task['title'].toString()).toList();
      return tasks;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(' '),
      ),
      body: FutureBuilder<List<String>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return buildUI(context, snapshot.data!);
          }
        },
      ),
    );
  }

  Widget buildUI(BuildContext context, List<String> data) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context,'Dark Pattern Detected',
    'Warning! This webpages may contain dark patterns designed to manipulate user behavior. Be cautious of deceptive practices and consider reviewing the app\'s privacy policy and terms of service. If you find any suspicious actions, report them to the app store and consider uninstalling the app.');
              },
              child: Text('Show Alert Dialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showTimeSpentDialog(context, data);
              },
              child: Text('Show Time Spent Dialog'),
            ),
            SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barGroups: _generateBarSections(data),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarSections(List<String> data) {
    List<Color> colors = List.generate(data.length, (index) => _getRandomColor());

    return List.generate(data.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            //y: 1,
            toY: 1, // Add this line
            color: colors[index],
            width: 20,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }

  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      (100 + (DateTime.now().microsecondsSinceEpoch % 155)).toInt(),
      (100 + (DateTime.now().microsecondsSinceEpoch % 155)).toInt(),
      (100 + (DateTime.now().microsecondsSinceEpoch % 155)).toInt(),
    );
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showTimeSpentDialog(BuildContext context, List<String> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Time Spent Dialog'),
          content: Column(
            children: [
              for (var item in data) Text(item),
              SizedBox(height: 10),
              Text('Keep up the good work!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}