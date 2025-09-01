import 'package:get/get.dart';
import '../core/network/api.client.dart';
import '../core/storage/secure.storage.dart';
import '../data/repositories/stock.repository.dart';
import 'home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecureStorage());
    Get.lazyPut(() => ApiClient(Get.find<SecureStorage>()));

    Get.lazyPut<StockRepository>(() => StockRepository(Get.find<ApiClient>()));

    Get.put<HomeController>(HomeController(Get.find<StockRepository>()));
  }
}
