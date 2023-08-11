import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';

import '../../../controllers/tencent_message_controller.dart';
import '../../../controllers/tencent_relationship_controller.dart';
import '../../../model/friendInfoModel.dart';

class FriendInfoController extends GetxController {

  /* 调用腾讯关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();
  /* 调用腾讯消息模块 */
  TencentMessageController tencentMessageController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = "添加好友".obs;

  /* 好友信息 */
  Rx<FriendInfo> friendObj = FriendInfo().obs;

  /*路由参数 
   * friendId 好友ID
  */
  RxString friendId = "".obs;

  @override
  void onInit() {
    super.onInit();
    print(Get.arguments["friendId"]);
    friendId.value = Get.arguments["friendId"];
    handleGetFriendInfo(Get.arguments["friendId"]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 获取好友信息 */
  handleGetFriendInfo(friendID)async{
    List<V2TimFriendInfoResult> result = await tencentRelationshipController.tencentGetFriendInfo(friendID);
    if(result.isNotEmpty){
      V2TimFriendInfoResult resultItem = result[0];
      friendObj.value = FriendInfo(
        relation:filterFriendInfo(resultItem.relation,"int"),
        userID : filterFriendInfo(resultItem.friendInfo!.userID,"string"),
        allowType: filterFriendInfo(resultItem.friendInfo?.userProfile?.allowType,"int"),
        birthday : filterFriendInfo(resultItem.friendInfo?.userProfile?.birthday,"int"),
        gender : filterFriendInfo(resultItem.friendInfo?.userProfile?.gender,"int"),
        nickName : filterFriendInfo(resultItem.friendInfo?.userProfile?.nickName,"string"),
        selfSignature  : filterFriendInfo(resultItem.friendInfo?.userProfile?.selfSignature ,"string"),
      );
    }
  }
  /* 过滤好友信息 */
  filterFriendInfo(data,type){
    switch (type) {
      case "int":
        return (data == null)?1:data;
      case "string":
        return (data == null || data == "")?"":data;
    }
  }


  /* 添加好友信息 */
  handleAddFriend(){
    tencentRelationshipController.tencentAddFriend(friendId.value);
  }

  /*跳转到聊天页面 */
  handelChart()async{
    bool status =  await tencentMessageController.tencentREADMessage(friendId.value);
    status?Get.toNamed("/chart",arguments: {"friendID":friendId.value}):null;
  }


}
