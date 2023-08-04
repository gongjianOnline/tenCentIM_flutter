import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChartController extends GetxController {
  
  /* 建立视图层和控制器关联 */
  RxString titleName = " ".obs;

  /* 输入框动态变量 */
  TextEditingController chartInputController = TextEditingController();
  RxInt chartInputIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
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


}
