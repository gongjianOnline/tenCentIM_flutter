import 'package:get/get.dart';
import 'package:tencent_mi_flutter/app/common/im_controller.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';

class MyIndexController extends GetxController {
  //TODO: Implement MyIndexController
  IMController imController = Get.find();


  RxString testName = "火蓝".obs;
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

  // 退出
  handelLogout(){
    imController.tenCentLogout();
  }

}
