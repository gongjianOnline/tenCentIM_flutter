import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';

import '../../../controllers/tencent_relationship_controller.dart';
import '../../../model/friendInfoModel.dart';

class CircleSeparateController extends GetxController {
  /* 调用腾讯获取用户信息模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = "南开大学网络教育学院".obs;
  /* 滚动条控制器 */
  ScrollController listViewController = ScrollController();
  /* 是否显示抬头 */
  RxBool isHeader = false.obs;

  /* 路由信息 */
  RxString userId = "".obs;

  /* 个人朋友圈的用户资料 */
  Rx<FriendInfo> circleUserInfo = FriendInfo().obs;
  

  @override
  void onInit() {
    super.onInit();
    
    /* 获取路由信息 */
    userId.value= Get.arguments["userId"];
    /* 添加滚动跳监听器 */
    listViewController.addListener(_scrollListener);
    /* 调用获取用户信息 */
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

  /* 监听下拉列表判断是否显示抬头 */
  void _scrollListener(){
    double scrollHeight = listViewController.offset;
    if( scrollHeight > 160 ){
      isHeader.value = true;
    }else{
      isHeader.value = false;
    }
  }

  /* 获取用户信息 */
  handleGetUserInfo()async{
    List<V2TimFriendInfoResult> result = await tencentRelationshipController.tencentGetFriendInfo(userId.value);
    if(result.isNotEmpty){
      V2TimFriendInfoResult resultItem = result[0];
      circleUserInfo.value = FriendInfo(
        relation:filterFriendInfo(resultItem.relation,"int"),
        userID : filterFriendInfo(resultItem.friendInfo!.userID,"string"),
        allowType: filterFriendInfo(resultItem.friendInfo?.userProfile?.allowType,"int"),
        birthday : filterFriendInfo(resultItem.friendInfo?.userProfile?.birthday,"int"),
        gender : filterFriendInfo(resultItem.friendInfo?.userProfile?.gender,"int"),
        nickName : filterFriendInfo(resultItem.friendInfo?.userProfile?.nickName,"string"),
        selfSignature  : filterFriendInfo(resultItem.friendInfo?.userProfile?.selfSignature ,"string"),
      );
    }
    print("打印 ${circleUserInfo.value.selfSignature == ""}");
  }

  /* 过滤用户的信息格式 */
  filterFriendInfo(data,type){
    switch (type) {
      case "int":
        return (data == null)?1:data;
      case "string":
        return (data == null || data == "")?"":data;
    }
  }




}
