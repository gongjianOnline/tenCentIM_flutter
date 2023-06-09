import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application_result.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';

import '../../../../common/global_controller.dart';

class BookNewPeopleController extends GetxController {
  //TODO: Implement BookNewPeopleController
  GlobalController globalController = Get.find();
  IMRelationship imRelationship = Get.find();

  RxString titleName = "新朋友".obs;
  @override
  void onInit() async{
    super.onInit();
    print("获取新朋友列表");
    imRelationship.friendApplication();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  // 同意好友
  handelAgreeFriend(userInfo){
    imRelationship.agreeFriend(userInfo);
  }
}
