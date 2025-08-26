import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.controller.dart';
import 'widgets/emailField.widget.dart';
import 'widgets/passwordField.widget.dart';
import 'widgets/loginButton.widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // LOGO
                  Image.asset('assets/images/logo.png', height: 100),
                  const SizedBox(height: 24),

                  // TÍTULO E SUBTÍTULO
                  Text('Bem-vindo', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('Entre na sua conta', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black54)),
                  const SizedBox(height: 28),

                  // CAMPOS
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('E-mail', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 8),
                  const EmailField(),
                  const SizedBox(height: 16),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Senha', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 8),
                  const PasswordField(),

                  // ESQUECI MINHA SENHA
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: controller.forgotPassword,
                      child: const Text('Esqueci minha senha'),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // BOTÃO ENTRAR
                  const LoginButton(),
                  const SizedBox(height: 16),

                  // DIVISOR "ou"
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('ou', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black45)),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // CONTINUAR COM GOOGLE
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: controller.signInWithGoogle,
                      icon: Image.asset('assets/images/google.png', height: 20),
                      label: const Text('Continuar com Google'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // CADASTRO
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text('Não tem uma conta?', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black54)),
                      TextButton(
                        onPressed: controller.goToSignUp,
                        child: const Text('Cadastre-se'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
