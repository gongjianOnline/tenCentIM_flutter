import 'package:get/get.dart';

import '../controllers/my_code_controller.dart';

class MyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCodeController>(
      () => MyCodeController(),
    );
  }
}
