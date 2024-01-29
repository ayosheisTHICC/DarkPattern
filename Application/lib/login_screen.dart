import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'singup_screen.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your existing UI code
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'), // Replace 'assets/logo.png' with your logo path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Vibur',
                  fontSize: 50.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20.0),
              Form(
                child: Column(
                  children: [
                    // Add your text fields here, using TextField or TextFormField
                    // Example:
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _login();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 26, 26, 26),
                ),
                child: Text('Log in', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen(existingUser: User(firstName: '', lastName: '', email: ''))),
    );
  },
  style: ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 26, 26, 26),
  ),
  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
),

            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Implement your login logic here
    // For simplicity, let's just print the entered username and password
    print('Username: $username');
    print('Password: $password');

    // You can add authentication logic here

    //Navigate to DashboardAnalysis page if login is successful
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }
}
