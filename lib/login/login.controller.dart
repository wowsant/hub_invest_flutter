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
/*
  void login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      // Aqui você colocaria a lógica real de login
      await Future.delayed(Duration(seconds: 2)); 
      print('Login realizado com sucesso!');
    } catch (e) {
      print('Erro no login: $e');
    } finally {
      isLoading.value = false;
    }
  }

*/

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
    // lógica para ir para tela de cadastro
  }
}















/*



import 'package:get/get.dart';
import 'package:hub_invest_flutter/core/storage/secure.storage.dart';
import 'package:hub_invest_flutter/data/repositories/auth.repository.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  final SecureStorage secureStorage;

  LoginController(this.authRepository, this.secureStorage);

  var email = "".obs;
  var senha = "".obs;
  var isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;
      final result = await authRepository.login(
        email: email.value,
        senha: senha.value,
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
}
*/


/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // estados
  final email = ''.obs;
  final password = ''.obs;
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  // validações simples
  String? validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Informe seu e-mail';
    final regex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');
    if (!regex.hasMatch(v)) return 'E-mail inválido';
    return null;
  }

  String? validatePassword(String? value) {
    final v = value ?? '';
    if (v.isEmpty) return 'Informe sua senha';
    if (v.length < 6) return 'Mínimo de 6 caracteres';
    return null;
  }

  bool get canSubmit =>
      email.value.isNotEmpty && password.value.length >= 6 && !isLoading.value;

  void togglePasswordVisibility() => obscurePassword.toggle();

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800)); // simulação
    isLoading.value = false;

    // navega pra home (ajuste a rota se precisar)
    Get.offAllNamed('/home');
  }

  void forgotPassword() {
    Get.snackbar('Recuperação', 'Fluxo de recuperar senha ainda não implementado');
  }

  void signInWithGoogle() {
    Get.snackbar('Google', 'Login com Google ainda não implementado');
  }

  void goToSignUp() {
    Get.snackbar('Cadastro', 'Navegar para tela de cadastro');
  }
}
*/