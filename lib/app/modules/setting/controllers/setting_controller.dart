import 'package:get/get.dart';

import '../../../controllers/tencent_user_controller.dart';

class SettingController extends GetxController {
  /* 调用腾讯用户登录模块 */
  TencentUserController tencentUserController = Get.find();

  /* 建立控制器和视图层关联 */
  RxString titleName = "设置".obs;

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

  /* 退出 */
  handleLogout(){
    tencentUserController.tenCentLogout();
  }
}
