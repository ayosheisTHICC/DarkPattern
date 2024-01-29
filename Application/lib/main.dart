import 'package:darkpattern/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF3F3D3D),
        scaffoldBackgroundColor: Color(0xFF0D0C0C),
      ),
      home: SplashScreen(),
    );
  }
}
