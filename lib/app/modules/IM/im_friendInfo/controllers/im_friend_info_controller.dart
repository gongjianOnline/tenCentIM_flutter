import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';

class ImFriendInfoController extends GetxController {
  //TODO: Implement ImFriendInfoController
  IMRelationship imRelationship = Get.find();

  RxString titleName = "添加好友".obs;
  RxString userID = "".obs;
  V2TimFriendInfoResult? friendInfo;
  @override
  void onInit() async{
    super.onInit();
    userID.value = Get.arguments["userID"];
    friendInfo = await imRelationship.getFriendInfo(userID.value);
    print("获取了好友信息");
    print(friendInfo?.relation);
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
    imRelationship.addFriend(userID as String);
  }


}
