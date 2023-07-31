import 'package:get/get.dart';

import '../controllers/circle_separate_controller.dart';

class CircleSeparateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CircleSeparateController>(
      () => CircleSeparateController(),
    );
  }
}
