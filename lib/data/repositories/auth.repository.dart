import 'package:dio/dio.dart';
import 'package:hub_invest_flutter/core/network/api.client.dart';
import 'package:hub_invest_flutter/data/models/login.response.dart';
import 'package:hub_invest_flutter/data/models/signup.request.dart';
import 'package:hub_invest_flutter/data/models/signup.response.dart';
import 'package:hub_invest_flutter/data/models/user.response.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  // Método antigo de registro (pode manter ou remover se preferir)
  Future<UserResponse> register({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      final response = await apiClient.dio.post(
        "/auth/criar",
        data: {
          "name": nome,
          "email": email,
          "password": senha,
        },
      );

      return UserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao registrar");
    }
  }

  // Novo método signup usado pelo SignupController
  Future<SignupResponse> signup(SignupRequest request) async {
    try {
      final response = await apiClient.dio.post(
        "/auth/criar", // ajuste para o endpoint correto da sua API
        data: {
          "name": request.nome,
          "email": request.email,
          "password": request.senha,
          "country": request.pais,
          "phone": request.telefone,
        },
      );

      return SignupResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao criar conta");
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String senha,
  }) async {
    try {
      final response = await apiClient.dio.post(
        "/auth/login",
        data: {
          "email": email,
          "password": senha,
        },
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      // salva o token para ser usado depois no ApiClient
      await apiClient.secureStorage.saveToken(loginResponse.token);

      return loginResponse;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao realizar login");
    }
  }
}
