import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub_invest_flutter/core/network/api.client.dart';
import '../data/models/signup.request.dart';
import '../data/repositories/auth.repository.dart';
import 'package:hub_invest_flutter/core/storage/secure.storage.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();

  final isLoading = false.obs;

  // Inicialize o AuthRepository com o ApiClient e SecureStorage
  late final AuthRepository authRepository;

  @override
  void onInit() {
    super.onInit();
    authRepository = AuthRepository(ApiClient(SecureStorage()));
  }

  Future<void> signup() async {
    try {
      isLoading.value = true;

      final request = SignupRequest(
        nome: nameController.text,
        email: emailController.text,
        senha: passwordController.text,
        pais: countryController.text,
        telefone: phoneController.text,
      );

      final response = await authRepository.signup(request);

      Get.snackbar("Sucesso", "Conta criada com sucesso: ${response.usuarioId}");
      Get.offAllNamed("/home");
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
