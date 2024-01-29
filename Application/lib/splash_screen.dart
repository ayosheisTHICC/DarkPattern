import 'package:flutter/material.dart';
import './login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
      image: AssetImage('assets/background.jpg'), // Add the file extension
      fit: BoxFit.cover,
    ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'), // Replace 'assets/logo.png' with your logo path
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150, // Adjust the height as needed
                width: 150, // Adjust the width as needed
              ),
              SizedBox(height: 20.0),
              _build3DText('Sharktooth'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _build3DText(String text) {
    return Stack(
      children: [
        // Dark layer at the bottom
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Vibur',
            fontSize: 50.0,
            color: Color.fromARGB(255, 46, 46, 46),
          ),
        ),
        // Light layer on top to simulate 3D effect
        Positioned(
          top: 2.0,
          left: 2.0,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Vibur',
              fontSize: 50.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
}
