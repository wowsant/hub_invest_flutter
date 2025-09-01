import 'package:flutter/material.dart';
import '../models/menu.item.model.dart';
import '../../core/routes/app_routes.dart';

class MenuRepository {
  Future<List<MenuItemModel>> fetchMenu() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      MenuItemModel(label: 'Posições', route: Routes.home, icon: Icons.pie_chart),
      MenuItemModel(label: 'Interesses', route: Routes.home, icon: Icons.star),
      MenuItemModel(label: 'Todos', route: Routes.home, icon: Icons.list),
      MenuItemModel(label: 'Sair', icon: Icons.logout, onTap: () {
        // implemente logout
      }),
    ];
  }
}
