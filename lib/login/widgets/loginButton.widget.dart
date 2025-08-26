import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login.controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LoginController>();
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: c.canSubmit ? c.login : null,
            child: c.isLoading.value
                ? const SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Entrar'),
          ),
        ));
  }
}
