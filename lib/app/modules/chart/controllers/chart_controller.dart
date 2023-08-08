import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';

import '../../../controllers/tencent_message_controller.dart';
import '../../../controllers/tencent_relationship_controller.dart';
import '../../../model/friendInfoModel.dart';

class ChartController extends GetxController {
  /* 调用好友关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();
  /* 调用消息关系模块 */
  TencentMessageController tencentMessageController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = " ".obs;

  /* 输入框动态变量 */
  TextEditingController chartInputController = TextEditingController();
  RxInt chartInputIndex = 0.obs;

  /*好友ID */
  RxString friendID = "".obs;
  /*好友信息 */
  Rx<FriendInfo> friendInfo = FriendInfo().obs;


  @override
  void onInit() {
    super.onInit();
    /* 路由参数获取friendID */
    friendID.value = Get.arguments["friendID"];
    /* 获取好友资料 */
    handleGetFriendInfo(friendID.value);
    /* l拉去消息历史记录 */
    tencentMessageController.tencentHistoryMessage(friendID.value);
    /* 表单监听器 */
    chartInputController.addListener((){
      chartInputIndex.value = chartInputController.text.length;
    });
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
      friendInfo.value = FriendInfo(
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

  /* 发送消息 */
  handelSend(){
    tencentMessageController.tencentTextMessage(chartInputController.text,friendID.value);
  }



}
