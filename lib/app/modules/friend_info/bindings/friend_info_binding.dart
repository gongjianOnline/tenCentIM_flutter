import 'package:get/get.dart';

import '../controllers/friend_info_controller.dart';

class FriendInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendInfoController>(
      () => FriendInfoController(),
    );
  }
}
