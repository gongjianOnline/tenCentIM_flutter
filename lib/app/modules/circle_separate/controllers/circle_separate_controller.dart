import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CircleSeparateController extends GetxController {
  /* getx引用展位 */
  RxString titleName = "南开大学网络教育学院".obs;
  /* 滚动条控制器 */
  ScrollController listViewController = ScrollController();
  /* 是否显示抬头 */
  RxBool isHeader = false.obs;

  @override
  void onInit() {
    super.onInit();
    listViewController.addListener(_scrollListener);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _scrollListener(){
    double scrollHeight = listViewController.offset;
    if( scrollHeight > 160 ){
      isHeader.value = true;
    }else{
      isHeader.value = false;
    }
  }


}
