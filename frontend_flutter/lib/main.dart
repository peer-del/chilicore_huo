import 'package:flutter/material.dart';
import 'package:peerapat_k_flutter_learning/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFFFFA726),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFA726)),
      ),
      // Start the app with the LoginScreen
      home: const LoginScreen(),
    );
  }
}
