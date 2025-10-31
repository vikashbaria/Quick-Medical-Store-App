import 'package:flutter/material.dart';
import 'dart:async';
import 'package:medical_store_mobile_app/screens/walkthrough.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Walkthrough()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔹 Background Image (visible now)
          Positioned.fill(
            child: Image.asset(
              "assets/splash.png",
              fit: BoxFit.cover, // fill full screen
            ),
          ),

          // 🔹 Gradient with transparency
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(
                      0xFF2D9CDB,
                    ).withOpacity(0.9), // 👈 reduce opacity here
                    Color(0xFF2F80ED).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/splash_icons.png"),
                ),
                SizedBox(height: 10),
                Text(
                  "Quick Medical",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
