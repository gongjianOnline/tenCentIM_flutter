import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_mi_flutter/app/common/im_controller.dart';
import 'dart:ui';

import 'package:tencent_mi_flutter/app/common/utils/storage.dart';
class ImIndexController extends GetxController {
  //TODO: Implement ImIndexController
  IMController imController = Get.find();
  RxString userName = "".obs;
  @override
  void onInit() async {
    super.onInit();
    var userInfo = await Storage.getData("userInfo");
    userName.value = userInfo;
    xxx();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 拉去会话列表
  xxx()async{
    var response =await imController.tenCentSessionList();
   
  }

}
