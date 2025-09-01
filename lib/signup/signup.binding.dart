import 'package:get/get.dart';
import 'package:hub_invest_flutter/core/network/api.client.dart';
import 'package:hub_invest_flutter/core/storage/secure.storage.dart';
import 'signup.controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecureStorage());
    Get.lazyPut(() => ApiClient(Get.find<SecureStorage>()));
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
