import 'package:flutter/material.dart';

class CountryFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const CountryFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "País",
        hintText: "Selecione seu país",
        border: OutlineInputBorder(),
      ),
    );
  }
}
