import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login.controller.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LoginController>();
    return Obx(() => TextFormField(
          onChanged: (v) => c.password.value = v,
          validator: c.validatePassword,
          obscureText: c.obscurePassword.value,
          decoration: InputDecoration(
            labelText: 'Senha',
            suffixIcon: IconButton(
              onPressed: c.togglePasswordVisibility,
              icon: Icon(
                c.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ));
  }
}
