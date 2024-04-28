import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6CD8D4),
              Color(0xFF5E4690),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // AeroDash title
              Text(
                'AeroDash',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change the text color to white
                ),
              ),
              SizedBox(height: 32.0),
              // Sign-in fields
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white, // Change the text field background color to white
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white, // Change the text field background color to white
                ),
              ),
              SizedBox(height: 16.0),
              // Sign-in button
              ElevatedButton(
                onPressed: () {
                  // Perform sign-in action
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 8.0),
              // Sign-up option
              TextButton(
                onPressed: () {
                  // Navigate to sign-up page
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(color: Colors.white), // Change the text color to white
                ),
              ),
              // Skip sign-in option
              TextButton(
                onPressed: () {
                  // Navigate to product listing page without signing in
                  Navigator.pushReplacementNamed(context, '/productListing');
                },
                child: Text(
                  'Skip Sign In',
                  style: TextStyle(color: Colors.white), // Change the text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
