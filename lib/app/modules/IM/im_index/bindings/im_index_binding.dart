import 'package:get/get.dart';

import '../controllers/im_index_controller.dart';

class ImIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImIndexController>(
      () => ImIndexController(),
    );
  }
}
