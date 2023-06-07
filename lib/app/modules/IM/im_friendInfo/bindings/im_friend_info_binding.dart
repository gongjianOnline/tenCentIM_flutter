import 'package:get/get.dart';

import '../controllers/im_friend_info_controller.dart';

class ImFriendInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImFriendInfoController>(
      () => ImFriendInfoController(),
    );
  }
}
