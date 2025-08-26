import 'package:dio/dio.dart';
import 'package:hub_invest_flutter/core/network/api.client.dart';
import 'package:hub_invest_flutter/data/models/login.response.dart';
import 'package:hub_invest_flutter/data/models/user.response.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  Future<UserResponse> register({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      final response = await apiClient.dio.post(
        "/auth/criar",
        data: {
          "nome": nome,
          "email": email,
          "senha": senha,
        },
      );

      return UserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao registrar");
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String senha,
  }) async {
    try {
      final response = await apiClient.dio.post(
        "/auth",
        data: {
          "email": email,
          "senha": senha,
        },
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao realizar login");
    }
  }
}
