import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  final User existingUser;
  SignUpScreen({required this.existingUser});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.existingUser.firstName;
    _lastNameController.text = widget.existingUser.lastName;
    _emailController.text = widget.existingUser.email;
  }
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
            children: [
              SizedBox(height: 32), 
              Text(
                'Sign Up',
                style: TextStyle(
                  color: const Color.fromARGB(255, 40, 40, 40),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _firstNameController,
                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 6, 6, 6)), 
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black, // Border color
                          ),
                          borderRadius: BorderRadius.circular(12.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black, // Focused border color
                          ),
                          borderRadius: BorderRadius.circular(12.0), // Border radius
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _lastNameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),  
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Perform sign-up logic with the entered data
                        _performSignUp();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 169, 169, 169), // Button color
                        textStyle: TextStyle(color: Colors.white), // Button text color
                      ),
                      child: Text('Sign Up',style: TextStyle(color: Colors.black
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performSignUp() {
    // Implement your sign-up logic here
    // You can access the entered data using _firstNameController.text, _lastNameController.text, and _emailController.text
    // For simplicity, I'm just printing the data here
    print('First Name: ${_firstNameController.text}');
    print('Last Name: ${_lastNameController.text}');
    print('Email: ${_emailController.text}');
  }
}
class User {
  String firstName;
  String lastName;
  String email;
  User({required this.firstName, required this.lastName, required this.email});
}
