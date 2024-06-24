import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tamashaaa/utils/colors.dart';
import 'package:tamashaaa/utils/widgets/bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adding 3 seconds of delay
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kbgsplash),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Center(
              child: SizedBox(
                width: 250,
                height: 120,
                child: Image.asset("assets/images/tamasha_logo.png"),
              ),
            ),
            const Spacer(flex: 2),
            // const Text(
            //   "Tamashaaa",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Colors.white,
            //   ),
            // ),
            // const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
