import 'package:dio/dio.dart';
import 'package:hub_invest_flutter/core/storage/secure.storage.dart';

class ApiClient {
  final Dio dio;
  final SecureStorage secureStorage;

  ApiClient(this.secureStorage)
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://invest-api-net.onrender.com/api/v1", // sua API real
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Recupera o token do SecureStorage
          final token = await secureStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
}
