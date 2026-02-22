import 'package:flutter/material.dart';
import 'package:peerapat_k_flutter_learning/screens/login_screen.dart';
import 'package:peerapat_k_flutter_learning/screens/otp_screen.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_action_button.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_text_field.dart';

// --- Register Screen ---
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            padding: const EdgeInsets.symmetric(vertical: 60.0),
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
                  // 3. The main login form container (อยู่ชั้นบนสุด)
                  Container(
                    // แก้ไข: เปลี่ยน Padding ให้เท่ากันทุกด้าน ไม่ต้องเผื่อด้านบน 80 แล้ว
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10))
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'REGISTER',
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
                        const StyledTextField(
                            hint: "Phone Number",
                            keyboardType: TextInputType.phone),
                        const SizedBox(height: 30),
                        StyledActionButton(
                          text: "Get OTP",
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const OtpScreen()));
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => const LoginScreen()));
                          },
                          child: const Text("Already have an account? Login"),
                        ),
                      ],
                    ),
                  ),
                  // 2. Dragon head peeking from the top (ให้อยู่หลังกล่อง)
                  Positioned(
                    top: -128, // ดันหัวมังกรขึ้นไปให้เกาะขอบบนของกล่อง
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
