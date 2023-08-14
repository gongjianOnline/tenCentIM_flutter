import 'package:flutter_im/app/common/storage.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';

import '../../../controllers/tencent_user_controller.dart';

class MyCodeController extends GetxController {
  
  /* 建立视图层和控制器关联 */
  RxString titleName = "扫一扫上面的二维码".obs;

  /* 调用腾讯用户信息模块 */
  TencentUserController tencentUserController = Get.find();
  /* 用户信息 */
  Rx<V2TimUserFullInfo> userInfo = V2TimUserFullInfo().obs;


  @override
  void onInit() {
    super.onInit();
    handelGetUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 获取个人信息 */
  handelGetUserInfo()async{
    userInfo.value = await tencentUserController.tenCentGetSelfInfo();
  }

  
}
