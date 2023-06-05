import 'package:get/get.dart';

import '../controllers/im_add_user_controller.dart';

class ImAddUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImAddUserController>(
      () => ImAddUserController(),
    );
  }
}
