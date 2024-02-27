import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebsiteData {
  final int rank;
  final String domain;
  final String avgVisitDuration;
  final double pagesPerVisit;
  final String bounceRate;

  WebsiteData({
    required this.rank,
    required this.domain,
    required this.avgVisitDuration,
    required this.pagesPerVisit,
    required this.bounceRate,
  });

  factory WebsiteData.fromJson(Map<String, dynamic> json) {
    return WebsiteData(
      rank: json['tw-table__rank'],
      domain: json['tw-table__domain'],
      avgVisitDuration: json['tw-table__avg-visit-duration'],
      pagesPerVisit: json['tw-table__pages-per-visit'].toDouble(),
      bounceRate: json['tw-table__bounce-rate'],
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
  runApp(VisitedScreen());
}

class VisitedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Website Data',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Website Data'),
        // ),
        body: Center(
          child: FutureBuilder<List<WebsiteData>>(
            future: fetchWebsiteData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Rank: ${snapshot.data![index].rank}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Company: ${snapshot.data![index].domain}'),
                          Text('Average Visit Duration: ${snapshot.data![index].avgVisitDuration}'),
                          Text('Pages Per Visit: ${snapshot.data![index].pagesPerVisit}'),
                          Text('Bounce Rate: ${snapshot.data![index].bounceRate}'),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
