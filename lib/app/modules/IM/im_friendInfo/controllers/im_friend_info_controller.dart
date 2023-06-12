import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';

class ImFriendInfoController extends GetxController {
  //TODO: Implement ImFriendInfoController
  IMRelationship imRelationship = Get.find();

  RxString titleName = "添加好友".obs;
  V2TimUserFullInfo? userFullInfo;
  @override
  void onInit() {
    super.onInit();
    print(Get.arguments["itemInfo"]);
    userFullInfo = Get.arguments["itemInfo"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handelAddFriend(){
    imRelationship.addFriend(userFullInfo!.userID as String);
  }


}
