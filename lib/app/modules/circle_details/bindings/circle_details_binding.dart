import 'package:get/get.dart';

import '../controllers/circle_details_controller.dart';

class CircleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CircleDetailsController>(
      () => CircleDetailsController(),
    );
  }
}
