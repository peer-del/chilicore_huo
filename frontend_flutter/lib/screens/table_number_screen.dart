import 'package:flutter/material.dart';
import 'package:peerapat_k_flutter_learning/screens/homemenu_screen.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_action_button.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_text_field.dart';

// --- Table Number Screen ---
class TableNumberScreen extends StatelessWidget {
  const TableNumberScreen({super.key});

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
                  // 1. Dragon tail at the bottom
                  Positioned(
                    bottom: -50,
                    child: Image.asset(
                      'assets/images/dragon_tail.png',
                      height: 50,
                    ),
                  ),
                  // The main form container
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'TABLE NUMBER',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter your table number:',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        const StyledTextField(
                          hint: "Table Number",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 30),
                        StyledActionButton(
                          text: "Submit",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const HomeMenuScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Dragon head peeking from the top
                  Positioned(
                    top: -128,
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
