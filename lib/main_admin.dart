import 'package:flutter/material.dart';
import 'package:drone_app_1/screens/admin/admin_home.dart'; // Import your splash screen
import 'package:drone_app_1/screens/admin/sign_in_admin.dart';
import 'package:drone_app_1/screens/admin/splash_admin.dart';// Import your sign-in page

void main() {
  runApp(MainAdminApp());
}

class MainAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Specify initial route
      routes: {
        '/': (context) => SplashScreen(), // Define route for splash screen
        '/signin': (context) => AdminSignInPage(), // Define route for sign-in page
        // Add more routes for other pages if needed
      },
    );
  }
}
