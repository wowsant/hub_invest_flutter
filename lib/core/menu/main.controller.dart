import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/menu.item.model.dart';
import '../../data/repositories/menu.repository.dart';
import '../routes/app_routes.dart';

class MainController extends GetxController {
  final MenuRepository repo;
  MainController(this.repo);

  final RxList<MenuItemModel> items = <MenuItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMenu();
  }

  Future<void> loadMenu() async {
    final data = await repo.fetchMenu(); // pode vir da API
    items.assignAll(data);
  }
}

// Helper para inicializar o MainController quando a app sobe
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuRepository>(() => MenuRepository());
    Get.put<MainController>(MainController(Get.find()));
  }
}
