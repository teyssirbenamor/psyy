import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PsyApp());
}

class PsyApp extends StatelessWidget {
  const PsyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSY en POCHE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB3D9D9),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}