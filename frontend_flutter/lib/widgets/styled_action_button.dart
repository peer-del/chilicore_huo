import 'package:flutter/material.dart';

// A styled action button widget
class StyledActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const StyledActionButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(colors: [Color(0xFFFFE082), Color(0xFFFFB26B)]),
        boxShadow: [BoxShadow(color: const Color(0xFFFFB26B).withAlpha(102), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, color: Color(0xFFBF360C), fontWeight: FontWeight.bold)),
      ),
    );
  }
}
