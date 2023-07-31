import 'package:get/get.dart';

import '../controllers/circle_send_controller.dart';

class CircleSendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CircleSendController>(
      () => CircleSendController(),
    );
  }
}
