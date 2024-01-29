import 'package:flutter/material.dart';

class DarkPatternDictionaryScreen extends StatefulWidget {
  @override
  _DarkPatternDictionaryScreenState createState() => _DarkPatternDictionaryScreenState();
}

class _DarkPatternDictionaryScreenState extends State<DarkPatternDictionaryScreen> {
  late List<DarkPattern> darkPatterns;
  late List<DarkPattern> filteredPatterns;

  @override
  void initState() {
    super.initState();
    darkPatterns = DarkPatternApi.getAllDarkPatterns();
    filteredPatterns = darkPatterns;
  }

  void filterPatterns(String query) {
    setState(() {
      filteredPatterns = darkPatterns
          .where((pattern) => pattern.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Pattern Dictionary'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: filterPatterns,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter dark pattern name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPatterns.length,
              itemBuilder: (context, index) {
                final darkPattern = filteredPatterns[index];
                return ListTile(
                  title: Text(darkPattern.name),
                  subtitle: Text(darkPattern.description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DarkPattern {
  final String name;
  final String description;

  DarkPattern({required this.name, required this.description});
}
class DarkPatternApi {
  static List<DarkPattern> getAllDarkPatterns() {
    return [
      DarkPattern(
        name: 'Misdirection',
        description: 'Aiming to distract the user from the real action happening.',
      ),
      DarkPattern(
        name: 'Hidden Costs',
        description: 'Charging users fees that they were not made aware of upfront.',
      ),
      // Add more dark patterns as needed
    ];
  }
}
