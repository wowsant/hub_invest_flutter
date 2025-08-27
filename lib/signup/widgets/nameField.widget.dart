import 'package:flutter/material.dart';

class NameFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const NameFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "Nome completo",
        hintText: "Seu nome completo",
        border: OutlineInputBorder(),
      ),
    );
  }
}
