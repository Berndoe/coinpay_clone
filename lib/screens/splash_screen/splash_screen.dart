import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  // This function will start the fade-in animation
  void _startAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });

      // After the animation completes, navigate to the next screen
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration:
              const Duration(seconds: 2), // Duration for the fade-in effect
          child: Image.asset(
            'assets/images/splash screen.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
