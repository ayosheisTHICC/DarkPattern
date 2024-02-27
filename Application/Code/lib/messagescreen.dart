import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hue/pages/home/widgets/showii.dart';
import 'package:image_picker/image_picker.dart';

class DarkPatternAnalyzerScreen extends StatefulWidget {
  @override
  _DarkPatternAnalyzerScreenState createState() =>
      _DarkPatternAnalyzerScreenState();
}

class _DarkPatternAnalyzerScreenState
    extends State<DarkPatternAnalyzerScreen> {
  bool _containsDarkPatterns = false;
  int _darkPatternsCount = 0;
  File? _image;

  // Method to pick an image from device
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _containsDarkPatterns = false; // Reset analysis result when a new image is picked
        _darkPatternsCount = 0; // Reset dark patterns count
      });
    }
  }

  // Method to analyze the picked image for dark patterns
  Future<void> _analyzeImageForDarkPatterns() async {
    if (_image != null) {
      // Implement your analysis logic here
      // For demonstration purposes, let's assume the image always contains dark patterns
      setState(() {
        _containsDarkPatterns = true;
        _darkPatternsCount = 5; 
      });
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dark Pattern Analyzer'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image != null
                ? Container(
                    height: 200,
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  )
                : ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Pick Image'),
                  ),
            SizedBox(height: 20),
            _containsDarkPatterns
                ? Column(
                    children: [
                      Text(
                        'Dark patterns detected!',
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Number of dark patterns: $_darkPatternsCount',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: _analyzeImageForDarkPatterns,
                    child: Text('Analyze Image'),
                  ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>RiskCard()),
            );
                  },
                  child: Text('Show Details'),
                ),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
