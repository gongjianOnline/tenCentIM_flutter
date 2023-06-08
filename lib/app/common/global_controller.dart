import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application.dart';

class GlobalController extends GetxController  {

  // 添加好友通知列表
  RxList<V2TimFriendApplication> addFriendList = <V2TimFriendApplication>[].obs;

  @override
  void onInit() async {}

  @override
  void onClose(){
    super.onClose();
  }

  


}