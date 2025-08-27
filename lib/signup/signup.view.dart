import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub_invest_flutter/signup/widgets/countryField.widget.dart';
import 'package:hub_invest_flutter/signup/widgets/emailField.widget.dart';
import 'package:hub_invest_flutter/signup/widgets/nameField.widget.dart';
import 'package:hub_invest_flutter/signup/widgets/passwordField.widget.dart';
import 'package:hub_invest_flutter/signup/widgets/phoneField.widget.dart';
import 'package:hub_invest_flutter/signup/widgets/signupButton.widget.dart';
import 'signup.controller.dart';


class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const FlutterLogo(size: 80),
              const SizedBox(height: 16),
              Text("Criar conta", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text("Preencha seus dados para começar"),
              const SizedBox(height: 32),
              NameFieldWidget(controller: controller.nameController),
              const SizedBox(height: 16),
              EmailFieldWidget(controller: controller.emailController),
              const SizedBox(height: 16),
              PasswordFieldWidget(controller: controller.passwordController),
              const SizedBox(height: 16),
              CountryFieldWidget(controller: controller.countryController),
              const SizedBox(height: 16),
              PhoneFieldWidget(controller: controller.phoneController),
              const SizedBox(height: 24),
              SignupButtonWidget(onPressed: controller.signup),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Já tem uma conta? Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
