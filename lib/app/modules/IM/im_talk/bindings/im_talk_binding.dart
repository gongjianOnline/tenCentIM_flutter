import 'package:get/get.dart';

import '../controllers/im_talk_controller.dart';

class ImTalkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImTalkController>(
      () => ImTalkController(),
    );
  }
}
