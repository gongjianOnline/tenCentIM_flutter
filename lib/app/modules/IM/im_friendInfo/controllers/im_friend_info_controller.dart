import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';

class ImFriendInfoController extends GetxController {
  //TODO: Implement ImFriendInfoController

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

}
