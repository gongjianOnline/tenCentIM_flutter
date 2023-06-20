import 'package:get/get.dart';
import 'package:tencent_mi_flutter/app/common/global_controller.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';

class BookIndexController extends GetxController {
  //TODO: Implement BookIndexController
  GlobalController globalController = Get.find();
  IMRelationship imRelationship = Get.find();

  final titleName = "通讯录".obs;

  @override
  void onInit()async {
    super.onInit();
    await globalController.friendListFun();
    imRelationship.getFriendList();
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
