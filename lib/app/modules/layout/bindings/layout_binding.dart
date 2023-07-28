import 'package:get/get.dart';

import '../controllers/layout_controller.dart';
import "../../home/controllers/home_controller.dart";
import "../../friend/controllers/friend_controller.dart";
import "../../circle/controllers/circle_controller.dart";
import "../../my/controllers/my_controller.dart";

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FriendController>(
      () => FriendController(),
    );
    Get.lazyPut<CircleController>(
      () => CircleController(),
    );
    Get.lazyPut<MyController>(
      () => MyController(),
    );
  }
}
