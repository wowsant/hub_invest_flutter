import 'package:dio/dio.dart';
import 'package:hub_invest_flutter/core/network/api.client.dart';
import 'package:hub_invest_flutter/data/models/stock.model.dart';

enum StockFilter { positions, watchlist, all }

class StockRepository {
  final ApiClient apiClient;

  StockRepository(this.apiClient);

  Future<List<StockModel>> fetch(StockFilter filter, {String? query}) async {
    try {
      String endpoint = switch (filter) {
        StockFilter.positions => "/posicao",
        StockFilter.watchlist => "/watchlist",
        StockFilter.all => "/cotacoes",
      };

      final response = await apiClient.dio.get(endpoint, queryParameters: {
        if (query != null && query.isNotEmpty) "q": query,
      });

      final List data = response.data as List;
      return data.map((json) => StockModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao buscar ações");
    }
  }
}
