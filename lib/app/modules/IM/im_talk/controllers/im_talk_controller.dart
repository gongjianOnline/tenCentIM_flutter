import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImTalkController extends GetxController {
  //TODO: Implement ImTalkController

  RxString dialogueName = "龚箭".obs;

  RxInt emoteStatus = 0.obs;

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

  // 点击关闭键盘
  void hideKeyboard(BuildContext context) {
    print("111");
    emoteStatus.value = 0;
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    
  }

}
