import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login.controller.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LoginController>();
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (v) => c.email.value = v,
      validator: c.validateEmail,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        hintText: 'seu@email.com',
      ),
    );
  }
}
