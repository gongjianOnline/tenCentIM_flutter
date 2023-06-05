import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import "../../IM/im_index/controllers/im_index_controller.dart";

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ImIndexController>(
      () => ImIndexController(),
    );
  }
}
