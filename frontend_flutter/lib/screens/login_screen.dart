import 'package:flutter/material.dart';
import 'package:peerapat_k_flutter_learning/screens/otp_screen.dart';
import 'package:peerapat_k_flutter_learning/screens/register_screen.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_action_button.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_text_field.dart';

// --- Login Screen ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFB74D), Color(0xFFFB8C00)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // 1. Dragon tail at the bottom (ให้อยู่หลังกล่อง)
                  Positioned(
                    bottom: -50, // ปรับให้หางโผล่พ้นขอบล่างพอดี
                    child: Image.asset(
                      'assets/images/dragon_tail.png',
                      height: 50,
                    ),
                  ),
                   // The main login form container (drawn last, so it appears on top)
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30), // Added top padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(color: Colors.black.withAlpha(26), blurRadius: 20, offset: const Offset(0, 10))],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Phone Number:',
                              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        const StyledTextField(hint: "Phone Number", keyboardType: TextInputType.phone),
                        const SizedBox(height: 30),
                        StyledActionButton(
                          text: "Login",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OtpScreen()));
                          },
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterScreen()));
                          },
                          child: const Text("Don't have an account? Register"),
                        )
                      ],
                    ),
                  ),
                  // Dragon head peeking from the top
                  Positioned(
                    top: -128, // Adjusted position
                    child: Image.asset(
                      'assets/images/dragon_head.png',
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
