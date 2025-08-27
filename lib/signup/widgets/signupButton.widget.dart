import 'package:flutter/material.dart';

class SignupButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SignupButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          "Criar conta",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
