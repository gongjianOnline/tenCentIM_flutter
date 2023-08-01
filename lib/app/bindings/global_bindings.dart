import 'package:get/get.dart';

import "../controllers/init_tencent_im_controller.dart";

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitTencentImController>(
      () => InitTencentImController(),
    );
  }

}