import 'package:flutter/material.dart';
import 'package:peerapat_k_flutter_learning/screens/otp_screen.dart';
import 'package:peerapat_k_flutter_learning/screens/register_screen.dart';
import 'package:peerapat_k_flutter_learning/widgets/styled_action_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/countries.dart';

// --- Login Screen ---
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _completePhoneNumber = "";
  bool _isButtonEnabled = false;
  String _initialCountryCode = 'TH';
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // Detect country from international prefix (e.g. +81)
  void _detectCountryFromPrefix(String value) {
    if (value.startsWith('+')) {
      // Sort countries by dial code length descending to match most specific first
      List<Country> sortedCountries = List.from(countries);
      sortedCountries.sort((a, b) => b.dialCode.length.compareTo(a.dialCode.length));

      for (var country in sortedCountries) {
        if (value.startsWith('+${country.dialCode}')) {
          if (_initialCountryCode != country.code) {
            setState(() {
              _initialCountryCode = country.code;
              // Remove the dial code part from the text field
              String remaining = value.substring(country.dialCode.length + 1);
              _phoneController.text = remaining;
              _phoneController.selection = TextSelection.fromPosition(
                TextPosition(offset: remaining.length),
              );
            });
          }
          break;
        }
      }
    }
  }

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
                  // Dragon tail at the bottom
                  Positioned(
                    bottom: -50,
                    child: Image.asset(
                      'assets/images/dragon_tail.png',
                      height: 50,
                    ),
                  ),
                  // Main login form container
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 40, 25, 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(26),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 35),

                        // Phone Number Input Section using IntlPhoneField
                        IntlPhoneField(
                          key: ValueKey(_initialCountryCode),
                          controller: _phoneController,
                          initialCountryCode: _initialCountryCode,
                          languageCode: "en",
                          disableLengthCheck: true, // Allow typing freely without length blocking
                          decoration: InputDecoration(
                            labelText: 'Phone No.',
                            labelStyle: const TextStyle(color: Color(0xFF1976D2), fontWeight: FontWeight.w500),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Enter number',
                            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF1976D2)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF1976D2), width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            counterText: '',
                          ),
                          onChanged: (phone) {
                            String number = phone.number;

                            // Auto-detect country from + prefix
                            if (number.startsWith('+')) {
                              _detectCountryFromPrefix(number);
                              return;
                            }

                            setState(() {
                              // Prepare the number for backend by stripping the leading '0'
                              // (e.g., 0812345678 becomes +66812345678)
                              String cleanNumber = number.startsWith('0') ? number.substring(1) : number;
                              _completePhoneNumber = '${phone.countryCode}$cleanNumber';

                              try {
                                // Manual validation check when disableLengthCheck is true
                                // Typically Thai numbers are 9 digits without leading 0.
                                _isButtonEnabled = cleanNumber.length >= 8 && cleanNumber.length <= 11;
                              } catch (e) {
                                _isButtonEnabled = false;
                              }
                            });
                          },
                          onCountryChanged: (country) {
                            setState(() {
                              _initialCountryCode = country.code;
                              _isButtonEnabled = false;
                            });
                          },
                        ),

                        const SizedBox(height: 35),
                        StyledActionButton(
                          text: "Login",
                          onPressed: _isButtonEnabled
                              ? () {
                                  // Use _completePhoneNumber for API calls
                                  debugPrint("Logging in with: $_completePhoneNumber");
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OtpScreen()));
                                }
                              : null,
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
