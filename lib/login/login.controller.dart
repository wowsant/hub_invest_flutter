import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub_invest_flutter/core/storage/secure.storage.dart';
import 'package:hub_invest_flutter/data/repositories/auth.repository.dart';

class LoginController extends GetxController {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthRepository authRepository;
  final SecureStorage secureStorage;

  LoginController(this.authRepository, this.secureStorage);

  // Estado do loading
  var isLoading = false.obs;

  // Campos
  final email = ''.obs;
  final password = ''.obs;

  // Validações
  String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Senha muito curta';
    }
    return null;
  }

  // Estado do botão e do password
  var obscurePassword = true.obs;

  bool get canSubmit => email.value.isNotEmpty && password.value.isNotEmpty;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      final result = await authRepository.login(
        email: email.value,
        senha: password.value,
      );

      await secureStorage.saveToken(result.token);

      Get.snackbar("Sucesso", "Login realizado com sucesso!");
      Get.offAllNamed("/home"); // navega para home
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Ações
  void forgotPassword() {
    // lógica de esqueci senha
  }

  void signInWithGoogle() {
    // lógica login Google
  }

  void goToSignUp() {
    Get.toNamed("/signup");
  }
}