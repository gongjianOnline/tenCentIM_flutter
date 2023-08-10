

import 'package:flutter_im/app/controllers/circle_list_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';

import '../../../controllers/tencent_relationship_controller.dart';

class CircleController extends GetxController {

  /* 建立视图层和控制器关联 */
  RxString titleName = "好友".obs;
  /* 调用朋友圈模块 */
  CircleListController circleListController = Get.find();
  /* 调用腾讯云用户模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();

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

  /* 获取用户信息 */
  Future<String> handelUserInfo(friedId)async{
    List<V2TimFriendInfoResult> result = await tencentRelationshipController.tencentGetFriendInfo(friedId);
    return result[0].friendInfo?.userProfile?.nickName as String;
  }

}
