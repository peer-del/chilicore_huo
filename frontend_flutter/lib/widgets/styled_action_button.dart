import 'package:flutter/material.dart';

// A styled action button widget
class StyledActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const StyledActionButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool isEnabled = onPressed != null;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: isEnabled
            ? const LinearGradient(colors: [Color(0xFFFFE082), Color(0xFFFFB26B)])
            : LinearGradient(colors: [Colors.grey.shade300, Colors.grey.shade400]),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: const Color(0xFFFFB26B).withAlpha(102),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ]
            : [],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isEnabled ? const Color(0xFFBF360C) : Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
