import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const EmailFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "E-mail",
        hintText: "seu@email.com",
        border: OutlineInputBorder(),
      ),
    );
  }
}
