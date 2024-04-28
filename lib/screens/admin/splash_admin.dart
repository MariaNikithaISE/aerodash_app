import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:drone_app_1/screens/admin/sign_in_admin.dart'; // Import your sign-in page file

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool showAeroDash = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
    _animationController.repeat(reverse: true);
    _animationController.forward();

    // Delay showing AeroDash for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showAeroDash = true;
      });
    });

    // Navigate to sign-in page after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminSignInPage()),
      );
    });
  }

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
            ], // Example gradient colors
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Animated drone
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_animation.value * 400, 0.0), // Move drone from left to right
                    child: Lottie.asset("assets/drone.json", height: 125, width: 125),
                  );
                },
              ),
              // AeroDash
              AnimatedOpacity(
                opacity: showAeroDash ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500), // Fade in duration for AeroDash
                child: Text(
                  "AeroDash",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Pacifico', // Apply Amatic SC font
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold, // Make it bold
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.blue.withOpacity(0.5), // Blue shadow color with opacity
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ], // Add shadow effect
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
