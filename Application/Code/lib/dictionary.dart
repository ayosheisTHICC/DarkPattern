import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkPattern {
  final String name;
  final String description;
  final List<String> companies;

  DarkPattern({required this.name, required this.description, required this.companies});

  factory DarkPattern.fromJson(Map<String, dynamic> json) {
    return DarkPattern(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      companies: List<String>.from(json['companies'] ?? []),
    );
  }
}

class DarkPatternDictionary extends StatefulWidget {
  @override
  _DarkPatternDictionaryState createState() => _DarkPatternDictionaryState();
}

class _DarkPatternDictionaryState extends State<DarkPatternDictionary> {
  List<DarkPattern> _darkPatterns = [];
  List<DarkPattern> _filteredPatterns = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      String data = await rootBundle.loadString('assets/company_dark_patterns.json');
      final List<dynamic> jsonResult = jsonDecode(data);
      List<DarkPattern> patterns = jsonResult.map((json) => DarkPattern.fromJson(json)).toList();
      setState(() {
        _darkPatterns = patterns;
        _filteredPatterns = patterns; // Initialize filtered list with all patterns
      });
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  void _searchDarkPattern(String companyName) {
    if (companyName.isEmpty) {
      setState(() {
        _filteredPatterns = _darkPatterns;
      });
      return;
    }

    setState(() {
      _filteredPatterns = _darkPatterns.where((pattern) =>
          pattern.companies.any((company) => company.toLowerCase().contains(companyName.toLowerCase()))).toList();
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
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _searchDarkPattern,
              decoration: InputDecoration(
                labelText: 'Enter company name',
                hintText: 'Type a company name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filteredPatterns.isEmpty
                ? Center(child: Text('No matching patterns found.'))
                : ListView.builder(
                    itemCount: _filteredPatterns.length,
                    itemBuilder: (context, index) {
                      final darkPattern = _filteredPatterns[index];
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

class DarkPatternApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Pattern Dictionary',
      home: DarkPatternDictionary(),
    );
  }
}

void main() {
  runApp(DarkPatternApp());
}
