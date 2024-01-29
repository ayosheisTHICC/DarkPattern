import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  final int darkPatternedSites;
  final int limit = 5; // Set your limit here

  AlertScreen({required this.darkPatternedSites});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: darkPatternedSites > limit
          ? Text('Warning! The number of dark-patterned sites has exceeded the limit.')
          : Text('No issues detected. Continue browsing safely.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

// Usage in your Dashboard or wherever appropriate
// if (darkPatternedSitesExceededLimit) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertScreen(darkPatternedSites: yourDarkPatternedSitesCount);
//     },
//   );
// }
