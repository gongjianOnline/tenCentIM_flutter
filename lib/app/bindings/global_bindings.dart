import 'package:get/get.dart';

import '../controllers/circle_list_controller.dart';
import "../controllers/init_tencent_im_controller.dart";
import '../controllers/tencent_message_controller.dart';
import '../controllers/tencent_relationship_controller.dart';
import '../controllers/tencent_session_controller.dart';
import '../controllers/tencent_user_controller.dart';
class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitTencentImController>(
      () => InitTencentImController(),
    );
    Get.lazyPut<TencentUserController>(
      () => TencentUserController(),
    );
    Get.lazyPut<TencentRelationshipController>(
      () => TencentRelationshipController(),
    );
    Get.lazyPut<TencentSessionController>(
      () => TencentSessionController(),
    );
    Get.lazyPut<TencentMessageController>(
      () => TencentMessageController(),
    );
    Get.lazyPut<CircleListController>(
      () => CircleListController(),
    );


  }

}