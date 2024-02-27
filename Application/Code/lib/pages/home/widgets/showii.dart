import 'package:flutter/material.dart';

class RiskCard extends StatefulWidget {
  @override
  _RiskCardState createState() => _RiskCardState();
}

class _RiskCardState extends State<RiskCard> {
  List<Map<String, String>> darkPatterns = [
    {'pattern': 'Misdirection'},
    {'pattern': 'Social Proof'},
    {'pattern': 'Scarcity'},
    {'pattern': 'Urgency'},
    {'pattern': 'Aggressive Opt-Out'},
  ];

  int darkPatternsDetected = 5; // Initial value

  void _updateDarkPatterns() {
    setState(() {
      darkPatternsDetected = darkPatterns.length; // Update dark patterns count
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 35, 42),
      body: Center(
        child: GestureDetector(
          onTap: _updateDarkPatterns, // Call method to update dark patterns
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 118, 117, 117),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildConsultantInfo(),
                SizedBox(height: 10),
                _buildPADInfo(),
                SizedBox(height: 10),
                _buildGauge(),
                SizedBox(height: 10),
                _buildInitialObservations(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConsultantInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Primary Consultant:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPADInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dark Patterns Detected:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$darkPatternsDetected',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }

  Widget _buildGauge() {
    return Center(
      child: Container(
        width: 200,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: 136,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Center(
              child: Text(
                '68',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialObservations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        darkPatterns.length,
        (index) => _buildObservationRow(
          'Pattern ${index + 1}:',
          darkPatterns[index]['pattern']!,
        ),
      ),
    );
  }

  Widget _buildObservationRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RiskCard(),
  ));
}
