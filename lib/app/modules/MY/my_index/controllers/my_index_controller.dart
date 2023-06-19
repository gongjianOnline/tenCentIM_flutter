import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_mi_flutter/app/common/im_controller.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';
import 'package:tencent_mi_flutter/app/common/utils/storage.dart';

class MyIndexController extends GetxController {
  //TODO: Implement MyIndexController
  IMController imController = Get.find();
  IMRelationship imRelationship = Get.find();


  RxString testName = "退出账号".obs;
  RxList<V2TimUserFullInfo> userInfo = <V2TimUserFullInfo>[].obs;
  @override
  void onInit() async {
    super.onInit();
    V2TimUserFullInfo userInfoData = await imRelationship.getUsersInfoResFun();
    userInfo.add(userInfoData);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 退出
  handelLogout(){
    imController.tenCentLogout();
  }

}
