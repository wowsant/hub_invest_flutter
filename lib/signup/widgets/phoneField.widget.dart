import 'package:flutter/material.dart';

class PhoneFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const PhoneFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: "Telefone",
        hintText: "(11) 99999-9999",
        border: OutlineInputBorder(),
      ),
    );
  }
}
