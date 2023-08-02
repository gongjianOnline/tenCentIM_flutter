import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';

import '../../../controllers/tencent_user_controller.dart';

class MyController extends GetxController {
  
  /*建立控制器和视图层关联 */
  RxString titleName = "我的".obs;

  /* 调用腾讯用户登录模块 */
  TencentUserController tencentUserController = Get.find();

  /*我的信息 */
  Rx<V2TimUserFullInfo> selfInfo = V2TimUserFullInfo().obs;
  

  @override
  void onInit() {
    super.onInit();
    
    handleGetUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 获取用户信息 */
  handleGetUserInfo()async{
    V2TimUserFullInfo? result = await tencentUserController.tenCentGetSelfInfo();
    
    if(result != null){
      selfInfo.value = result;
      print(selfInfo.value.userID);
    }
    update();
  }


}
