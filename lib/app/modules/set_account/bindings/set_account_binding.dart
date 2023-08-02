import 'package:get/get.dart';

import '../controllers/set_account_controller.dart';

class SetAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetAccountController>(
      () => SetAccountController(),
    );
  }
}
