import 'package:get/get.dart';

import '../controllers/new_friend_controller.dart';

class NewFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewFriendController>(
      () => NewFriendController(),
    );
  }
}
