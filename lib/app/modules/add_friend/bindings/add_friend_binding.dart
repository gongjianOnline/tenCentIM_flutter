import 'package:get/get.dart';

import '../controllers/add_friend_controller.dart';

class AddFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFriendController>(
      () => AddFriendController(),
    );
  }
}
