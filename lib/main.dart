import 'package:flutter/material.dart';
import 'package:tamashaaa/screens/home/view/home_page.dart';
import 'package:tamashaaa/screens/splash_screen.dart';

void main() {
  runApp(const tamashaaa());
}

class tamashaaa extends StatelessWidget {
  const tamashaaa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
