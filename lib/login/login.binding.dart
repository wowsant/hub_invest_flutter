import 'package:get/get.dart';
import 'package:hub_invest_flutter/core/network/api.client.dart';
import 'package:hub_invest_flutter/core/storage/secure.storage.dart';
import 'package:hub_invest_flutter/data/repositories/auth.repository.dart';
import 'package:hub_invest_flutter/login/login.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => AuthRepository(Get.find<ApiClient>()));
    Get.lazyPut(() => SecureStorage());
    Get.lazyPut(() => LoginController(Get.find<AuthRepository>(), Get.find<SecureStorage>()));
  }
}
