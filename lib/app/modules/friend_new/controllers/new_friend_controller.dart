import 'package:get/get.dart';

import '../../../controllers/tencent_relationship_controller.dart';

class NewFriendController extends GetxController {

  /* 调用好友关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = "请求列表".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
